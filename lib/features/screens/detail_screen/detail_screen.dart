import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note3/constants/sizes.dart';
import 'package:idea_note3/data/db_config.dart';
import 'package:idea_note3/data/db_helper.dart';
import 'package:idea_note3/features/screens/edit_screen/edit_screen.dart';
import 'package:idea_note3/features/widgets/confirm_button.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(
          Sizes.size24,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// motive
                    const Text(
                      "아이디어를 떠올린 계기",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: Sizes.size10,
                        bottom: Sizes.size30,
                      ),
                      child: Text(
                        ideaInfo!.motive,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),

                    /// content
                    const Text(
                      "아이디어 내용",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: Sizes.size10,
                        bottom: Sizes.size30,
                      ),
                      child: Text(
                        ideaInfo!.content,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),

                    /// importance
                    const Text(
                      "아이디어를 중요도 점수",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: Sizes.size10,
                        bottom: Sizes.size30,
                      ),
                      child: RatingBar.builder(
                        initialRating: ideaInfo!.importance.toDouble(),
                        itemCount: 5,
                        minRating: 1,
                        itemSize: Sizes.size34,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        ignoreGestures: true,
                        updateOnDrag: false,
                        direction: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return const FaIcon(
                            FontAwesomeIcons.star,
                            color: Colors.amberAccent,
                          );
                        },
                        onRatingUpdate: (double value) {},
                      ),
                    ),

                    /// feedback
                    const Text(
                      "유저 피드백 사항",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: Sizes.size10,
                        bottom: Sizes.size30,
                      ),
                      child: Text(
                        ideaInfo!.feedback,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Edit Button
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  EditScreen.routeName,
                  arguments: ideaInfo,
                );
              },
              child: const ConfirmButton(status: "수정하기"),
            ),
          ],
        ),
      ),
    );
  }
}
