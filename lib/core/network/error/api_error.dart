class ApiError {
  String? errorCode;
  String? errorMessage;

  ApiError({
    this.errorCode,
    this.errorMessage,
  });

  factory ApiError.defaultError() {
    return ApiError(
      errorCode: 'unknown',
      errorMessage: 'Unknown',
    );
  }
}
