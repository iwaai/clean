import 'package:dio/dio.dart';

//T is generic type that can hold any type of data
abstract class DataState<T> {
  final T? data;
  final DioError? error;
  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  const DataError(DioError error) : super(error: error);
}
