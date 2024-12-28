import 'package:clique/clique.dart';
import 'package:test/test.dart';

void main() {
  group('empty graph', () {
    final graph = <int, Set<int>>{};

    test('Maximum clique', () {
      expect(graph.maximumClique(), <int>{});
    });

    test('Maximal cliqus', () {
      expect(graph.maximalCliques(), []);
    });
  });

  group('single item graph', () {
    final graph = {1: <int>{}};

    test('Maximum clique', () {
      expect(graph.maximumClique(), {1});
    });

    test('Maximal cliqus', () {
      expect(graph.maximalCliques(), [
        {1}
      ]);
    });
  });

  /// Example from the Wikipedia article:
  /// https://en.wikipedia.org/wiki/Bron%E2%80%93Kerbosch_algorithm#Example
  group('Wikipedia example', () {
    final graph = {
      1: {2, 5},
      2: {1, 3, 5},
      3: {2, 4},
      4: {3, 5, 6},
      5: {1, 2, 4},
      6: {4}
    };

    test('Maximum clique', () {
      expect(graph.maximumClique(), {1, 2, 5});
    });

    test('Maximal cliques', () {
      expect(graph.maximalCliques(), [
        {1, 2, 5},
        {3, 2},
        {3, 4},
        {4, 5},
        {4, 6}
      ]);
    });
  });
}
