import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  final String profile_image =
      "https://scontent.fruh2-1.fna.fbcdn.net/v/t39.30808-6/385362135_2077068845978393_5566549567413708432_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=8vb5HlMOfjQAX_mip8g&_nc_ht=scontent.fruh2-1.fna&oh=00_AfC8zPe_3fEK-Ci5Zz1Gsku5nuNlRbsaqh6jpBNrfnoZ6A&oe=6561F2E5";

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("shahin ahmed"),
                accountEmail: Text(
                  "shahiahmed973@gmail.com",
                ),
                decoration: BoxDecoration(color: Colors.blue),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(profile_image)),
              ),
            ),
            ListTile(leading: Icon(CupertinoIcons.home,color: Colors.white,),title: Text("home", textScaleFactor: 1.5,style: TextStyle(color: Colors.white)),),
            ListTile(leading: Icon(CupertinoIcons.mail,color: Colors.white,),title: Text("Email us",textScaleFactor:1.5,style: TextStyle(color: Colors.white)),),
            ListTile(leading: Icon(CupertinoIcons.share,color: Colors.white,),title: Text("share",textScaleFactor:1.5,style: TextStyle(color: Colors.white)),),
            ListTile(leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),title: Text("profile",textScaleFactor:1.5,style: TextStyle(color: Colors.white)),),

          ],
        ),
      ),
    );
  }
}
