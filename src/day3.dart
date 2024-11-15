import 'dart:math';

import 'helpers.dart';
import 'test_data.dart';
import 'dart:math';

class MiningPoint {
  int x;
  int y;
  int depth;
  MiningPoint({
    required this.x,
    required this.y,
    required this.depth,
  });
}

class Day3 {
  static partA() {
    final data = TestData.day3PartA.split('\n');
    doMining(data);
  }

  static partB() {
    final data = TestData.day3PartB.split('\n');
    doMining(data);
  }

  static partC() {
    final data = TestData.day3PartC.split('\n');
    doMining(data);
  }

  static void incrementDepthOnChart(
      Map<Point<int>, int> chart, Point<int> key) {
    print(key);
    if (key.x == 141 && key.y == 4) {
      print('stop');
    }
    chart[key] = chart[key]! + 1;
  }

  static void doMining(List<String> data) {
    final miningChart = <Point<int>, int>{};
    for (var row = 0; row < data.length; row++) {
      for (var col = 0; col < data[row].length; col++) {
        miningChart[Point<int>(col, row)] = data[row][col] == '#' ? 1 : 0;
      }
    }
    displayMiningChart(miningChart);
    while (processMiningChartDiag(miningChart) > 0) {
      displayMiningChart(miningChart);
    }
    final blocks = miningChart.values.fold(0, (a, b) => a + b);
    print(blocks);
  }

  static int processMiningChartDiag(Map<Point<int>, int> chart) {
    int changesMade = 0;
    for (var key in chart.keys) {
      int x = key.x;
      int y = key.y;

      int currentDepth = chart[key]!;

      final up = chart[Point<int>(x, y - 1)] ?? 0;
      final down = chart[Point<int>(x, y + 1)] ?? 0;
      final left = chart[Point<int>(x - 1, y)] ?? 0;
      final right = chart[Point<int>(x + 1, y)] ?? 0;
      final upLeft = chart[Point<int>(x - 1, y - 1)] ?? 0;
      final downLeft = chart[Point<int>(x - 1, y + 1)] ?? 0;
      final upRight = chart[Point<int>(x + 1, y - 1)] ?? 0;
      final downRight = chart[Point<int>(x + 1, y + 1)] ?? 0;
      final diffUp = currentDepth - up;
      final diffDown = currentDepth - down;
      final diffLeft = currentDepth - left;
      final diffRight = currentDepth - right;
      final diffUpLeft = currentDepth - upLeft;
      final diffDownLeft = currentDepth - downLeft;
      final diffUpRight = currentDepth - upRight;
      final diffDownRight = currentDepth - downRight;
      final maxDiff = 0;

      if (diffUp <= maxDiff &&
          diffDown <= maxDiff &&
          diffLeft <= maxDiff &&
          diffRight <= maxDiff &&
          diffUpLeft <= maxDiff &&
          diffDownLeft <= maxDiff &&
          diffUpRight <= maxDiff &&
          diffDownRight <= maxDiff &&
          currentDepth > 0) {
        incrementDepthOnChart(chart, key);
        //chart[Point<int>(x, y)] = chart[Point<int>(x, y)]! + 1;
        changesMade++;
      }
    }
    return changesMade;
  }

  static void displayMiningChart(Map<Point<int>, int> chart) {
    int width = chart.keys.map((e) => e.x).reduce(max);
    int height = chart.keys.map((e) => e.y).reduce(max);
    print('$width,$height');
    for (var y = 0; y <= height; y++) {
      final sb = StringBuffer();
      for (var x = 0; x <= width; x++) {
        sb.write(chart[Point<int>(x, y)]);
      }
      print(sb.toString());
    }
    print('');
  }
}
