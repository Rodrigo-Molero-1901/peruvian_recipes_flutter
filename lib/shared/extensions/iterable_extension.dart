extension NullableIterable<T> on Iterable<T>? {
  Iterable<T> get safe => this ?? [];

  bool get isNull => this == null;

  bool get safeIsEmpty => safe.isEmpty;

  bool get safeIsNotEmpty => !safeIsEmpty;
}
