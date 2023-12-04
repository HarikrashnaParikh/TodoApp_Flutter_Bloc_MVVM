import 'package:flutter/material.dart';
import 'package:todo_app_with_firebase/view_model/bloc_exports.dart';
import 'package:uuid/uuid.dart';
import 'package:auto_route/auto_route.dart';
import '../model/task.dart';

@RoutePage()
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Task',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final uuid = Uuid();
                    String userId = uuid.v4();
                    var task = Task(
                      title: titleController.text,
                      id: userId,
                    );
                    context.read<TaskCubit>().addTask(task);
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
