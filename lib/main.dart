import 'package:flutter/material.dart';
import 'package:todo_app_with_firebase/routes/routes_import.dart';
import 'package:todo_app_with_firebase/view_model/bloc_exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
      create: (context) => TaskCubit(),
      child: MaterialApp.router(
        title: 'Flutter Task App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
