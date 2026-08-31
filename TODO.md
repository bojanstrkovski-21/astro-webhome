# To-do

Ideas queued up to explore one at a time, not yet implemented. See `memory/reference_chris_titus_website_repo.md` for where these came from.

- [ ] Add `public/_headers` for Cloudflare Pages — basic security headers (`X-Frame-Options`, `X-Content-Type-Options`, `Referrer-Policy`, `Permissions-Policy`) on `/*`, plus tiered `Cache-Control` (long-cache immutable for hashed `/_astro/*` build assets, shorter revalidate for fonts/images/wallpaper.jpg, no-cache for HTML).
- [ ] Add a `prefers-reduced-motion: reduce` media query to the global CSS in `Layout.astro` — force near-zero `animation-duration`/`transition-duration` for users who've opted out of motion (relevant now that there are several `transition:`/`transform:` effects: button press, theme toggle).
- [ ] Set `color-scheme: dark` / `color-scheme: light` alongside the `[data-theme="solid"|"transparent"]` custom properties in `Layout.astro`, so the browser themes its own native form controls/scrollbars to match — currently unset.
