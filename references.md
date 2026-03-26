# Artist & Asset Data

- **Artist Name**: GasWhatWeSmoke
- **Release Title**: `"Blood On The Floor We Dance"`
- **Primary Platform**: YouTube
- **YouTube Video ID**: `sb3vU8yWJJ4`
- **YouTube Link**: `https://www.youtube.com/watch?v=sb3vU8yWJJ4`
- **Campaign Use Case**: Meta ads traffic to a YouTube video with app-first behavior and browser fallback

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

## Practical Takeaway

- The safest immediate ad destination is a tracked HTTPS YouTube watch URL.
- The best self-hosted compromise is the GitHub Pages `index.html` page, which gives the user a clear tap target to open YouTube and then falls back to the tracked watch page.
- If Meta placement behavior becomes the bottleneck, the next step is a smart-link platform such as Branch or URLgenius rather than more aggressive custom-scheme hacks.
