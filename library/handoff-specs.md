# Handoff Specs — Library

Engineering-ready standards for **accessibility**, **state management**, and **design tokens**. Use for `#dc` State Audit sections and any design–dev handoff.

---

## 1. Accessibility — WCAG 2.1 baseline (AA)

**Default:** target **WCAG 2.1 Level AA** for all customer-facing UI. Document exceptions with **owner + risk acceptance**.

### 1.1 Perceivable

- **Color:** contrast ≥ **4.5:1** normal text, ≥ **3:1** large text (18pt+ regular or 14pt+ bold) and UI components/graphical objects where applicable.
- **Non-color cues:** never rely on color alone for state (error/success/link); pair with icon, text, pattern, or position.
- **Resize:** content usable at **200% zoom** without loss of essential function (prefer responsive/reflow over clipped fixed layouts).
- **Images/media:** meaningful images have **alt**; decorative images marked ignored by AT; video/audio have captions/transcripts when in scope.

### 1.2 Operable

- **Keyboard:** all interactive controls reachable and operable; visible **focus order** matches reading order; **focus visible**.
- **Targets:** touch targets ≥ **44×44 CSS px** where platform HIG does not supersede with equivalent safe exceptions (document exceptions).
- **Motion:** respect **`prefers-reduced-motion`**; provide reduced variant or disable non-essential animation.

### 1.3 Understandable

- **Labels:** inputs have programmatic **name**; groups use `fieldset`/`legend` or `aria-labelledby`.
- **Errors:** errors identified in text; guidance is **specific** (what failed, how to fix), not generic “invalid”.
- **Language:** page `lang` set; language changes marked for fragments when applicable.

### 1.4 Robust

- Valid, semantic structure; ARIA **only** where native HTML insufficient; verify with **keyboard + screen reader** smoke on core flows.

### Handoff checklist (copy into tickets)

```markdown
- [ ] Color contrast verified for text & interactive states (default/hover/focus/disabled)
- [ ] Focus order and focus styles defined for all custom components
- [ ] Hit targets ≥ 44px (or documented exception)
- [ ] prefers-reduced-motion variant
- [ ] Error text: specific, associated with field, not color-only
```

---

## 2. State management — Empty / Loading / Error

Every **data-bound surface** specifies all four: **default (ideal)**, **empty**, **loading**, **error**. Add **edge** where data can be partial or ambiguous.

### 2.1 Empty

Define **first-use** vs. **cleared** vs. **no results**:

| Subtype | UX expectations |
|---------|-----------------|
| First-use | Explain value; primary CTA to create/import/connect |
| No results | Clarify filters; offer reset; avoid dead ends |
| Permission empty | Explain *why* empty; CTA to enable access |

**Copy:** instructional, human; avoid blame (“You have no friends”) → prefer neutral guidance.

### 2.2 Loading

| Pattern | When to use |
|---------|-------------|
| **Skeleton** | Known layout; content shape stable; avoids layout jump |
| **Spinner / progress** | Unknown duration; single blocking action; file uploads |
| **Optimistic UI** | Reversible fast actions; must include undo/reconcile path |

**Rules:** show loading **within 100ms** of perceived wait; avoid double spinners; preserve scroll position where possible.

### 2.3 Error

Classify in specs:

| Class | User-facing behavior |
|-------|----------------------|
| **Recoverable** | Inline message + retry / fix |
| **Session/auth** | Re-auth path; preserve unsaved work if feasible |
| **Fatal / unknown** | Friendly summary + support/reference id; log detail server-side |

**Never:** empty screen on error. **Always:** next step or diagnostic hook for internal builds.

### 2.4 Edge cases (minimum set)

- **Long strings** — truncation policy + expand/tooltip; RTL mirroring noted
- **Slow network** — timeouts; retry backoff; stale data labeling if applicable
- **Concurrent edits** — conflict message; refresh or merge policy
- **Rate limit** — clear wait or reduce scope

### State table template (for specs)

| State | Trigger | UI | Primary action | Analytics (optional) |
|-------|---------|----|----------------|----------------------|
| Ideal | data OK | … | … | … |
| Empty | no data | … | … | … |
| Loading | fetch | skeleton/spinner | cancel? | … |
| Error | 4xx/5xx | … | retry / contact | … |

---

## 3. Tokens & visual consistency

### 3.1 Token usage

- **No magic numbers** in handoff: spacing, radius, type scale, color, elevation map to **design tokens** (name + value in dev mode).
- **Semantic tokens** preferred over raw palette (`color.text.primary` vs. `#121212`) unless documenting migration.
- **States** tokenized: `hover`, `pressed`, `focus`, `disabled`, `selected` — each defined or inherited explicitly.

### 3.2 Typography

- Document **type ramp** (roles → token → weight/size/line-height).
- Truncation: **max lines** + ellipsis rules; dynamic type behavior if mobile.

### 3.3 Layout & motion

- **Grid / breakpoints:** specify behavior per breakpoint; avoid “desktop only” without tablet/mobile stance.
- **Motion:** duration/easing tokens; reduced-motion alternative noted.

### 3.4 Assets

- **Icons:** SVG preferred; `aria-hidden` if decorative; `title`/`aria-label` if informative.
- **Imagery:** aspect ratios + focal point for responsive crops.

---

## 4. One-page handoff order (recommended)

1. User/job context + success metric  
2. Flow diagram or numbered steps  
3. Component inventory (variants + props)  
4. State table (Empty / Loading / Error / edges)  
5. Token table (new vs. existing)  
6. Accessibility notes (focus, ARIA, contrast)  
7. Open questions / risks  

This file is the **quality bar** for those sections, especially under `#dc`.
