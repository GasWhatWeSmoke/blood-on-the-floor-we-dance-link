param(
    [string]$VideoUrl,
    [string]$VideoId,
    [Parameter(Mandatory = $true)]
    [string]$Campaign,
    [string]$Source = "meta",
    [string]$Medium = "paid_social",
    [string]$Content,
    [string]$Term
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-YouTubeVideoId {
    param(
        [string]$Url,
        [string]$Id
    )

    if ($Id) {
        return $Id.Trim()
    }

    if (-not $Url) {
        throw "Provide either -VideoUrl or -VideoId."
    }

    $uri = [System.Uri]$Url
    $urlHost = $uri.Host.ToLowerInvariant()

    if ($urlHost -eq "youtu.be") {
        return $uri.AbsolutePath.Trim("/")
    }

    if ($urlHost -like "*.youtube.com" -or $urlHost -eq "youtube.com") {
        $query = Get-QueryParameters -Query $uri.Query

        if ($query["v"]) {
            return $query["v"]
        }

        $segments = $uri.AbsolutePath.Trim("/") -split "/"
        if ($segments.Length -ge 2 -and ($segments[0] -eq "shorts" -or $segments[0] -eq "live")) {
            return $segments[1]
        }
    }

    throw "Could not extract a YouTube video ID from: $Url"
}

function Get-QueryParameters {
    param(
        [string]$Query
    )

    $parameters = @{}
    if ([string]::IsNullOrWhiteSpace($Query)) {
        return $parameters
    }

    foreach ($pair in $Query.TrimStart("?") -split "&") {
        if ([string]::IsNullOrWhiteSpace($pair)) {
            continue
        }

        $parts = $pair -split "=", 2
        $name = [System.Uri]::UnescapeDataString($parts[0])
        $value = if ($parts.Length -gt 1) {
            [System.Uri]::UnescapeDataString($parts[1])
        }
        else {
            ""
        }

        $parameters[$name] = $value
    }

    return $parameters
}

function Format-QueryParameter {
    param(
        [string]$Name,
        [string]$Value
    )

    return "{0}={1}" -f [System.Net.WebUtility]::UrlEncode($Name), [System.Net.WebUtility]::UrlEncode($Value)
}

$resolvedVideoId = Get-YouTubeVideoId -Url $VideoUrl -Id $VideoId
$canonicalUrl = "https://www.youtube.com/watch?v=$resolvedVideoId"
$queryParts = [System.Collections.Generic.List[string]]::new()
$queryParts.Add((Format-QueryParameter -Name "v" -Value $resolvedVideoId))
$queryParts.Add((Format-QueryParameter -Name "utm_source" -Value $Source))
$queryParts.Add((Format-QueryParameter -Name "utm_medium" -Value $Medium))
$queryParts.Add((Format-QueryParameter -Name "utm_campaign" -Value $Campaign))

if (-not [string]::IsNullOrWhiteSpace($Content)) {
    $queryParts.Add((Format-QueryParameter -Name "utm_content" -Value $Content))
}

if (-not [string]::IsNullOrWhiteSpace($Term)) {
    $queryParts.Add((Format-QueryParameter -Name "utm_term" -Value $Term))
}

$trackedUrl = "https://www.youtube.com/watch?" + ($queryParts -join "&")

$result = [ordered]@{
    video_id = $resolvedVideoId
    canonical_url = $canonicalUrl
    meta_tracked_url = $trackedUrl
    short_url = "https://youtu.be/$resolvedVideoId"
    optional_experimental_app_scheme = "youtube://watch?v=$resolvedVideoId"
    note = "Use meta_tracked_url as the default ad destination. The app-scheme URL is included only as a reference because Meta in-app browsers may not honor it."
}

$result | ConvertTo-Json
