import 'day2.dart';
import 'test_data.dart';
import 'helpers.dart';

class Node {
  String parentId;
  bool isFlower;
  Node({
    required this.parentId,
    required this.isFlower,
  });

  @override
  String toString() => 'Node(parentId: $parentId, isFlower: $isFlower)';
}

class Day7 {
  static partA() {
    final dataLines = TestData.day7part1.split('\n');
    final results = dataLines.map((e) => processInstructionsPartA(e)).toList();
    results.sort((a, b) => a.score.compareTo(b.score));

    print(results.reversed.join('\n'));
    print(results.reversed.map((e) => e.id).join(''));
  }

  static ({String id, int score}) processInstructionsPartA(String line) {
    final tokens = line.split(':');
    final id = tokens[0];
    final instructions = tokens[1].split(',');
    var raceLength = 10;
    var power = 10;
    var score = 0;
    for (var i = 0; i < raceLength; i++) {
      switch (instructions[i % instructions.length]) {
        case '+':
          power++;
          break;
        case '-':
          power--;
          break;
      }
      score += power;
    }
    //print('$id: $score');
    return (id: id, score: score);
  }

  static partB() {
    final dataLines = TestData.day7part2.split('\n');
    var track =
        '-=++=-==++=++=-=+=-=+=+=--=-=++=-==++=-+=-=+=-=+=+=++=-+==++=++=-=-=--';
    track = '$track-=++==-';
    track = track +
        '--==++++==+=+++-=+=-=+=-+-=+-=+-=+=-=+=--=+++=++=+++==++==--=+=++==+++-'
            .reverse();
    track = track + 'S-=+=+=-'.reverse();
    track = track * 10;
    final results =
        dataLines.map((e) => processInstructionsPartB(e, track)).toList();
    results.sort((a, b) => a.score.compareTo(b.score));

    print(results.reversed.join('\n'));
    print(results.reversed.map((e) => e.id).join(''));
  }

  static ({String id, int score}) processInstructionsPartB(
      String line, String track) {
    final tokens = line.split(':');
    final id = tokens[0];
    final instructions = tokens[1].split(',');
    var raceLength = track.length;
    var power = 10;
    var score = 0;
    for (var i = 0; i < raceLength; i++) {
      switch (track[i]) {
        case '+':
          power++;
          break;
        case '-':
          power--;
          break;
        default:
          switch (instructions[i % instructions.length]) {
            case '+':
              power++;
              break;
            case '-':
              power--;
              break;
          }
          break;
      }
      score += power;
    }
    //print('$id: $score');
    return (id: id, score: score);
  }
}
