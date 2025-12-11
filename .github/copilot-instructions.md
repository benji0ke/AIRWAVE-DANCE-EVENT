# AIRWAVE — Copilot / AI Agent Instructions

Purpose
- This is a small static website for the Airwave Dance Event. It is served as plain HTML/CSS (and a background video) via an Nginx Docker image.

Big picture (what to know first)
- No backend: the site files under the repository root are copied into Nginx at `/usr/share/nginx/html` by `Dockerfile`.
- Primary entry: `index.html` (navigation links to `about.html`, `registration.html`, `schedule.html`, `Judges.html`, `Contact.html`, `gallery.html`).
- Static assets: `style.css`, `Diagrams/` (contains `background-video.mp4`), `Wireframes/`, and `Evidence/`.

Key files to reference
- [README.md](README.md#L1) — high-level description and Docker usage notes.
- [Dockerfile](Dockerfile#L1) — shows files are copied into Nginx image.
- [compose.yaml](compose.yaml#L1) — development run binds port `8080` → container `80`.
- [index.html](index.html#L1) and [style.css](style.css#L1) — primary templates and styling.

Developer workflows (concrete commands)
- Local quick preview: open `index.html` in your browser (file:// path) for quick layout checks.
- Docker (recommended, mirrors production):
  - Build image: `docker build -t web-skeleton .`
  - Start: `docker-compose up` (uses `compose.yaml` mapping `8080:80`).
  - Rebuild after edits: `docker-compose up --build` or re-run `docker build` then restart compose.

Project-specific conventions & patterns
- File-case matters: some pages use capitalized filenames (e.g., `Judges.html`), so preserve exact names when editing links or files.
- Minimal JS/templating: pages are plain HTML; avoid introducing complex tooling unless requested.
- Inline styles exist in `index.html` (small CSS blocks inside the file). Prefer adding rules to `style.css` for consistent edits.
- Media location: background video referenced at `Diagrams/background-video.mp4` — large media should stay in `Diagrams/` to avoid breaking links.

Integration & dependencies
- No runtime Python/Node server is present; `requirements.txt` is empty — ignore Python tooling unless adding new services.
- Site is served as static files; CI or deploy (GitHub Pages) likely expects the root HTML files.

How to implement common tasks (examples)
- Add a new page:
  1. Create `newpage.html` in the repo root.
  2. Add a `<li><a href="newpage.html">New Page</a></li>` entry to the `top-nav` list in `index.html` (or the layout file you modify).
  3. Rebuild the Docker image and run `docker-compose up --build` to preview.
- Replace the background video:
  - Place new file in `Diagrams/` and update the `<source>` `src` in `index.html`.
  - Rebuild Docker if testing via container.

What not to change without asking
- Do not change the Dockerfile copy path or compose port mapping unless coordinating with the maintainer — CI and README expect the current layout (`/usr/share/nginx/html` and port `8080`).
- Avoid renaming HTML files or changing relative link casing without updating all nav links.

If you need to add dynamic features
- Propose adding a small backend service (API) in a new folder and document required ports and Docker changes in a PR. Keep static site files separate from any new service folder.

If you find or want to merge existing AI guidance
- No repo-local AI agent rules were found. If adding or merging content from other sources, keep entries short, concrete, and reference the files above.

Questions for the maintainer
- Do you prefer all CSS moved into `style.css` and removing inline style blocks? 
- Are there plans to add a CI deploy step (GitHub Pages or Docker registry)?

— end —
