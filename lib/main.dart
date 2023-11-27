import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app_with_firebase/routes/routes_import.dart';
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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
      create: (context) => TaskCubit(),
      child: MaterialApp.router(
        title: 'Flutter Task App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: LoginScreen(),
        routerConfig: _appRouter.config(),
        // onGenerateRoute: AppRouter().onGenerateRoute(routeSettings),
      ),
    );
  }
}
