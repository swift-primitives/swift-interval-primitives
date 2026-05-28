# ``Interval_Primitives``

Interval-endpoint vocabulary: the descriptors that specify where an interval
begins and ends and whether those points are contained.

## Scope

`swift-interval-primitives` provides the **interval-endpoint vocabulary**: the
small descriptor enums that specify an interval's endpoints along three
orthogonal axes —

- **which end** — ``Interval/Bound`` (lower / upper),
- **inclusivity** — ``Interval/Boundary`` (closed / open),
- **traversal-terminal** — ``Interval/Endpoint`` (start / end).

Each descriptor is a two-case enum carrying an involution (`opposite` / prefix
`!`), domain aliases, a `Value<Payload>` pairing, and `Codable`. Together they
are the vocabulary for *describing* an interval's edges.

### Core targets

- `Interval Primitive` — the `Interval` namespace (zero external deps).
- `Interval Bound Primitives` — `Interval.Bound` (which end).
- `Interval Boundary Primitives` — `Interval.Boundary` (inclusivity).
- `Interval Endpoint Primitives` — `Interval.Endpoint` (traversal-terminal).

### Out of scope

- **The `Interval` value type** — modeling an actual `Interval<Bound>` value
  (with its endpoints, containment tests, and the unbounded axis) is a later
  phase and a separate concern; it composes this vocabulary but is not part of
  it. → future `swift-interval` work (Phase 5 of the order-cluster program).
- **Order direction** (ascending / descending) — that concept lives in
  `swift-order-primitives` as `Order.Direction`; it is *not* an interval
  endpoint descriptor and does not belong here.
- **Algebraic (ℤ/Nℤ) structure on the descriptors** — the cyclic-group witness
  that makes each two-case descriptor a Z₂ group lives in the generic
  `swift-finite-algebra-primitives` bridge, conferred over `Finite.Enumerable`;
  it is not built into this package.

### Evaluation rule

Sub-target additions are evaluated against this scope. If a proposed addition
is OUT of scope (an interval value type, an order direction, an algebraic
witness), it lives in a sibling package, not in this one.
