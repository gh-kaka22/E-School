import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TheMenu extends StatefulWidget {
  const TheMenu({Key? key}) : super(key: key);

  @override
  State<TheMenu> createState() => _TheMenuState();
}

class _TheMenuState extends State<TheMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('maysa',),
            accountEmail:Text('maysa@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/icons/exam.png'),

              ),
            ),
            decoration: BoxDecoration(
              color: kDarkBlue2Color,
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){},

            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('How To Use App'),
              onTap: (){},

            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.perm_identity_rounded),
              title: Text('Home'),
              onTap: (){},

            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.roundabout_right),
              title: Text('About App'),
              onTap: (){},

            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text('Change Language'),
              onTap: (){},

            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text('Share App'),
              onTap: (){},

            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact Us'),
              onTap: (){},

            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),


            ),
          ),
        ],
      ),
    );
  }
}
