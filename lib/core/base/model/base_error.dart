import '../../init/network/abstract/IErrorModel.dart';

class BaseError extends IErrorModel {
  final String message;

  BaseError(this.message);
}
