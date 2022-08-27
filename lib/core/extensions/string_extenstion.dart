extension StringX on String {
  String get capitalizeFirst {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
