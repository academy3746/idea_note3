import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';
import 'package:idea_note3/data/db_config.dart';
import 'package:idea_note3/features/widgets/importance_bar.dart';
import 'package:intl/intl.dart';

class IdeaList extends StatelessWidget {
  const IdeaList({
    super.key,
    required this.index,
    required this.lstIdeaInfo,
  });

  final int index;
  final List<IdeaInfo> lstIdeaInfo;

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
            child: Text(
              "# ${lstIdeaInfo[index].title}",
              style: const TextStyle(
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
                DateFormat("yyyy.MM.dd HH:mm").format(
                  DateTime.fromMillisecondsSinceEpoch(
                      lstIdeaInfo[index].dateTime),
                ),
                style: TextStyle(
                  fontSize: Sizes.size10,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),

          /// importance
          ImportanceBar(
            lstIdeaInfo: lstIdeaInfo,
            index: index,
          ),
        ],
      ),
    );
  }
}
