// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$isLockOpenAtom = Atom(name: '_LoginViewModelBase.isLockOpen');

  @override
  bool get isLockOpen {
    _$isLockOpenAtom.reportRead();
    return super.isLockOpen;
  }

  @override
  set isLockOpen(bool value) {
    _$isLockOpenAtom.reportWrite(value, super.isLockOpen, () {
      super.isLockOpen = value;
    });
  }

  final _$isCheckBoxSelectedAtom =
      Atom(name: '_LoginViewModelBase.isCheckBoxSelected');

  @override
  bool get isCheckBoxSelected {
    _$isCheckBoxSelectedAtom.reportRead();
    return super.isCheckBoxSelected;
  }

  @override
  set isCheckBoxSelected(bool value) {
    _$isCheckBoxSelectedAtom.reportWrite(value, super.isCheckBoxSelected, () {
      super.isCheckBoxSelected = value;
    });
  }

  final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase');

  @override
  void isLockStateChanged() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isLockStateChanged');
    try {
      return super.isLockStateChanged();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isCheckBoxStateChanged() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isCheckBoxStateChanged');
    try {
      return super.isCheckBoxStateChanged();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLockOpen: ${isLockOpen},
isCheckBoxSelected: ${isCheckBoxSelected}
    ''';
  }
}
