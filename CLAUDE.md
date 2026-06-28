# astro-webhome

Personal bookmark/dashboard homepage built with Astro 7 (static output, deployed via Cloudflare Pages — see `wrangler.toml`).

## Pages

- `index.astro` — home: search bar (multi-engine dropdown) + email/info/cloud-storage/web-app link groups
- `e-servisi.astro` — grid of government e-service buttons
- `institucii.astro` — ministries/institutions/banks, tabbed
- `linux.astro` — distro/news/forum/github links, tabbed

## Styling

Almost all CSS lives in one `<style is:global>` block in `src/layouts/Layout.astro`. Pages only provide markup/data arrays; don't duplicate styling in page-level `<style>` blocks unless it's truly page-specific (e.g. the `.button-grid` responsive column counts in `e-servisi.astro`).

### Color theme

Raw Everforest medium-dark palette vars (`--bg-dim`, `--bg0`..`--bg5`, `--fg`, `--green`, etc.) are defined once in `:root`. Semantic vars (`--primary-bg`, `--card-bg`, `--accent-bg`, `--border-color`, etc.) are redefined per `[data-theme]` and should be used in component CSS instead of the raw palette vars, except where a component intentionally needs an exact Everforest tone (e.g. the keycap button bevel).

Two themes toggled via `data-theme` attribute on `<html>`, persisted to `localStorage['theme']`:
- `solid` — flat colors, no image (sun icon)
- `transparent` — wallpaper.jpg background, translucent/blurred cards (moon icon)

Toggle with `window.switchTheme('solid'|'transparent')` (exposed globally by the inline script in Layout.astro).

### Font toggle

Independent of color theme. `data-font` attribute on `<html>`, persisted to `localStorage['font']`:
- `inter` — self-hosted via `@fontsource/inter` (400/600/700 imported in Layout.astro frontmatter)
- `meslo` — MesloLGS Nerd Font, self-hosted `.ttf` files in `public/fonts/meslo/`

Component text that should respect the toggle must use `font-family: var(--font-family)`, not a hardcoded font stack. Toggle with `window.switchFont('inter'|'meslo')`.

### Keycap buttons

`.link-item`, `.service-button`, and `.search-btn` all share a "keyboard key" visual style (dark gradient frame + lighter inset bevel + press-down `:active` state), adapted from css-buttons.com's button #136. Markup pattern: the clickable element wraps `<span><i>Label</i></span>` — `span` is the bevel surface, `i` is the text. This is intentional and required for the bevel layering to paint correctly (an earlier `::before`-based version without the real `<span>` had a z-index stacking bug). Don't collapse this back to plain text content.

These button styles are theme-agnostic (no `[data-theme]` scoping) so they render identically on both themes.

A reference snapshot of one tuned iteration is kept at `src/styles/keycap-buttons.backup.css` (not imported — for diffing/reference only).

## Commands

- `npm run dev` — dev server (default port 4321)
- `npm run build` — static build to `dist/`
- `npm run preview` — preview the built output

## Verifying visual changes

This is a static/CSS-heavy site — after CSS changes, build (`npm run build`) to catch syntax errors, then visually verify with a headless browser since there's no test suite. System Chromium is available at `/usr/bin/chromium`; Playwright isn't a project dependency, so install it ad hoc (e.g. in `/tmp`) rather than adding it to `package.json`.
