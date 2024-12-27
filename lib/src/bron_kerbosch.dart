extension BronKerbosch<T> on Map<T, Set<T>> {
  /// Returns the maximum clique found on the graph.
  ///
  /// The underyling map keys should represent vertices/nodes in the graph, and
  /// the values should represent the set of edges.
  Set<T> maximumClique() {
    return maximalCliques().reduce(
        (value, element) => (value.length > element.length) ? value : element);
  }

  /// Returns a list of maximal cliques found on the graph.
  ///
  /// The underyling map keys should represent vertices/nodes in the graph, and
  /// the values should represent the set of edges.
  List<Set<T>> maximalCliques() {
    List<Set<T>> cliques = [];
    _internalBronKerbosch<T>(this, {}, keys.toSet(), {}, cliques);
    return cliques;
  }
}

/// Internal implementation of the Bron-Kerbosh pivoting algorithm.
void _internalBronKerbosch<T>(
    Map<T, Set<T>> graph, Set<T> r, Set<T> p, Set<T> x, List<Set<T>> cliques) {
  if (p.isEmpty && x.isEmpty) {
    cliques.add(r);
    return;
  }

  final pivot = p.union(x).first;

  for (final vertex in p.difference(graph[pivot]!)) {
    _internalBronKerbosch(
        graph,
        r.union({vertex}),
        p.intersection(graph[vertex]!),
        x.intersection(graph[vertex]!),
        cliques);

    p.remove(vertex);
    x.add(vertex);
  }
}
