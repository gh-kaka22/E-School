import 'package:e_school/language/language.dart';
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/layout/parent_home_layout/parent_home_layout.dart';
import 'package:e_school/layout/teacher_home_layout/teacher_home_layout.dart';
import 'package:e_school/main.dart';
import 'package:e_school/modules/about_us/about_screen.dart';
import 'package:e_school/modules/complaints/show/show_complaints.dart';
import 'package:e_school/modules/posts_teacher/teacher_posts_screen.dart';
import 'package:e_school/modules/school_login/login_screen.dart';
import 'package:e_school/modules/settings/settings_screen.dart';
import 'package:e_school/modules/teacher/profie_teacher/profile_teacher_screen.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/network/local/cache_helper.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TeacherDrawer extends StatelessWidget {
  String? name;
  String? email;
  String? image;
  TeacherDrawer(this.name,this.email,this.image);


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
              backgroundColor: kTeal,
              child: ClipOval(
                child: Image.asset('${image}'),
              ),
            ),
            decoration: BoxDecoration(
              color: kTeal,
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(translation(context).home),
              onTap: (){
                navigateTo(context, TeacherHomeLayout());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.newspaper
              ),
              title: Text(translation(context).news),
              onTap: (){
                navigateTo(context, TeacherPostsScreen());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(translation(context).profile),
              onTap: (){
                navigateTo(context, ProfileTeacher());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(translation(context).about),
              onTap: (){
                navigateTo(context, AboutScreen());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.language),
              title: DropdownButton<Language>(
                underline: const SizedBox(),
                hint: Text(translation(context).language),
                onChanged: (Language? language) async {
                  if (language != null) {
                    Locale _locale = await setLocale(language.languageCode);
                    MyApp.setLocale(context, _locale);
                  }
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(e.name)
                      ],
                    ),
                  ),
                )
                    .toList(),
              ),
            )
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text(translation(context).settings),
              onTap: (){
                navigateTo(context, SettingsScreen());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text(translation(context).logout),
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
