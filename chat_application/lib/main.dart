import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
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
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
