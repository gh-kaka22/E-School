import 'package:e_school/language/language.dart';
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/main.dart';
import 'package:e_school/modules/school_login/login_screen.dart';
import 'package:e_school/modules/settings/cubit/cubit.dart';
import 'package:e_school/modules/settings/cubit/states.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/local/cache_helper.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SettingsCubit(),
        child: BlocConsumer<SettingsCubit, SettingsStates>(
          listener: (context, state) { },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Settings'),
                backgroundColor:kDarkBlue2Color,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: DropdownButton<Language>(
                      underline: const SizedBox(),
                      icon:  Icon(
                        Icons.language,
                        color: kWhiteColor,
                      ),
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
                  ),
                ],
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
                              SettingsCubit.get(context).userLogout(token: token);
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
                        onToggle: (bool value) {
                          value= !value;
                        },
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

                ],
              ),
            );
          },
        ));
  }
}





