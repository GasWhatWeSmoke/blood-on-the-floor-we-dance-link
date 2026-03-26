# Artist & Asset Data

- **Artist Name**: GasWhatWeSmoke
- **Release Title**: `"Blood On The Floor We Dance"`
- **Primary Platform**: YouTube
- **YouTube Video ID**: `sb3vU8yWJJ4`
- **YouTube Link**: `https://www.youtube.com/watch?v=sb3vU8yWJJ4`
- **Campaign Use Case**: Meta ads traffic using a self-hosted Safari-escape workaround for Instagram/iPhone

## Source Notes

1. **YouTube Help: YouTube Universal Links**
   https://support.google.com/youtube/answer/7174035?hl=en
   Checked March 26, 2026.
   Google says that `youtube.com`, `m.youtube.com`, and `youtu.be` links can open directly in the YouTube app on iOS.

2. **Facebook Help Center: Access settings for viewing websites in the Facebook app**
   https://www.facebook.com/help/3984728191643454/
   Checked March 26, 2026.
   Meta documents that links can open inside Facebook's in-app browser, which is the main constraint for ad-click behavior.

3. **Branch Docs: Apple Universal Links**
   https://help.branch.io/developer-hub/docs/ios-universal-links
   Checked March 26, 2026.
   Branch notes that Facebook-style in-app webviews only support Universal Links conditionally, and that feed clicks often need a web page or Deepview before the user can launch the app.

4. **Branch Docs: Facebook Ads Deferred Deep Linking**
   https://help.branch.io/marketer-hub/docs/facebook-ads-deferred-deep-linking
   Checked March 26, 2026.
   Branch states that Facebook paid media can show a leave-Facebook modal and that this modal cannot be bypassed with URL-scheme tricks.

5. **GitHub: yt-deeplink-generator**
   https://github.com/ashkanRmk/yt-deeplink-generator
   Checked March 26, 2026.
   Representative GitHub deep-link generators still rely on a hosted redirect page with app/fallback logic.

## Practical Takeaway

- Google says normal YouTube links can open in the YouTube app on iOS.
- Branch documents that Instagram does not support Universal Links reliably inside its in-app browser, so a direct YouTube URL alone is not enough.
- The current repo workaround is to try escaping Instagram into Safari first, then rely on the normal YouTube link from Safari.
- This is a best-effort workaround, not a guaranteed platform bypass.
