import 'package:e_school/modules/school_login/login_screen.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Account'),
            tiles: [
              SettingsTile(
                title: Text('Name'),
                leading: Icon(Icons.person),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: Text('Email'),
                leading: Icon(Icons.email),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: Text('Sign Out'),
                leading: Icon(Icons.output_rounded),
                onPressed: (BuildContext context) {
                  CacheHelper.removeData(key: 'token').then((value) {
                    if(value!){
                      navigateAndFinish(context, SchoolLoginScreen());
                    }
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text('Notifications'),
            tiles: [
              SettingsTile.switchTile(
                title: Text('Push Notifications'),
                leading: Icon(Icons.notifications),
                onToggle: (bool value) {},
                initialValue: true,
              ),
            ],
          ),
          SettingsSection(
            title: Text('Theme'),
            tiles: [
              SettingsTile.switchTile(
                title: Text('Dark Mode'),
                leading: Icon(Icons.dark_mode),
                onToggle: (bool value) {},
                initialValue: false,
              ),
            ],
          ),
          SettingsSection(
            title: Text('Language'),
            tiles: [
              SettingsTile(
                title: Text('Language'),
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
