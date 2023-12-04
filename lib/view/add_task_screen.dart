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
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  const uuid = Uuid();
                  String userId = uuid.v4();
                  var task = Task(
                    title: titleController.text,
                    id: userId,
                    isDone: false,
                    isDeleted: false,
                  );
                  context.read<TaskCubit>().addTask(task);
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
