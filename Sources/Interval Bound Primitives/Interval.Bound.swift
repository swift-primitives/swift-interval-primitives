// Interval.Bound.swift

public import Interval_Primitive
public import Pair_Primitives

extension Interval {
    /// Position of an interval endpoint: lower or upper.
    ///
    /// Identifies which end of an interval or range a value represents. Forms a
    /// Z₂ group under swap. Use when distinguishing minimum/maximum positions.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let limit: Interval.Bound = .lower
    /// print(limit.opposite)     // upper
    /// print(!limit)             // upper
    /// ```
    public enum Bound: Sendable, Hashable, CaseIterable {
        /// Lower bound (minimum, left endpoint).
        case lower

        /// Upper bound (maximum, right endpoint).
        case upper
    }
}

// MARK: - Opposite

extension Interval.Bound {
    /// Opposite bound (lower↔upper).
    @inlinable
    public static func opposite(of bound: Interval.Bound) -> Interval.Bound {
        switch bound {
        case .lower: return .upper
        case .upper: return .lower
        }
    }

    /// Opposite bound (lower↔upper).
    @inlinable
    public var opposite: Interval.Bound {
        Interval.Bound.opposite(of: self)
    }

    /// Returns the opposite bound.
    @inlinable
    public static prefix func ! (value: Interval.Bound) -> Interval.Bound {
        value.opposite
    }
}

// MARK: - Aliases

extension Interval.Bound {
    /// Alias for lower bound.
    public static var min: Interval.Bound { .lower }

    /// Alias for upper bound.
    public static var max: Interval.Bound { .upper }

    /// Alias for lower (left endpoint).
    public static var left: Interval.Bound { .lower }

    /// Alias for upper (right endpoint).
    public static var right: Interval.Bound { .upper }
}

// MARK: - Tagged Value

extension Interval.Bound {
    /// A value paired with its bound position.
    public typealias Value<Payload> = Pair<Interval.Bound, Payload>
}

// MARK: - Codable

#if !hasFeature(Embedded)
    extension Interval.Bound: Codable {}
#endif
