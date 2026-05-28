/// Namespace for interval-endpoint vocabulary.
///
/// `Interval` names the descriptors that specify an interval's endpoints:
/// which end (`Interval.Bound`), inclusivity (`Interval.Boundary`), and the
/// traversal-terminal of a sequence (`Interval.Endpoint`). Together these form
/// the vocabulary for describing where an interval begins and ends and whether
/// those points are contained.
///
/// This is the namespace only; the `Interval` value type itself is out of
/// scope for this package — see ``Interval Primitives`` scope statement.
public enum Interval {}
