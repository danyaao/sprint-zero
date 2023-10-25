import 'dart:math';

abstract class KnapsackProblem {
  static List<int> getSolution({
    required int n,
    required int w,
    required List<int> weights,
    required List<int> prices,
  }) {
    final pack = List<List<int>>.generate(
      n + 1,
      (index) => List<int>.filled(w + 1, 0),
    );

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= w; j++) {
        if (j >= weights[i - 1]) {
          pack[i][j] = max(
            pack[i - 1][j],
            pack[i - 1][j - weights[i - 1]] + prices[i - 1],
          );
        } else {
          pack[i][j] = pack[i - 1][j];
        }
      }
    }

    final result = <int>[];
    _getResult(
      pack: pack,
      weights: weights,
      i: n,
      j: w,
      result: result,
    );

    return result;
  }

  static void _getResult({
    required List<List<int>> pack,
    required List<int> weights,
    required int i,
    required int j,
    required List<int> result,
  }) {
    if (pack[i][j] == 0) {
      return;
    }

    if (pack[i - 1][j] == pack[i][j]) {
      _getResult(
        pack: pack,
        weights: weights,
        i: i - 1,
        j: j,
        result: result,
      );
    } else {
      _getResult(
        pack: pack,
        weights: weights,
        i: i - 1,
        j: j - weights[i - 1],
        result: result,
      );
      result.add(i - 1);
    }
  }
}
