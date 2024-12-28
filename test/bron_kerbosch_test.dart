import 'package:clique/clique.dart';
import 'package:test/test.dart';

void main() {
  group('BronKerbosch', () {
    test('empty graph', () {
      final graph = <int, Set<int>>{};

      expect(graph.maximalCliques(), []);
      expect(graph.maximumClique(), <int>{});
    });

    test('single item graph', () {
      final graph = {1: <int>{}};

      expect(graph.maximalCliques(), [
        {1},
      ]);
      expect(graph.maximumClique(), {1});
    });

    test('single edge', () {
      final graph = {
        1: {2},
        2: {1},
      };
      expect(
          graph.maximalCliques(),
          equals([
            {1, 2}
          ]));
      expect(graph.maximumClique(), equals({1, 2}));
    });

    test('chain graph', () {
      final graph = {
        1: {2},
        2: {1, 3},
        3: {2, 4},
        4: {3, 5},
        5: {4},
      };

      expect(graph.maximalCliques(), [
        {1, 2},
        {2, 3},
        {3, 4},
        {4, 5},
      ]);
      expect(graph.maximumClique().length, equals(2));
    });

    /// Example from the Wikipedia article:
    /// https://en.wikipedia.org/wiki/Bron%E2%80%93Kerbosch_algorithm#Example
    test('Wikipedia example', () {
      final graph = {
        1: {2, 5},
        2: {1, 3, 5},
        3: {2, 4},
        4: {3, 5, 6},
        5: {1, 2, 4},
        6: {4}
      };

      expect(graph.maximalCliques(), [
        {1, 2, 5},
        {3, 2},
        {3, 4},
        {4, 5},
        {4, 6}
      ]);
      expect(graph.maximumClique(), {1, 2, 5});
    });

    test('two disconnected vertices', () {
      final graph = {
        1: <int>{},
        2: <int>{},
      };
      expect(
          graph.maximalCliques(),
          equals([
            {1},
            {2},
          ]));
      expect(graph.maximumClique().length, equals(1));
    });

    test('triangle graph', () {
      final graph = {
        1: {2, 3},
        2: {1, 3},
        3: {1, 2},
      };
      expect(
          graph.maximalCliques(),
          equals([
            {1, 2, 3}
          ]));
      expect(graph.maximumClique(), equals({1, 2, 3}));
    });

    test('square graph returns four cliques of size 2', () {
      final graph = {
        1: {2, 4},
        2: {1, 3},
        3: {2, 4},
        4: {1, 3},
      };
      expect(
        graph.maximalCliques(),
        unorderedEquals([
          {1, 2},
          {2, 3},
          {3, 4},
          {4, 1},
        ]),
      );
      expect(graph.maximumClique().length, equals(2));
    });

    test('fully connected graph', () {
      final graph = {
        1: {2, 3, 4, 5},
        2: {1, 3, 4, 5},
        3: {1, 2, 4, 5},
        4: {1, 2, 3, 5},
        5: {1, 2, 3, 4},
      };
      expect(
          graph.maximalCliques(),
          equals([
            {1, 2, 3, 4, 5}
          ]));
      expect(graph.maximumClique(), equals({1, 2, 3, 4, 5}));
    });

    test('bowtie graph', () {
      final graph = {
        1: {2, 3},
        2: {1, 3},
        3: {1, 2, 4, 5},
        4: {3, 5},
        5: {3, 4},
      };

      expect(
        graph.maximalCliques(),
        unorderedEquals([
          {1, 2, 3},
          {3, 4, 5},
        ]),
      );
      expect(graph.maximumClique().length, equals(3));
    });

    test('disconnected triangles', () {
      final graph = {
        1: {2, 3},
        2: {1, 3},
        3: {1, 2},
        4: {5, 6},
        5: {4, 6},
        6: {4, 5},
      };
      expect(
        graph.maximalCliques(),
        unorderedEquals([
          {1, 2, 3},
          {4, 5, 6},
        ]),
      );
      expect(graph.maximumClique().length, equals(3));
    });

    test('star graph', () {
      final graph = {
        1: {2, 3, 4, 5},
        2: {1},
        3: {1},
        4: {1},
        5: {1},
      };
      expect(
        graph.maximalCliques(),
        unorderedEquals([
          {1, 2},
          {1, 3},
          {1, 4},
          {1, 5},
        ]),
      );
      expect(graph.maximumClique().length, equals(2));
    });
  });
}
