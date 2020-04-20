import 'dart:convert';
import 'dart:io';

class Utils {
  static dynamic loadJsonAsset(String fileName) async {
    try {
      var file = File('assets/mocks/$fileName.json');

      return jsonDecode(await file.readAsString());
    } catch (e) {
      print('object');
    }
  }
}
