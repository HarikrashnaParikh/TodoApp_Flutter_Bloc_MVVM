import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app_with_firebase/services/app_router.dart';
import 'package:todo_app_with_firebase/view/login_screen.dart';
import 'package:todo_app_with_firebase/view/registration_screen.dart';
import 'package:todo_app_with_firebase/view/tasksScreen.dart';
import 'package:todo_app_with_firebase/view_model/bloc_exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
      create: (context) => TaskCubit(),
      child: MaterialApp(
        title: 'Flutter Task App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        // onGenerateRoute: AppRouter().onGenerateRoute(routeSettings),
      ),
    );
  }
}
