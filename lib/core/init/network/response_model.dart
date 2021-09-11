import 'package:login_design/core/init/network/abstract/IErrorModel.dart';
import 'package:login_design/core/init/network/abstract/IResponseModel.dart';

class ResponseModel<T> extends IResponseModel<T> {
  final T? data;

  final IErrorModel? error;

  ResponseModel({this.data, this.error});
}
