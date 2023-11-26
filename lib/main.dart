import 'package:flutter/material.dart';
import 'package:todo_app_with_firebase/model/task.dart';
import 'package:todo_app_with_firebase/view/tasksScreen.dart';
import 'package:todo_app_with_firebase/view_model/bloc_exports.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'Flutter Task App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
