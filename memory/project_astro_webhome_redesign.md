---
name: project-astro-webhome-redesign
description: State of the astro-webhome wallpaper/solid theme redesign as of 2026-08-31 — glass buttons, unified frames, header/search merge
metadata:
  type: project
---

As of 2026-08-31, did a full visual redesign pass on both themes of the astro-webhome bookmark dashboard (repo: `d:\My Backups\Bojan\astro-webhome`, deployed via Cloudflare Pages).

**What changed**, in order:
1. Pulled in a prior "buttons redesign" commit (`e0d518e upd buttons and headers`) that local had been behind on.
2. Moved the search bar out of `index.astro` page content and into `Layout.astro`'s shared `<nav>` as a second row (`.nav-search-row`) — now shows on every page, not just Home.
3. Restyled `.link-item`/`.service-button` as frosted-glass "keycaps" on the wallpaper (`transparent`) theme: translucent gradient, `backdrop-filter: blur(14px) saturate(140%)`, light border, soft shadow, scale-down press effect (not a vertical slide — user explicitly rejected the slide-down/toggle feel).
4. Consolidated per-button-group frames into one frame per section: `.groups-container` (home page) or `.group`/`.button-grid` (other pages) is the single glass panel; individual `.group` divs inside `.groups-container` are plain cells, not their own mini-frames. `.group-header` titles are centered and live inside the same frame as their button grid, no separate pill background.
5. Established a "squared meeting corners + visible gap" pattern between the nav header and whatever sits below it (search row or next frame) — both themes duplicate this per `[data-theme]` block.
6. Mirrored the entire above structure to the `solid` theme too (same frame/title/button treatment, minus `backdrop-filter` since there's no wallpaper to blur).
7. Normalized the GitHub/GitLab link labels in `linux.astro`'s `gitlabGithub` array to one consistent `PascalCaseUsername Platform` style, fixing a mislabeled entry (`Kiro-iso` → `KiroDubes`, matching the real username) and a duplicate-label ambiguity (`Chaotic Git-Repo` used for two different URLs → `ChaoticAUR Repo` / `ChaoticAUR GitHub`).
8. Fixed `git-push.ps1`: it used to manually prompt for a GitHub username + PAT and embed them in the push URL every time, even though the repo's `credential.helper = manager` already handles auth transparently. Simplified to a plain `git push origin main`, no more credential prompts.

**Why**: user is iterating live on the site's visual design via conversational back-and-forth, one small tweak at a time, on both a local dev server and eventually pushed to `main` (no PR workflow observed — pushes go straight to `main`).

**How to apply**: Full details of the current frame/button/theme conventions are written into the project's own `CLAUDE.md` (Styling section) — read that first for anything touching Layout.astro's CSS, rather than re-deriving from scratch. See also [[feedback-verify-css-selectors-hit-real-dom]] and [[feedback-scope-then-mirror-themes]].
