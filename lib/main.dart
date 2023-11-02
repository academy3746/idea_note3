import 'package:flutter/material.dart';
import 'package:idea_note3/features/screens/main_screen/main_screen.dart';
import 'package:idea_note3/features/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아이디어노트',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
      },
    );
  }
}
