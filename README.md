# dart_clique
Implementation of the Bron–Kerbosch maximal cliques algorithm in Dart.

## Features

Find a return the maximum clique, as well as all maximal cliques.

## Usage

This library currently adds extension methods for the `Map<T, Set<T>>` type,
which is a common representation for a graph.

```dart
import 'package:clique/clique.dart';

Map<int, Set<int>> myGraph = {
  1: {2},
  2: {1},
};

final maximumClique = myGraph.maximumClique();
```

## Additional information

Please file a feature request if you would like support for additional graph
data structure types.
