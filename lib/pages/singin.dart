// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authfirebase/pages/signup.dart';

import '../wigets/button.dart';
import '../wigets/elevetbot.dart';
import 'homepage.dart';

class Singin extends StatefulWidget {
  const Singin({Key? key}) : super(key: key);

  @override
  _SinginState createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Sing In",
            style: TextStyle(color: Colors.blueAccent, fontSize: 50),
          ),
          AppTextFormField(
            controller: emailController,
            icon: const Icon(
              Icons.email,
            ),
            text: "Email",
          ),
          AppTextFormField(
            controller: passController,
            icon: const Icon(
              Icons.password,
            ),
            text: "Password",
          ),
          AppButton(
            text: "Sing In",
            onPressed: () {
              if (emailController.text.isNotEmpty &&
                  passController.text.isNotEmpty) {
                login(
                    context: context,
                    email: emailController.text,
                    password: passController.text);
              }
            },
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}

Future<void> login({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  } catch (e) {
    print(e.toString());
  }
}
