import 'package:flutter/material.dart';

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
      ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50.0));

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
              "Welcome",
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
                  ElevatedButton(
                    onPressed: () {
                      print("yes");
                    },
                    child: Text("submit"),
                    style: buttonStyle,
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
