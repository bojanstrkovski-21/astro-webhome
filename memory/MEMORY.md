# Memory Index

- [Bojan / astro-webhome](user_bojan_astro_webhome.md) — solo maintainer, iterates via small conversational CSS tweaks, pushes straight to main
- [astro-webhome overview](project_astro_webhome_overview.md) — what the project is, pages, theme/font toggle mechanics
- [astro-webhome redesign state](project_astro_webhome_redesign.md) — 2026-08-31: glass-button/unified-frame redesign both themes, git-push.ps1 fix, then (same day) page-title removal, Institucii/Linux tab redesign, search-btn per-theme parity, solid-theme background image + 10% transparency, CI lockfile/Node24 fixes
- [Keycap button history](project_astro_webhome_keycap_buttons.md) — origin/markup reasoning for `.link-item`/`.service-button`/`.search-btn`; superseded on theming details by the redesign entry above
- [Visual testing via headless Chromium](reference_astro_webhome_visual_testing.md) — playwright-core + system Chromium setup; `astro dev` daemonizes and binds IPv6-only, prefer `npm run preview --host 127.0.0.1` for screenshots
- [Iteration style for visual tweaks](feedback_astro_webhome_iteration_style.md) — exact pixel values, rapid iteration, apply literally without rounding/asking
- [Verify CSS selectors hit real DOM](feedback_verify_css_selectors_hit_real_dom.md) — `.navigation + *` silently hit empty `<main>`, not the visible content
- [Scope to active theme, then mirror on request](feedback_scope_then_mirror_themes.md) — default new visual work to the theme in discussion; wait for explicit "do the other theme too"
- [Keep this memory folder synced](feedback_sync_project_memory_mirror.md) — this project keeps a mirror of Claude's memory at `memory/` in the repo root; update both copies whenever memory changes
- [ChrisTitusTech/website reference](reference_chris_titus_website_repo.md) — sibling Astro/CF-Pages project; borrow `_headers`, reduced-motion CSS, `color-scheme` hint
- [Clean up completed to-dos](feedback_clean_up_completed_todos.md) — delete finished TODO.md lines and fix stale memory cross-references immediately, don't just check them off
