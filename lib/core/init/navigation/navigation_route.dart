import 'package:flutter/material.dart';
import 'package:login_design/core/constants/navigation/navigation_constants.dart';
import 'package:login_design/view/authenticate/login/view/login_view.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance => _instance ??= NavigationRoute._init();
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginView());

      default:
    }
    return MaterialPageRoute(builder: (context) => LoginView());
  }

  MaterialPageRoute normalNavigate(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
}
