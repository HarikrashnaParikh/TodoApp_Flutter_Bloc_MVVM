import 'package:todo_app_with_firebase/object_box/objectbox.g.dart';

import '../model/task.dart';
//
// class ObjectBox {
//   final Store _store;
//   final Box<Task> _taskBox;
//
//   // ObjectBox._init(this._store) {
//   //   print('===<<<next reached');
//   //   _taskBox = Box<Task>(_store);
//   // }
//
//   static Future<Store> create() async {
//     return await openStore();
//   }
//
//   // Task? getTask(int id) => _taskBox.get(id);
//   Task? getTask(int id) {
//     return _taskBox.get(id);
//   }
//
//   // int insertUser(Task task) => _taskBox.put(task);
//   int insertTask(Task task) {
//     return _taskBox.put(task);
//   }
//
//   // bool deleteUser(int id) => _taskBox.remove(id);
//   bool deleteTask(int id) {
//     return _taskBox.remove(id);
//   }
//
//   // List<Task> getAllTask() => _taskBox.getAll();
//
//   List<Task> getAllTask() {
//     return _taskBox.getAll();
//   }
// }

class ObjectBox {
  late Store _store;

  Future<Box<Task>> initStore() async {
    _store = await openStore();
    Box<Task> _taskStore = _store.box<Task>();
    return _taskStore;
  }

  closeStore() {
    _store.close();
  }
}
