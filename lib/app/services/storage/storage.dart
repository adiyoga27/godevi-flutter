// 📦 Package imports:
import 'package:get_storage/get_storage.dart';

late GetStorage storage;

// use this class to remove multiples key of storage
class Storage {
  static Future<void> remove(List<String> keys) async {
    for (String key in keys) {
      await storage.remove(key);
    }
  }
}
