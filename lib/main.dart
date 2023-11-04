import 'package:flutter/material.dart';
import 'package:idea_note3/data/db_config.dart';
import 'package:idea_note3/features/screens/detail_screen/detail_screen.dart';
import 'package:idea_note3/features/screens/edit_screen/edit_screen.dart';
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
      onGenerateRoute: (RouteSettings settings) {
        /// values.isEmpty ? "게시글 등록" : "게시글 수정"
        if (settings.name == EditScreen.routeName) {
          final IdeaInfo? ideaInfo = settings.arguments as IdeaInfo?;

          /// 1. 게시글 등록
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return EditScreen(ideaInfo: ideaInfo);
            },
          );

          /// 2. 게시물 상세 & 수정
        } else if (settings.name == DetailScreen.routeName) {
          final IdeaInfo? ideaInfo = settings.arguments as IdeaInfo?;

          return MaterialPageRoute(
            builder: (BuildContext context) {
              return DetailScreen(ideaInfo: ideaInfo);
            },
          );
        }
        return null;
      },
    );
  }
}
