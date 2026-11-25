---
name: sequential-thinking
description: Work through complex problems in sequential steps with revision, branching, hypothesis generation, and verification, then report a verified conclusion and the evidence behind it. Use for multi-step analysis, planning that may need course correction, and diagnosis where several explanations are possible.
---

# Sequential Thinking

## Overview

A structured, reflective problem-solving process that breaks complex problems into a
sequence of steps. Each step can build on, question, or revise earlier ones as
understanding deepens.

**Core principle:** Think step by step. Revise freely. Verify before concluding.

The steps are your working, and they stay in your own reasoning. The response
reports the result: the conclusion you verified and what supports it.

## When to Use

- Breaking down complex problems into steps
- Planning and design with room for revision
- Analysis that might need course correction
- Problems where the full scope is not clear initially
- Problems that require a multi-step solution
- Tasks that need to maintain context over multiple steps
- Situations where irrelevant information needs to be filtered out
- Decisions that involve weighing competing trade-offs
- Diagnosing a problem where several explanations are possible

The process is domain-independent. It is a generic reasoning sequence that you
transpose onto whatever problem you are facing — research, writing, planning,
operations, design, diagnosis, or a software task — by treating each step as
progress toward the answer in that domain's own terms.

## The Process

Work through Steps 1 to 5 in your own reasoning before you respond. Step 6 is the
response.

### Step 1: Estimate Scope

Estimate how many steps the problem needs. Adjust the estimate up or down as you
progress.

### Step 2: Work in Steps

Take the problem one step at a time. A step can be:

- A regular analytical step
- A revision of an earlier step
- A question about an earlier decision
- A realization that more analysis is needed
- A change in approach
- Hypothesis generation
- Hypothesis verification

At each step, set aside information that does not bear on the problem.

### Step 3: Revise When Needed

When an earlier step turns out to be wrong or incomplete, correct it and rework
whatever depended on it. Do not keep building on a step you no longer believe.

### Step 4: Branch When Needed

When more than one approach is plausible, follow each one far enough to compare
their outcomes, then continue with the one that holds up best.

### Step 5: Generate and Verify Hypotheses

When you have enough to form a hypothesis, test it against everything you have
established:

- Does it explain the evidence?
- Does it respect the constraints?
- Does anything contradict it?

If verification fails, return to working in steps. Do not force a broken
hypothesis. Repeat until a hypothesis holds.

### Step 6: Report the Result

Respond when a hypothesis has passed verification. Write for a reader who has to
trust the conclusion and act on it:

```
**Answer**
[The verified conclusion, stated directly]

**Basis**
[The evidence and facts the conclusion rests on]

**Alternatives set aside**
[Other explanations or options, each with what ruled it out]

**Checks**
[What the conclusion was tested against, and the outcome]

**Open questions**
[What is still uncertain, and what would settle it]
```

Report the result, not the route. The reader needs the conclusion and the grounds
for it, not an account of the steps that led there.

Scale the response to the problem. A small question needs only the answer and its
basis in a sentence or two, and a section with nothing in it is left out.

If no hypothesis can be verified with the information available, say so. Report
what you established, what is missing, and what would settle it.

## Rules

1. **Start with an initial estimate** of the steps needed, but adjust freely
2. **Question and revise** earlier steps whenever warranted
3. **Add more steps** if needed, even after reaching your initial estimate
4. **Ignore irrelevant information** — filter noise at each step
5. **Explore alternatives** when more than one approach is plausible
6. **Generate a hypothesis** when you have enough evidence
7. **Verify the hypothesis** against what you established before concluding
8. **Repeat** hypothesis-verification cycles until satisfied
9. **Express uncertainty** when present — do not present a guess as verified
10. **Report the result**, with what supports it, once it is verified

## Anti-Patterns

| Anti-Pattern | Correction |
|---|---|
| Answering before working through the steps | Work the problem through first, then respond |
| Building on a step you no longer believe | Correct it and rework what depended on it |
| Never revising | If nothing needed revision, you may not be thinking critically enough |
| Forcing a conclusion when verification fails | Return to working in steps instead |
| Ignoring alternatives when several approaches exist | Follow each far enough to compare them |
| Vague support like "this seems right" | Be specific: what evidence, and what it shows |
| Adjusting the estimate down to rush to finish | Add steps if the problem warrants them |
| Narrating your steps in the response | Report the conclusion and what supports it |
| Presenting an unverified guess as the answer | Say what is uncertain and what would settle it |

## Examples

The same process is shown below on two different problems. Each example shows the
response only: the steps, revisions, and branches behind it stayed in the working.
The structure of the response is identical; only the domain-specific content
changes. The second example transposes it onto a software development task.

### Example 1: a general problem

Given: "Our team keeps missing delivery dates. What should we change?"

```
**Answer**
Introduce a lightweight "definition of ready" check before any item is started,
and set an explicit limit on work in progress.

**Basis**
- Requirements changed mid-cycle on roughly half of recent items, so rework is
  the main source of delay.
- Several items are started before earlier ones finish, so a single change
  ripples across everything in flight.

**Alternatives set aside**
- Slow individual effort: items sit "in progress" for days with little movement,
  which points to queued work rather than slow work.
- Adding people or lengthening the cycle: the team can do neither.

**Checks**
- Rework: a readiness check settles requirements before work starts ✓
- Work in progress: an explicit cap limits the items a change can touch ✓
- Constraints: both are process changes that need no extra capacity ✓

**Open questions**
- Why requirements change mid-cycle is not yet known. If the changes come from
  outside the team, the readiness check needs the requesters' agreement to work.
```

### Example 2: the same process, transposed onto software development

Given: "Users intermittently get logged out. Why?"

```
**Answer**
Sessions are held in per-instance memory, and requests are not pinned to the
instance that holds the session. Move session state to a shared store so any
instance can serve any request. Sticky routing is a weaker stopgap.

**Basis**
- Logouts cluster right after deploys and during traffic spikes, the moments
  when more than one instance is serving requests.
- Sessions live in per-instance memory and routing is not pinned, so a request
  can reach an instance that never recorded the login.

**Alternatives set aside**
- Tokens expiring early: expiry would be spread evenly over time, not clustered
  around deploys and spikes.
- A race during token refresh: possible, but it does not explain the
  clustering. Revisit it only if logouts continue once sessions are shared.

**Checks**
- Intermittency: the outcome depends on which instance a request reaches ✓
- Clustering: deploys and spikes put more instances in play ✓
- No evidence contradicts it ✓

**Open questions**
- Not yet confirmed in production. Logging the serving instance on each logout
  would confirm it before the migration.
```

## After Concluding

Sequential thinking produces a verified conclusion — it does not carry out the work.
Once you have a verified answer, move to acting on it:

- Translate the conclusion into concrete next actions in the terms of your domain.
- Where the conclusion chose an approach or identified a cause, carry it out.
- Verify the conclusion holds in practice before considering it done.

What "carrying it out" means depends on the domain — enacting a plan, producing the
writing, applying the fix, building the chosen design. If your environment provides
dedicated skills for those follow-on steps, use them.
