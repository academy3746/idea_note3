import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';
import 'package:idea_note3/data/db_config.dart';
import 'package:idea_note3/data/db_helper.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    this.ideaInfo,
    required this.dbHelper,
    required this.context,
  });

  final BuildContext context;

  final IdeaInfo? ideaInfo;

  final DatabaseHelper dbHelper;

  Future<void> _setDeleteIdeaInfo(int id) async {
    await dbHelper.initDatabase();
    await dbHelper.deleteIdeaInfo(id);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
                    /// Pop-up window close
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
                  onPressed: () async {
                    await _setDeleteIdeaInfo(ideaInfo!.id!);
                    if (context.mounted) {
                      /// 1. Pop-up window close
                      Navigator.of(context).pop();

                      /// 2. Exit current screen
                      Navigator.pop(context, "delete");
                    }
                  },
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
      },
      child: const Text(
        "삭제",
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: Sizes.size16,
        ),
      ),
    );
  }
}
