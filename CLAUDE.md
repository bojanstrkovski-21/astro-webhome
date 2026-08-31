# astro-webhome

Personal bookmark/dashboard homepage built with Astro 7 (static output, deployed via Cloudflare Pages — see `wrangler.toml`).

## Pages

- `index.astro` — home: email/info/cloud-storage/web-app link groups (search bar lives in the shared header, see below)
- `e-servisi.astro` — grid of government e-service buttons
- `institucii.astro` — ministries/institutions/banks, tabbed
- `linux.astro` — distro/news/forum/github links, tabbed

The search bar (multi-engine dropdown + input + button) is **not** page content — it's markup in `Layout.astro`'s `<nav>`, rendered as a second row (`.nav-search-row`) under the logo/tabs row, so it appears in the header on every page. `performSearch()` and the Enter-key handler are defined globally in Layout.astro's inline script and just look up `#search-input`/`#search-engine` by ID.

## Styling

Almost all CSS lives in one `<style is:global>` block in `src/layouts/Layout.astro`. Pages only provide markup/data arrays; don't duplicate styling in page-level `<style>` blocks unless it's truly page-specific (e.g. the `.button-grid` responsive column counts in `e-servisi.astro`).

### Color theme

Raw Everforest medium-dark palette vars (`--bg-dim`, `--bg0`..`--bg5`, `--fg`, `--green`, etc.) are defined once in `:root`. Semantic vars (`--primary-bg`, `--card-bg`, `--accent-bg`, `--border-color`, etc.) are redefined per `[data-theme]` and should be used in component CSS instead of the raw palette vars, except where a component intentionally needs an exact Everforest tone (e.g. the keycap button bevel).

Two themes toggled via `data-theme` attribute on `<html>`, persisted to `localStorage['theme']`:

- `solid` — solid-bg.jpg background, opaque (non-blurred) cards (sun icon)
- `transparent` — wallpaper.jpg background, translucent/blurred cards (moon icon)

Toggle with `window.switchTheme('solid'|'transparent')` (exposed globally by the inline script in Layout.astro).

### Font toggle

Independent of color theme. `data-font` attribute on `<html>`, persisted to `localStorage['font']`:

- `inter` — self-hosted via `@fontsource/inter` (400/600/700 imported in Layout.astro frontmatter)
- `meslo` — MesloLGS Nerd Font, self-hosted `.ttf` files in `public/fonts/meslo/`

Component text that should respect the toggle must use `font-family: var(--font-family)`, not a hardcoded font stack. Toggle with `window.switchFont('inter'|'meslo')`.

### Layout: single frame per section

Each content block (home page category, an Institucii/Linux tab, the E-servisi grid) is one glass/card frame (`.groups-container`, `.group`, or `.button-grid`), not one frame per sub-item. On the home page specifically, `.groups-container` is the outer frame and the individual `.group` divs inside it are plain layout cells (`.groups-container .group` strips the frame back off so it isn't double-framed). A `.group-header` title, if present, sits inside the same frame as its `.links-grid`, centered, with no background/border of its own — it's part of the frame, not a separate pill.

The nav bar and whatever sits directly below it (the search row, or the next frame down) are meant to read as adjacent-but-separate panels with a visible gap: nav's bottom corners and the next element's top corners are both squared off, with a real margin between them (not butted together, not both fully rounded). This pairing is duplicated per-theme (`[data-theme="transparent"] .navigation` / `[data-theme="solid"] .navigation`, etc.) — when adjusting one theme's gap/frame values, check whether the other theme's equivalent block needs the same change.

The search bar itself is *inside* the nav element (`.nav-search-row`, a second row under the logo/tabs row) — it is not a separate box that needs merging with the header; that structural move already happened.

### Keycap buttons

`.link-item` and `.service-button` (and `.search-btn`, on the older unscoped base style) share a rounded-keycap visual style: the clickable element wraps `<span><i>Label</i></span>` — `span` is the visible surface, `i` is the text. Keep this wrapper; earlier experiments collapsing it to plain text content broke the layering.

The two themes now render buttons differently, each with its own explicit `[data-theme="..."]` block (search for "Frosted glass keycap style" / "Same button shape" in Layout.astro):

- `transparent` — frosted glass: low-opacity gradient background, `backdrop-filter: blur(14px) saturate(140%)`, light border, soft outer shadow. Do **not** add `overflow: hidden` to `.link-item span`/`.service-button span` here — it clips the button's own box/shadow, not just an inner pseudo-element (learned the hard way; keep `overflow: visible`).
- `solid` — same shape/press mechanics, same translucent gradient, but no `backdrop-filter` (nothing behind it to blur, so it'd be a no-op).

Both themes' button blocks are meant to be edited in tandem — if one changes shape (radius, shadow, active-state transform), mirror it in the other unless the ask is explicitly theme-specific.

A reference snapshot of an earlier tuned iteration is kept at `src/styles/keycap-buttons.backup.css` (not imported — for diffing/reference only; predates the current per-theme split).

## Commands

- `npm run dev` — dev server (default port 4321)
- `npm run build` — static build to `dist/`
- `npm run preview` — preview the built output
- `git-push.ps1` — add/commit/push helper. Relies on the repo's `credential.helper = manager` (Git Credential Manager) for auth — it does **not** prompt for a username/PAT. If push auth ever breaks, fix it at the credential-manager/`git config` level, not by adding manual credential prompts back into this script.

## To-dos and memory

`TODO.md` at the repo root tracks queued improvements not yet implemented. `memory/` at the repo root mirrors Claude's persistent memory for this project (kept in sync with the tool's own memory store — see `memory/feedback_sync_project_memory_mirror.md`).

When a `TODO.md` item is finished, remove its line from `TODO.md` (don't just check it off and leave it) and update/remove whatever memory entry referenced it as outstanding, so both files always reflect current state, not history. Completed work belongs in git history and commit messages, not in a growing to-do list.

## Verifying visual changes

This is a static/CSS-heavy site — after CSS changes, build (`npm run build`) to catch syntax errors, then visually verify with a headless browser since there's no test suite. System Chromium is available at `/usr/bin/chromium`; Playwright isn't a project dependency, so install it ad hoc (e.g. in `/tmp`) rather than adding it to `package.json`.
