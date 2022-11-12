import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authfirebase/pages/singin.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
          child: TextButton(
        onPressed: () {
          signOut(context: context);
        },
        child: const Text(
          'Log out',
          style: TextStyle(fontSize: 30),
        ),
      )),
    );
  }

  Future<void> signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Singin(),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
