# Current Project State

- **Active Release**: `"Blood On The Floor We Dance"` music video
- **Artist**: GasWhatWeSmoke
- **Platform**: YouTube
- **Hosting**: GitHub Pages
- **Live YouTube ID**: `sb3vU8yWJJ4`
- **Live YouTube Link**: `https://www.youtube.com/watch?v=sb3vU8yWJJ4`

## Status Checklist

- [x] HTML redirect page created in `index.html`
- [x] Live YouTube ID inserted into the redirect logic
- [x] YouTube thumbnail tags added for social previews
- [x] Meta-ready YouTube fallback URL generated
- [x] Mobile flow changed to tap-to-open for better Meta webview compatibility
- [x] GitHub Pages URL placeholder replaced in `index.html`
- [ ] Push the folder to the GitHub repository
- [ ] Enable GitHub Pages in repo settings
- [ ] Paste the hosted URL into Meta Ads Manager

## Launch URLs

- **Hosted deep link for Meta Ads**:

```text
https://gaswhatwesmoke.github.io/blood-on-the-floor-we-dance-link/?utm_source=meta&utm_medium=paid_social&utm_campaign=blood_on_the_floor_we_dance
```

- **Direct tracked YouTube fallback**:

```text
https://www.youtube.com/watch?v=sb3vU8yWJJ4&utm_source=meta&utm_medium=paid_social&utm_campaign=blood_on_the_floor_we_dance&utm_content=meta_ad
```

## Supporting Files

- `index.html`: hosted redirect / interstitial page
- `generate_meta_youtube_link.ps1`: local link generator for alternate campaigns or UTMs
- `references.md`: source notes and platform caveats
