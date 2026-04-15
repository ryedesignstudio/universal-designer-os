# What To Say — Library

**Use with trigger `#wts`.** Principles for conflict, UX quality defense, and executive alignment. The agent must output **Collaborative**, **Principled**, and **Executive** rewrites plus a **Coach’s Note**.

---

## 1. Mindset

| Situation | Stance |
|-----------|--------|
| Pushback on scope | Curious first: what constraint moved—time, risk, or clarity? |
| “Just ship it” | Align on **non-negotiables** (a11y, privacy, critical errors) vs. **deferrables** (polish). |
| Personal criticism | Depersonalize: feedback on **artifacts** and **criteria**, not character. |
| Exec impatience | Lead with **decision + impact**; attach detail as optional depth. |

---

## 2. Defending UX quality (without sounding precious)

**Anchor to:**

- **User outcome** — task success, time-on-task, error rate, support volume.
- **Brand trust** — consistency, accessibility, respectful copy, predictable states.
- **Cost of rework** — fixing a11y or error flows after launch vs. now.

**Template (internal monologue → spoken):**

> “I’m aligned on the date. The risk I see is [specific]. If we [shortcut], [user/business consequence]. My recommendation is [minimum viable quality] so we still hit [date]. If we cut that too, I need [exec/PM] to own the tradeoff explicitly.”

**Avoid:** “Users will hate it” without evidence. **Prefer:** “We increase support burden / failure rate because …”

---

## 3. Conflict de-escalation

1. **Mirror** — “Sounds like the worry is [X]. Did I get that right?”
2. **Separate positions from interests** — Position: “No new component.” Interest: “Ship fast / reduce maintenance.”
3. **Offer two-track response** — Track A: ideal. Track B: acceptable fallback with named tradeoffs.
4. **Time-box** — “Can we decide in this meeting, or who owns the decision by [date]?”

---

## 4. Executive alignment

**Exec message shape (≤120 words when possible):**

1. **Decision needed** (one sentence).
2. **Recommendation** (one sentence).
3. **Why now** — risk or opportunity.
4. **Options** — max three; label **recommended**.
5. **Ask** — approval, headcount, sequencing, or explicit acceptance of risk.

**Exec anti-patterns:** burying the lede, infinite nuance, design jargon without translation.

---

## 5. Cross-functional phrasing cheatsheet

| Audience | Lead with | End with |
|----------|-----------|----------|
| Engineering | Constraints, APIs, states, edge cases | Clear ask: spec delta, ticket split, spike |
| PM | User/job story, metrics, scope | Decision: MVP vs. phase 2 |
| Legal / policy | Plain-language behavior | Specific copy or flow to review |
| Data / analytics | Events needed for success criteria | Naming + funnel diagram reference |

---

## 6. Coach’s Note prompts (for the agent)

When writing the **Coach’s Note**, answer at least two of:

- Who **owns the decision**, and who is **influencer-only**?
- What **sequence** reduces thrash (research → prototype → eng spike)?
- When to **escalate** (missed non-negotiable, silent scope creep, unowned risk)?
- What **not to say** (absolute language, blame, unverifiable user claims)?

---

## 7. Rewrite rubric (for `#wts` outputs)

| Variant | Goal | Tone markers |
|---------|------|----------------|
| **Collaborative** | Preserve relationship, invite co-ownership | “We”, shared problem, one clarifying question |
| **Principled** | Hold quality bar with criteria | Named principles, tradeoffs, evidence hooks |
| **Executive** | Drive decision | Decision, impact, options, recommendation |

**Length guardrails:** Collaborative ≤180 words; Principled ≤220; Executive ≤120 unless user pastes a long context block.
