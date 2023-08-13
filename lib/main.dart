import 'package:bloc/bloc.dart';
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/layout/home_layout/home_layout.dart';
import 'package:e_school/layout/parent_home_layout/parent_home_layout.dart';
import 'package:e_school/layout/teacher_home_layout/teacher_home_layout.dart';
import 'package:e_school/modules/profile/profile_screen.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/modules/parent_profile/profile_screen.dart';
import 'package:e_school/modules/teacher/profie_teacher/profile_teacher_screen.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/cubit/app_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'modules/school_login/login_screen.dart';

import 'shared/bloc_observer.dart';

import 'shared/cubit/app_states.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/themes.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> firebaseMessagingBackgroundHandler (RemoteMessage message)async{
  print('message background');
  print(message.data.toString());
  showToast(text: 'message background', state: ToastStates.SUCCESS);
}


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var deviceToken =await FirebaseMessaging.instance.getToken();
  print('fcm : ${deviceToken}');
  FirebaseMessaging.onMessage.listen((event) {
    print('on message');
    print(event.data.toString());
    showToast(text: 'on message', state: ToastStates.SUCCESS);

  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('on message opened');
    print(event.data.toString());
    showToast(text: 'on message opened app', state: ToastStates.SUCCESS);
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await dotenv.load(fileName: "assets/.env");
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;
  token = CacheHelper.getData(key: 'token');
  kidID=CacheHelper.getData(key: 'kidId');
  kidName=CacheHelper.getData(key: 'kidName');
  userType = CacheHelper.getData(key: 'userType');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  if (onBoarding != null) {
    if (token != null) {
      if (userType == 'student') {
        widget = HomeLayout();
      } else if (userType == 'teacher') {
        widget = TeacherHomeLayout();
      } else {
        widget = ParentHomeLayout();
        FirebaseMessaging.instance.subscribeToTopic('parents');
      }
    } else
      widget = SchoolLoginScreen();
  } else
    widget = OnBoardingScreen();

  runApp(MyApp(
    isDark: false,
    startWidget: widget,
  ));
}

class MyApp extends StatefulWidget {
  bool? isDark;
  Widget? startWidget;
  MyApp({this.isDark, this.startWidget});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }


}

class _MyAppState extends State<MyApp> {

  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..changeAppMode(
          fromShared: widget.isDark,
        ),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: _locale,
            home: ParentProfileStudent(),
          );
        },
      ),
    );
  }
}
