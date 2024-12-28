import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:clique/clique.dart';

// Benchmark using a worst-case single line graph, where all maximal cliques
// have size 2, and every vertex is in one clique.
class BronKerboschBenchmark extends BenchmarkBase {
  BronKerboschBenchmark() : super('BronKerbosch');

  static void main() {
    BronKerboschBenchmark().report();
  }

  final Map<int, Set<int>> graph = {};
  late List<Set<int>> maximalCliques;

  // The benchmark code.
  @override
  void run() {
    maximalCliques = graph.maximalCliques();
  }

  // Not measured setup code executed prior to the benchmark runs.
  @override
  void setup() {
    for (int i = 0; i < 1000; i++) {
      final connections = <int>{};
      if (i > 0) connections.add(i - 1);
      if (i < 1000 - 1) connections.add(i + 1);

      graph[i] = connections;
    }
  }

  // Not measured teardown code executed after the benchmark runs.
  @override
  void teardown() {
    if (maximalCliques.length != 999) {
      throw StateError('Return value was incorrect');
    }
  }

  // To opt into the reporting the time per run() instead of per 10 run() calls.
  // @override
  // void exercise() => run();
}

void main() {
  BronKerboschBenchmark.main();
}
