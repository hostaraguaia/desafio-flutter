class ApiServiceError implements Exception {
  const ApiServiceError(
    this.message,
  );

  final String message;
}
