// Interval.Boundary.swift

public import Interval_Primitive
public import Pair_Primitives

extension Interval {
    /// Inclusivity of an interval endpoint: open or closed.
    ///
    /// Determines whether an endpoint value is included in the interval. Closed
    /// means included (≤ or ≥), open means excluded (< or >). Forms a Z₂ group
    /// under toggle. Combine with `Interval.Bound` for complete endpoint
    /// specification.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let boundary: Interval.Boundary = .closed
    /// print(boundary.isInclusive)   // true
    /// print(boundary.opposite)      // open
    /// ```
    public enum Boundary: Sendable, Hashable, CaseIterable {
        /// Endpoint is included (≤ or ≥).
        case closed

        /// Endpoint is excluded (< or >).
        case open
    }
}

// MARK: - Opposite

extension Interval.Boundary {
    /// Opposite boundary type (closed↔open).
    @inlinable
    public static func opposite(of boundary: Interval.Boundary) -> Interval.Boundary {
        switch boundary {
        case .closed: return .open
        case .open: return .closed
        }
    }

    /// Opposite boundary type (closed↔open).
    @inlinable
    public var opposite: Interval.Boundary {
        Interval.Boundary.opposite(of: self)
    }

    /// Returns the opposite boundary type.
    @inlinable
    public static prefix func ! (value: Interval.Boundary) -> Interval.Boundary {
        value.opposite
    }

    /// Opposite boundary type (closed↔open).
    @inlinable
    public var toggled: Interval.Boundary { opposite }
}

// MARK: - Properties

extension Interval.Boundary {
    /// Whether the boundary is inclusive (endpoint included in interval).
    @inlinable
    public var isInclusive: Bool { self == .closed }

    /// Whether the boundary is exclusive (endpoint excluded from interval).
    @inlinable
    public var isExclusive: Bool { self == .open }
}

// MARK: - Tagged Value

extension Interval.Boundary {
    /// A value paired with its boundary type.
    public typealias Value<Payload> = Pair<Interval.Boundary, Payload>
}

// MARK: - Codable

#if !hasFeature(Embedded)
    extension Interval.Boundary: Codable {}
#endif
