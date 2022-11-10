extension NullableExtensions<T> on T? {
  T orIfNull(T Function() onNull) {
    final value = this;
    if (value == null) {
      return onNull();
    }
    return value;
  }
}
