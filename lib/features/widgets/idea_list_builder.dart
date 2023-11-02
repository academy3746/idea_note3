import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';
import 'package:idea_note3/features/widgets/importance_bar.dart';

class IdeaList extends StatelessWidget {
  const IdeaList({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.size80,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(Sizes.size8),
        ),
      ),
      margin: const EdgeInsets.only(
        top: Sizes.size20,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          /// title
          Container(
            margin: const EdgeInsets.only(
              left: Sizes.size12,
              bottom: Sizes.size16,
            ),
            child: const Text(
              "# 4차 산업혁명 시대에 개발자로 살아남기",
              style: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16,
              ),
            ),
          ),

          /// datetime
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(
                right: Sizes.size12,
                bottom: Sizes.size6,
              ),
              child: Text(
                "2023.11.02 22:03",
                style: TextStyle(
                  fontSize: Sizes.size10,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),

          /// importance
          const ImportanceBar(),
        ],
      ),
    );
  }
}