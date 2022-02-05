import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_workouts/screen/login/loginscreen.dart';
import 'package:flutter_workouts/screen/onboarding/onboarding.dart';
import 'package:flutter_workouts/screen/sqflite/dbhelper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'constants.dart';
import 'l10n/l10n.dart';
import 'screen/provider/controller/userlistprovider.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance?.resamplingEnabled = true;
  DatabaseHandler databaseHandler = new DatabaseHandler();
  await databaseHandler.initializeDB();
  prefs = await SharedPreferences.getInstance();
  show = prefs.getBool("ONBOARD") ?? true;
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Flutter Workouts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: show ? OnboardingScreen() : LoginScreen(),
    );
  }
}
