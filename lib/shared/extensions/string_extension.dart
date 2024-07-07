extension NullableString on String? {
  String get safe => this ?? '';
}
