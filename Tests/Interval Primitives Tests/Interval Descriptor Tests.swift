// Interval Descriptor Tests.swift

import Interval_Primitives_Test_Support
import Testing

@testable import Interval_Primitives

// MARK: - Bound

@Suite
struct `Interval Bound` {
    @Test
    func `opposite swaps lower and upper`() {
        #expect(Interval.Bound.lower.opposite == .upper)
        #expect(Interval.Bound.upper.opposite == .lower)
        #expect(!Interval.Bound.lower == .upper)
    }

    @Test
    func `aliases resolve`() {
        #expect(Interval.Bound.min == .lower)
        #expect(Interval.Bound.max == .upper)
        #expect(Interval.Bound.left == .lower)
        #expect(Interval.Bound.right == .upper)
    }

    @Test
    func `case iterable`() {
        #expect(Interval.Bound.allCases == [.lower, .upper])
    }
}

// MARK: - Boundary

@Suite
struct `Interval Boundary` {
    @Test
    func `opposite swaps closed and open`() {
        #expect(Interval.Boundary.closed.opposite == .open)
        #expect(Interval.Boundary.open.toggled == .closed)
        #expect(!Interval.Boundary.closed == .open)
    }

    @Test
    func `inclusivity`() {
        #expect(Interval.Boundary.closed.isInclusive)
        #expect(Interval.Boundary.open.isExclusive)
    }
}

// MARK: - Endpoint

@Suite
struct `Interval Endpoint` {
    @Test
    func `opposite swaps start and end`() {
        #expect(Interval.Endpoint.start.opposite == .end)
        #expect(Interval.Endpoint.end.opposite == .start)
        #expect(!Interval.Endpoint.start == .end)
    }

    @Test
    func `aliases resolve`() {
        #expect(Interval.Endpoint.first == .start)
        #expect(Interval.Endpoint.last == .end)
        #expect(Interval.Endpoint.head == .start)
        #expect(Interval.Endpoint.tail == .end)
    }
}
