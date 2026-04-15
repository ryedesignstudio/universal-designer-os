# Universal Designer OS

Personal workspace for design leadership, interview prep, and AI-assisted critique. **Project rules** live in `.cursorrules`; shared copy blocks and handoff standards live under `library/`.

## Repo layout

| Path | Role |
|------|------|
| `skills/designer/SKILL.md` | **Source of truth** for the Designer agent skill (edit here only). |
| `library/` | `what-to-say.md`, `handoff-specs.md`, and other reference docs. |
| `.cursorrules` | Cursor workspace rules (persona, `#dc` / `#wts` / `#research`). |

Skills are **not** duplicated under `.cursor/` or `.claude/` in git. After clone, run the installer once so Cursor and Claude Code both resolve the same folder.

## Install (symlinks)

From the repo root:

```bash
chmod +x ./install.sh
./install.sh
```

This creates:

- **`./.cursor/skills/designer`** → `skills/designer` (project-local; Cursor discovers the skill here)
- **`~/.claude/skills/designer`** → `skills/designer` (user-level; Claude Code discovers the skill here)

Re-run `./install.sh` after moving the repo or if a link breaks. Edit **`skills/designer/SKILL.md`** only; do not maintain a second copy under `.cursor` or `~/.claude`.

## Publish to GitHub

From `universal-designer-os/` (this folder is already its own git repo):

```bash
cd universal-designer-os
gh repo create universal-designer-os --private --source=. --remote=origin --push
```

Without GitHub CLI, create an empty repo in the browser, then:

```bash
git remote add origin https://github.com/YOUR_USER/universal-designer-os.git
git push -u origin main
```

Clone elsewhere, then run `./install.sh` again on that machine.
