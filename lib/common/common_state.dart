enum StateType {
  initial,
  loading,
  failure,
  success,
}

abstract class CommonState<T> {
  const CommonState(
    this.type,
    this.message,
    this.output,
  );

  final StateType type;
  final String message;
  final T output;

  bool get isInitial => type == StateType.initial;
  bool get isLoading => type == StateType.loading;
  bool get isFailure => type == StateType.failure;
  bool get isSuccess => type == StateType.success;
}
