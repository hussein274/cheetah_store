sealed class ApiResult<T> {}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  ApiSuccess(this.data);
}

class ApiError<T> extends ApiResult<T> {
  AppError error;
  ApiError(this.error);
}
class ApiInitial<T> extends ApiResult<T>{}
class ApiLoading<T> extends ApiResult<T>{}

class AppError{
  final String message;

  AppError(this.message);
}
class NetWorkError extends AppError{
  NetWorkError():super('No Internet Connection');
}
class ServerError extends AppError{
  ServerError():super('Server Error');
}
class IgnoreError extends AppError{
  IgnoreError():super('Ignore Error');
}