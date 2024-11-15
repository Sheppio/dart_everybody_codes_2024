extension StringExtensions on String {
  String reverse() {
    return split('').reversed.join('');
  }
}
