import 'package:flutter/material.dart';
import 'activity/Login_activity.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainActivity(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Homeactivitys();
}

class _Homeactivitys extends State<MainActivity> {
  ButtonStyle buttonStyle =
      ElevatedButton.styleFrom(minimumSize: Size(150, 40.0));

  String names = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("main"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Image.network(
              "https://cdn.pixabay.com/photo/2023/11/17/22/10/road-8395119_1280.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Welcome $names",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter name",
                        labelText: "Useranme",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onChanged: (value) {
                      setState(() {
                        names = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });

                      await Future.delayed(Duration(seconds: 1));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Login_activity()));
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changeButton ? 50 : 150,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                          color: Colors.green),
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(color: Colors.black),
                            ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
