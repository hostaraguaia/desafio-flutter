class CacheServiceError implements Exception {
  const CacheServiceError(
    this.message,
  );

  final String message;
}
