/// Extension methods to perform clique operations on generic maps.
extension BronKerbosch<T> on Map<T, Set<T>> {
  /// Returns the maximum clique found on the graph.
  ///
  /// The underyling map keys should represent vertices/nodes in the graph, and
  /// the values should represent the set of edges.
  Set<T> maximumClique() {
    final cliques = maximalCliques();
    if (cliques.isEmpty) return {};

    return cliques.reduce(
        (value, element) => (value.length > element.length) ? value : element);
  }

  /// Returns a list of maximal cliques found on the graph.
  ///
  /// The underyling map keys should represent vertices/nodes in the graph, and
  /// the values should represent the set of edges.
  List<Set<T>> maximalCliques() {
    if (isEmpty) return [];

    List<Set<T>> cliques = [];
    _internalBronKerbosch<T>(this, {}, keys.toSet(), {}, cliques);
    return cliques;
  }
}

/// Internal implementation of the Bron-Kerbosh pivoting algorithm.
/// https://en.wikipedia.org/wiki/Bron%E2%80%93Kerbosch_algorithm
///
/// Variable names have been mapped to increase their semantic value:
/// r -> current
/// p -> potential
/// x -> processed
void _internalBronKerbosch<T>(Map<T, Set<T>> graph, Set<T> current,
    Set<T> potential, Set<T> processed, List<Set<T>> cliques) {
  if (potential.isEmpty && processed.isEmpty) {
    cliques.add(current);
    return;
  }

  final pivot = potential.union(processed).first;

  for (final vertex in potential.difference(graph[pivot]!)) {
    _internalBronKerbosch(
        graph,
        current.union({vertex}),
        potential.intersection(graph[vertex]!),
        processed.intersection(graph[vertex]!),
        cliques);

    potential.remove(vertex);
    processed.add(vertex);
  }
}
