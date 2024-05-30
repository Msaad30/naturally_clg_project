
// original code
// import 'package:get_storage/get_storage.dart';

// class TLocalStorage {
//  // static final TLocalStorage _instance = TLocalStorage.instance();

//   late final GetStorage _storage;  

//   static TLocalStorage? _instance;

//   TLocalStorage._internal();

//   factory TLocalStorage.instance() {
//     _instance ??=TLocalStorage._internal();
//     return _instance!;
//   }

//   static Future<void> init(String bucketName) async{
//   await GetStorage.init(bucketName);
//   _instance = TLocalStorage._internal();
//   _instance!._storage = GetStorage(bucketName);
//   }

//  //Generic method to save data
//   Future<void> saveData<T>(String key, T value) async {
//     await _storage.write(key, value);
//   }

//    Future<void> writeData<T>(String key, T value) async {
//     await _storage.write(key, value);
//   }

// //Generic method to read data
//   T? readData<T>(String key) {
//     return _storage.read<T>(key);
//   }

//   Future<void> removeData(String key) async {
//     await _storage.remove(key);
//   }

//   // Clear all data in storage
//    Future<void> clearAll() async {
//     await _storage.erase();
//   }

// }


import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  late final GetStorage _storage;

  static TLocalStorage? _instance;

  TLocalStorage._internal();

  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = TLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  Future<void> _ensureInitialized() async {
    if (_instance == null || _storage == null) {
      throw Exception('Storage not initialized. Call TLocalStorage.init() before using the storage.');
    }
  }

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _ensureInitialized();
    await _storage.write(key, value);
  }

  Future<void> writeData<T>(String key, T value) async {
    await _ensureInitialized();
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    if (_instance == null || _storage == null) {
      throw Exception('Storage not initialized. Call TLocalStorage.init() before using the storage.');
    }
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _ensureInitialized();
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _ensureInitialized();
    await _storage.erase();
  }
}


// import 'package:get_storage/get_storage.dart';

// class TLocalStorage {
//   late final GetStorage _storage;

//   static TLocalStorage? _instance;

//   TLocalStorage._internal();

//   factory TLocalStorage.instance() {
//     _instance ??= TLocalStorage._internal();
//     return _instance!;
//   }

//   static Future<void> init(String bucketName) async {
//     await GetStorage.init(bucketName);
//     _instance = TLocalStorage._internal();
//     _instance!._storage = GetStorage(bucketName);
//   }

//   // Ensure _storage is initialized before usage
//   Future<void> _ensureInitialized() async {
//     if (_storage == null) {
//       throw Exception('Storage not initialized. Call TLocalStorage.init() before using the storage.');
//     }
//   }

//   // Generic method to save data
//   Future<void> saveData<T>(String key, T value) async {
//     await _ensureInitialized();
//     await _storage.write(key, value);
//   }

//   Future<void> writeData<T>(String key, T value) async {
//     await _ensureInitialized();
//     await _storage.write(key, value);
//   }

//   // Generic method to read data
//   T? readData<T>(String key) {
//     if (_storage == null) {
//       throw Exception('Storage not initialized. Call TLocalStorage.init() before using the storage.');
//     }
//     return _storage.read<T>(key);
//   }

//   Future<void> removeData(String key) async {
//     await _ensureInitialized();
//     await _storage.remove(key);
//   }

//   // Clear all data in storage
//   Future<void> clearAll() async {
//     await _ensureInitialized();
//     await _storage.erase();
//   }
// }
