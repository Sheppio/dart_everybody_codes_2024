import 'helpers.dart';
import 'test_data.dart';

class Day2 {
  static partA() {
    final words = TestData.day2PartAWords.replaceAll(',', '|');
    final regexp = RegExp('(?=($words))');
    final matches = regexp.allMatches(TestData.day2PartAScripture).toList();
    print(matches[0].group((0)));
    print(matches[0].group((1)));
  }

  static partB() {
    print('Day2 Part B');
    final words = TestData.day2PartBWords.split(',');
    var wordSet = Set<String>.from(words);
    wordSet.addAll(words.map((e) => e.reverse()).toSet());
    print(wordSet);
    final lines = TestData.day2PartBScripture.split('\n');
    final regexp1 = RegExp('(?=(${wordSet.join('|')}))');
    //final regexp2 = RegExp('(?=(${words.split('').reversed.join('')}))');
    int scriptureSymbolCount = 0;
    for (var line in lines) {
      final isRunic = List.filled(line.length, false);
      final matches = regexp1.allMatches(line).toList();
      //matches.addAll(regexp2.allMatches(line));
      print('no of matches: ${matches.length}');
      for (var match in matches) {
        var word = match.group(1) as String;
        print(word);
        for (var i = 0; i < word.length; i++) {
          isRunic[match.start + i] = true;
        }
        print('$line ($word)');
        print(
            '${isRunic.map((e) => e ? '*' : '-').join('')} (${isRunic.where((e) => e).length.toString()})');
      }
      int lineSymbolCount = isRunic.where((e) => e == true).length;
      print(lineSymbolCount);
      scriptureSymbolCount += lineSymbolCount;
    }
    print(scriptureSymbolCount);
  }
}
