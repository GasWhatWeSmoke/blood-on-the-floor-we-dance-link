# Project Identity: gaswhatwesmoke Deep Link

- **Goal**: Create and maintain a high-conversion deep link for the `"Blood On The Floor We Dance"` YouTube video.
- **Tech Stack**: Vanilla HTML/JavaScript, GitHub Pages.
- **Tone**: Professional, minimalist, and artist-centric.

## Live Asset

- **Artist**: GasWhatWeSmoke
- **Release Title**: Blood On The Floor We Dance
- **YouTube Video ID**: `sb3vU8yWJJ4`
- **YouTube Watch URL**: `https://www.youtube.com/watch?v=sb3vU8yWJJ4`
- **Tracked YouTube Fallback**: `https://www.youtube.com/watch?v=sb3vU8yWJJ4&utm_source=meta&utm_medium=paid_social&utm_campaign=blood_on_the_floor_we_dance`

## Technical Rules

- Use `window.location.href` with a 2.5-second fallback delay after the user taps the primary CTA.
- Prioritize an app-open attempt first: `youtube://watch?v=...` on iOS and `vnd.youtube:...` on Android.
- Preserve zero-dependency hosting so the page stays GitHub Pages friendly.
- Keep Open Graph and Twitter tags populated for link previews.

## Meta Ads Recommendation

- If you want the strongest chance of opening YouTube from a Meta ad click, use the hosted `index.html` page as the ad destination after deployment.
- If you want the safest immediate fallback, use the tracked YouTube watch URL directly.
- Expect Meta's in-app browser or a leave-app prompt to appear in some placements. That behavior is outside this page's control, which is why the page uses a tap-to-open CTA instead of an automatic app launch.

## Deployment Placeholder

- GitHub Pages URL for this repo: `https://gaswhatwesmoke.github.io/blood-on-the-floor-we-dance-link/`
- Final hosted ad destination pattern:

```text
https://gaswhatwesmoke.github.io/blood-on-the-floor-we-dance-link/?utm_source=meta&utm_medium=paid_social&utm_campaign=blood_on_the_floor_we_dance
```
