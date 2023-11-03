import 'package:flutter/material.dart';
import 'package:idea_note3/data/db_config.dart';
import 'package:idea_note3/data/db_helper.dart';

class PostHandler {
  final BuildContext context;
  final String titleValue;
  final String motiveValue;
  final String contentValue;
  final String feedbackValue;
  final int score;
  final DatabaseHelper databaseHelper;
  IdeaInfo? ideaInfo;

  PostHandler({
    required this.context,
    required this.titleValue,
    required this.motiveValue,
    required this.contentValue,
    required this.feedbackValue,
    required this.score,
    required this.databaseHelper,
    this.ideaInfo,
  });

  Future<void> databaseHandler() async {
    /// Validation
    if (titleValue.isEmpty || motiveValue.isEmpty || contentValue.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("반드시 입력해야 하는 필드 입니다!"),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    /// value.isEmpty ? "INSERT" : "UPDATE"
    if (ideaInfo == null) {
      var ideaInfo = IdeaInfo(
        title: titleValue,
        motive: motiveValue,
        content: contentValue,
        importance: score,
        feedback: feedbackValue.isNotEmpty ? feedbackValue : "",
        dateTime: DateTime.now().millisecondsSinceEpoch,
      );

      await setInsertIdeaInfo(ideaInfo);

      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  /// INSERT data to DB Server
  Future<void> setInsertIdeaInfo(IdeaInfo ideaInfo) async {
    await databaseHelper.initDatabase();
    await databaseHelper.insertIdeaInfo(ideaInfo);
  }
}
