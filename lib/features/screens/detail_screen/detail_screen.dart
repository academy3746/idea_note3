import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';
import 'package:idea_note3/data/db_config.dart';
import 'package:idea_note3/data/db_helper.dart';
import 'package:idea_note3/features/widgets/delete_button.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
    this.ideaInfo,
  });

  static String routeName = "/detail";

  final IdeaInfo? ideaInfo;

  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          ideaInfo!.title,
          style: const TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: Sizes.size24,
            color: Colors.black,
          ),
        ),
        actions: [
          DeleteButton(
            context: context,
            ideaInfo: ideaInfo,
            dbHelper: dbHelper,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
