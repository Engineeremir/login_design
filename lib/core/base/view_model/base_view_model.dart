import 'package:flutter/material.dart';
import 'package:login_design/core/init/cache/locale_manager.dart';
import 'package:login_design/core/init/navigation/navigation_service.dart';
import 'package:login_design/core/init/network/abstract/ICoreDio.dart';
import 'package:login_design/core/init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;
  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
