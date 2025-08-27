part of 'api_result.dart';

T _$identity<T>(T value) => value;

mixin _$ApiResult<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ApiResult<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiResult<$T>()';
  }
}

class $ApiResultCopyWith<T, $Res> {
  $ApiResultCopyWith(ApiResult<T> _, $Res Function(ApiResult<T>) __);
}

extension ApiResultPatterns<T> on ApiResult<T> {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult Function() orElse,
  }) {
    final that = this;
    switch (that) {
      case Success() when success != null:
        return success(that);
      case Failure() when failure != null:
        return failure(that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    final that = this;
    switch (that) {
      case Success():
        return success(that);
      case Failure():
        return failure(that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(Failure<T> value)? failure,
  }) {
    final that = this;
    switch (that) {
      case Success() when success != null:
        return success(that);
      case Failure() when failure != null:
        return failure(that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(ErrorHandler errorHandler)? failure,
    required TResult Function() orElse,
  }) {
    final that = this;
    switch (that) {
      case Success() when success != null:
        return success(that.data);
      case Failure() when failure != null:
        return failure(that.errorHandler);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(ErrorHandler errorHandler) failure,
  }) {
    final that = this;
    switch (that) {
      case Success():
        return success(that.data);
      case Failure():
        return failure(that.errorHandler);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(ErrorHandler errorHandler)? failure,
  }) {
    final that = this;
    switch (that) {
      case Success() when success != null:
        return success(that.data);
      case Failure() when failure != null:
        return failure(that.errorHandler);
      case _:
        return null;
    }
  }
}

class Success<T> implements ApiResult<T> {
  const Success(this.data);

  final T data;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ApiResult<$T>.success(data: $data)';
  }
}

abstract mixin class $SuccessCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

class _$SuccessCopyWithImpl<T, $Res> implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? data = freezed}) {
    return _then(Success<T>(freezed == data ? _self.data : data as T));
  }
}

class Failure<T> implements ApiResult<T> {
  const Failure(this.errorHandler);

  final ErrorHandler errorHandler;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<T, Failure<T>> get copyWith =>
      _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure<T> &&
            (identical(other.errorHandler, errorHandler) ||
                other.errorHandler == errorHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorHandler);

  @override
  String toString() {
    return 'ApiResult<$T>.failure(errorHandler: $errorHandler)';
  }
}

abstract mixin class $FailureCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({ErrorHandler errorHandler});
}

class _$FailureCopyWithImpl<T, $Res> implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<T> _self;
  final $Res Function(Failure<T>) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? errorHandler}) {
    return _then(
      Failure<T>(
        null == errorHandler
            ? _self.errorHandler
            : errorHandler as ErrorHandler,
      ),
    );
  }
}
