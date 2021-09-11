import 'package:flutter/material.dart';
import 'package:login_design/core/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  void setContext(BuildContext context) => this.context = context;
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLockOpen = false;

  @action
  void isLockStateChanged() => isLockOpen = !isLockOpen;

  @observable
  bool isCheckBoxSelected = false;

  @action
  void isCheckBoxStateChanged() => isCheckBoxSelected = !isCheckBoxSelected;
}
