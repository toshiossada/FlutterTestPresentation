import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:tests_example/app/shared/models/user_model.dart';
import 'package:path_provider/path_provider.dart';

import 'interfaces/user_local_storage_repository_interface.dart';

class UserLocalStorageRepository extends Disposable
    implements IUserLocalStorageRepository {
  Completer<Box> _completer = Completer<Box>();

  @override
  Future<void> dispose() async {
    final box = await _completer.future;
    box.close();
  }

  UserLocalStorageRepository() {
    _initDb();
  }

  _initDb() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    final box = await Hive.openBox('current_user');
    if (!_completer.isCompleted) _completer.complete(box);
  }

  Future<List<UserModel>> getAll() async {
    final box = await _completer.future;

    return box.values
        .map((item) => UserModel.fromJson(Map<String, dynamic>.from(item)))
        .toList();
  }

  Future<int> count() async {
    final box = await _completer.future;
    return box.values.length;
  }

  Future<UserModel> get(int id) async {
    final box = await _completer.future;
    return UserModel.fromJson(box.get(id));
  }

  Future<UserModel> add(UserModel model) async {
    final box = await _completer.future;
    await box.put(model.userName, model.toJson());

    return model;
  }

  update(UserModel model) async {
    final box = await _completer.future;
    box.put(model.userName, model.toJson());
  }

  remove(String userName) async {
    final box = await _completer.future;
    await box.delete(userName);
  }

  clear() async {
    final box = await _completer.future;
    await box.clear();
  }
}
