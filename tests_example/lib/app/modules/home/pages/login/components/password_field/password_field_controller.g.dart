// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_field_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PasswordFieldController on _PasswordFieldControllerBase, Store {
  final _$passwordVisibleAtom =
      Atom(name: '_PasswordFieldControllerBase.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.context.enforceReadPolicy(_$passwordVisibleAtom);
    _$passwordVisibleAtom.reportObserved();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.context.conditionallyRunInAction(() {
      super.passwordVisible = value;
      _$passwordVisibleAtom.reportChanged();
    }, _$passwordVisibleAtom, name: '${_$passwordVisibleAtom.name}_set');
  }

  final _$_PasswordFieldControllerBaseActionController =
      ActionController(name: '_PasswordFieldControllerBase');

  @override
  dynamic setVisibility(bool v) {
    final _$actionInfo =
        _$_PasswordFieldControllerBaseActionController.startAction();
    try {
      return super.setVisibility(v);
    } finally {
      _$_PasswordFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'passwordVisible: ${passwordVisible.toString()}';
    return '{$string}';
  }
}
