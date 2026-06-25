// Interval.Endpoint.swift

public import Interval_Primitive
public import Pair_Primitives

extension Interval {
    /// Position in a sequence: start or end.
    ///
    /// Identifies the beginning or ending position of a sequence, range, or
    /// linear structure. Forms a Z₂ group under swap. Use when distinguishing
    /// first/last positions in ordered collections.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let position: Interval.Endpoint = .start
    /// print(position.opposite)   // end
    /// print(!position)           // end
    /// ```
    public enum Endpoint: Sendable, Hashable, CaseIterable {
        /// Beginning of the sequence.
        case start

        /// End of the sequence.
        case end
    }
}

// MARK: - Opposite

extension Interval.Endpoint {
    /// Opposite endpoint (start↔end).
    @inlinable
    public static func opposite(of endpoint: Interval.Endpoint) -> Interval.Endpoint {
        switch endpoint {
        case .start: return .end
        case .end: return .start
        }
    }

    /// Opposite endpoint (start↔end).
    @inlinable
    public var opposite: Interval.Endpoint {
        Self.opposite(of: self)
    }

    /// Returns the opposite endpoint.
    @inlinable
    public static prefix func ! (value: Interval.Endpoint) -> Interval.Endpoint {
        value.opposite
    }
}

// MARK: - Aliases

extension Interval.Endpoint {
    /// Alias for start.
    public static var first: Interval.Endpoint { .start }

    /// Alias for end.
    public static var last: Interval.Endpoint { .end }

    /// Alias for start (head of list).
    public static var head: Interval.Endpoint { .start }

    /// Alias for end (tail of list).
    public static var tail: Interval.Endpoint { .end }
}

// MARK: - Tagged Value

extension Interval.Endpoint {
    /// A value paired with its endpoint position.
    public typealias Value<Payload> = Pair<Interval.Endpoint, Payload>
}

// MARK: - Codable

#if !hasFeature(Embedded)
    extension Interval.Endpoint: Codable {}
#endif
