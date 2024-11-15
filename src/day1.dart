import 'dart:collection';

import 'test_data.dart';

class Day1 {
  static partA() {
    final data = TestData.day1PartA.split('');
    final bCount = data.where((e) => e == 'B').length;
    final cCount = data.where((e) => e == 'C').length;
    final potionsNeeded = bCount + (cCount * 3);
    print('Day1PartA # potionsNeeds: $potionsNeeded');
  }

  static partB() {
    final data = TestData.day1PartB.split('');
    final attacks = <(String a, String b)>[];
    final q = Queue<String>.from(data);
    while (q.isNotEmpty) {
      attacks.add((q.removeFirst(), q.removeFirst()));
    }
    final potionsNeeded =
        attacks.fold(0, (a, b) => a + potionsNeedForAttack(b));
    print('Day1PartB # potionsNeeds: $potionsNeeded');
  }

  static int potionsNeedForAttack((String, String) combo) {
    var onlySingleAttacker = false;
    var potions = 0;
    switch (combo.$1) {
      case 'x':
        onlySingleAttacker = true;
        break;
      case 'A':
        break;
      case 'B':
        potions += 1;
        break;
      case 'C':
        potions += 3;
        break;
      case 'D':
        potions += 5;
        break;
      default:
        throw Exception();
    }
    switch (combo.$2) {
      case 'x':
        onlySingleAttacker = true;
        break;
      case 'A':
        break;
      case 'B':
        potions += 1;
        break;
      case 'C':
        potions += 3;
        break;
      case 'D':
        potions += 5;
        break;
      default:
        throw Exception();
    }
    if (onlySingleAttacker == false) {
      potions += 2;
    }
    return potions;
  }

  static partC() {
    final data = TestData.day1PartC.split('');
    final attacks = <(String a, String b, String c)>[];
    final q = Queue<String>.from(data);
    while (q.isNotEmpty) {
      attacks.add((q.removeFirst(), q.removeFirst(), q.removeFirst()));
    }
    final potionsNeeded =
        attacks.fold(0, (a, b) => a + potionsNeedForAttack3(b));
    print('Day1PartC # potionsNeeds: $potionsNeeded');
  }

  static int potionsNeedForAttack3((String a, String, String) combo) {
    var attackerCount = 0;
    var potions = 0;
    switch (combo.$1) {
      case 'x':
        break;
      case 'A':
        attackerCount++;
        break;
      case 'B':
        attackerCount++;
        potions += 1;
        break;
      case 'C':
        attackerCount++;
        potions += 3;
        break;
      case 'D':
        attackerCount++;
        potions += 5;
        break;
      default:
        throw Exception();
    }
    switch (combo.$2) {
      case 'x':
        break;
      case 'A':
        attackerCount++;
        break;
      case 'B':
        attackerCount++;
        potions += 1;
        break;
      case 'C':
        attackerCount++;
        potions += 3;
        break;
      case 'D':
        attackerCount++;
        potions += 5;
        break;
      default:
        throw Exception();
    }
    switch (combo.$3) {
      case 'x':
        break;
      case 'A':
        attackerCount++;
        break;
      case 'B':
        attackerCount++;
        potions += 1;
        break;
      case 'C':
        attackerCount++;
        potions += 3;
        break;
      case 'D':
        attackerCount++;
        potions += 5;
        break;
      default:
        throw Exception();
    }

    switch (attackerCount) {
      case 2:
        potions += 2;
        break;
      case 3:
        potions += 6;
        break;
    }
    return potions;
  }
}
