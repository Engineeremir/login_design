import 'package:easy_localization/easy_localization.dart';
import 'package:login_design/core/constants/app/app_constants.dart';

extension EmailExtension on String {
  String get locale => this.tr();

  String? get isValidEmail =>
      this.contains(RegExp(ApplicationConstants.EMAIL_REGEX))
          ? null
          : "Email doesn't valid";
}
