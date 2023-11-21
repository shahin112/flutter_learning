import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_activity extends StatefulWidget {
  const Login_activity({Key? key}) : super(key: key);

  @override
  State<Login_activity> createState() => _Login_activityState();
}

class _Login_activityState extends State<Login_activity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("login"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("login activitys"),
      ),
    ));
  }
}
