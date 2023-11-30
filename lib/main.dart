import 'package:flutter/material.dart';
import 'package:flutter_project/theme/theme.dart';
import 'package:flutter_project/core/store.dart';
import 'activity/Login_activity.dart';
import 'package:velocity_x/velocity_x.dart';

main() {
  runApp( VxState(store:Mystore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: _getThemeFromBrightness(MediaQuery.of(context).platformBrightness),
      home: MainActivity(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      // Set the initial route to '/login'
      routes: {
        '/login': (context) => Login_activity(),
        // Other routes if needed...
      },
    );
  }
}

ThemeData _getThemeFromBrightness(Brightness brightness) {
  if (brightness == Brightness.dark) {
    return MyTheme.darkTheme();
  } else {
    return MyTheme.lightTheme();
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
  String password = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    var currentState = _formKey.currentState;
    if (currentState != null && currentState.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login_activity()));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          title: Text(
            "main",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
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
                  "log in your account",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter name",
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          labelText: "Useranme",
                          hintStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username can not be empty";
                          }
                          return null;
                        },
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
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          hintStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be at least 6";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        color: Theme.of(context).colorScheme.secondary,
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: changeButton ? 50 : 150,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
