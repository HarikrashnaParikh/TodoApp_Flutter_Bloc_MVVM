import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_with_firebase/routes/routes_import.gr.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const id = 'forgot_password_screen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  hintText: 'Enter your email',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                controller: _emailController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  maximumSize: const Size(200, 40)),
              onPressed: () async {
                _formKey.currentState!.validate();
                await _auth
                    .sendPasswordResetEmail(email: _emailController.text.trim())
                    .then((value) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LoginScreen()),
                  // );
                  AutoRouter.of(context).push(const LoginScreenRoute());
                  var snackBar = const SnackBar(
                    content: Text(
                      'check your email',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.green,
                    duration: Duration(microseconds: 3000),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }).onError((error, stackTrace) {
                  var snackBar = const SnackBar(
                    content: Text(
                      'Please Enter Register Email',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(microseconds: 3000),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mail_outline),
                  SizedBox(width: 10),
                  Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
                AutoRouter.of(context).push(const LoginScreenRoute());
              },
              child: const Text(
                'Back to Login Page',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
