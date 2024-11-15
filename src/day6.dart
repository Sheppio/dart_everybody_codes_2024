import 'package:collection/collection.dart';

import 'helpers.dart';
import 'test_data.dart';

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

class Day6 {
  static partA() {
    final nodes = <String, Node>{};
    final dataLines = TestData.day6partC.split('\n');
    for (var line in dataLines) {
      final tokens = line.split(':');
      final parentId = tokens[0];
      final childIds = tokens[1].split(',');
      for (var childId in childIds) {
        nodes[childId == '@' ? '$parentId@' : childId] =
            Node(isFlower: childId == '@', parentId: parentId);
      }
    }
    print(nodes.entries.join('\n'));
    final flowerIds =
        nodes.entries.where((e) => e.value.isFlower == true).map((e) => e.key);
    print(flowerIds);

    for (var flowerId in flowerIds) {
      pathFinder(flowerId, nodes);
    }

    var pathInfos = flowerIds.map((e) => pathFinder(e, nodes)).toList();
    var x = groupBy(pathInfos, (pathInfo) => pathInfo.pathLength)
        .entries
        .reduce((winner, item) =>
            winner.value.length <= item.value.length ? winner : item);
  }

  static ({String path, int pathLength}) pathFinder(
      String flowerId, Map<String, Node> nodes) {
    String path = '@';
    int pathLength = 1;
    String nextNodeId = flowerId;
    late Node currentNode;
    do {
      pathLength++;
      currentNode = nodes[nextNodeId]!;
      path = '${currentNode.parentId}$path';
      nextNodeId = currentNode.parentId;
    } while (nextNodeId != 'RR');
    print('$flowerId: $path ($pathLength)');
    return (path: path, pathLength: pathLength);
  }
}
