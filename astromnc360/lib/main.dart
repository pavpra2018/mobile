import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:astromnc360/screens/home_screen.dart';
import 'package:astromnc360/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AstroMNC());
}

class AstroMNC extends StatelessWidget {
  const AstroMNC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
          bodyText2: TextStyle(color: Colors.black54),
          button: TextStyle(color: Colors.black54),
          caption: TextStyle(color: Colors.black54),
          subtitle1: TextStyle(color: Colors.black54), // <-- that's the one
          headline1: TextStyle(color: Colors.black54),
          headline2: TextStyle(color: Colors.black54),
          headline3: TextStyle(color: Colors.black54),
          headline4: TextStyle(color: Colors.black54),
          headline5: TextStyle(color: Colors.black54),
          headline6: TextStyle(color: Colors.black54),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.grey,
          secondary: Colors.grey,
          primaryVariant: Colors.white,
          secondaryVariant: Colors.white,
          onSecondary: Colors.white,
          background: Colors.white,
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white,
          error: Colors.red,
          onError: Colors.redAccent,
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFf7941d),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        HomeScreen.id: (context) => const HomeScreen()
      },
    );
  }
}
