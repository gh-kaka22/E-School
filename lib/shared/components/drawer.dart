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
                child: Image.asset('assets/icons/graduating-student-g.png'),
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
              leading: Icon(Icons.newspaper
              ),
              title: Text('News'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: (){},
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('About Us'),
              onTap: (){},
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              onTap: (){},

            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
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
