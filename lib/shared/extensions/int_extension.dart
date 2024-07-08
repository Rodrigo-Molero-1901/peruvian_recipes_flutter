extension NullableInt on int? {
  int get safe => this ?? 0;
}
