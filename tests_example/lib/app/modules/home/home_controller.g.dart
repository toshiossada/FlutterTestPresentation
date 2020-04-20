// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<Future<UserModel>> _$userComputed;

  @override
  Future<UserModel> get user =>
      (_$userComputed ??= Computed<Future<UserModel>>(() => super.user)).value;

  final _$userModelAtom = Atom(name: '_HomeControllerBase.userModel');

  @override
  UserModel get userModel {
    _$userModelAtom.context.enforceReadPolicy(_$userModelAtom);
    _$userModelAtom.reportObserved();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.context.conditionallyRunInAction(() {
      super.userModel = value;
      _$userModelAtom.reportChanged();
    }, _$userModelAtom, name: '${_$userModelAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'userModel: ${userModel.toString()},user: ${user.toString()}';
    return '{$string}';
  }
}
