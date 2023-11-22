import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';


class Login_activity extends StatefulWidget {
  final String username;
  final String password;

  const Login_activity(
      {Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  State<Login_activity> createState() => _Login_activityState();
}

class _Login_activityState extends State<Login_activity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Username: ${widget.username}'),
              Text('Password: ${widget.password}'),
            ],
          ),
        ),
      ),
      drawer: Mydrawer(),
    ));
  }
}
