import 'package:clique/clique.dart';

void main() {
  // Example graph from the Wikipedia article on cliques:
  // https://en.wikipedia.org/wiki/Clique_problem#Definitions
  final graph = {
    1: {2, 5},
    2: {1, 3, 5},
    3: {2, 4},
    4: {3, 5, 6},
    5: {1, 2, 4},
    6: {4}
  };

  print('Maximal cliques: ${graph.maximalCliques()}');
  // Maximal cliques: [{1, 2, 5}, {3, 2}, {3, 4}, {4, 5}, {4, 6}]

  print('Maximum clique: ${graph.maximumClique()}');
  // Maximum clique: {1, 2, 5}
}
