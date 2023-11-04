import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';
import 'package:idea_note3/data/db_config.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    this.ideaInfo,
  });

  static String routeName = "/detail";

  final IdeaInfo? ideaInfo;

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
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("주의 하세요!"),
                    content: const Text("정말로 삭제 하시겠어요?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "취소",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "확인",
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
              //Navigator.of(context).pop();
            },
            child: const Text(
              "삭제",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: Sizes.size16,
              ),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
