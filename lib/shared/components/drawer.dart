import 'package:e_school/modules/about_us/about_screen.dart';
import 'package:e_school/modules/school_login/login_screen.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/network/local/cache_helper.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TheMenu extends StatelessWidget {
  String? name;
  String? email;
  String? image;
  TheMenu({this.name,this.email,this.image});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${name}',),
            accountEmail:Text('${email}'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('${image}'),
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
              onTap: (){
                navigateTo(context, AboutScreen());
              },
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
              onTap: (){
                CacheHelper.removeData(key: 'token').then((value) {
                  if(value!){
                    navigateAndFinish(context, SchoolLoginScreen());
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
