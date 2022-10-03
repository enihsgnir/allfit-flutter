extension DateTimeExtension on DateTime {
  DateTime dateOnly() => DateTime(year, month, day);
}

extension IfNotNullExtension<T> on T? {
  S? andThen<S>(S Function(T value) function) {
    final self = this;
    return self == null ? null : function(self);
  }
}

extension IterableExtension<T> on Iterable<T?> {
  T? get firstOrNull => isEmpty ? null : first;
}
