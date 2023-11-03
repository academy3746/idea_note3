import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';

class ImportanceButton extends StatelessWidget {
  const ImportanceButton({
    super.key,
    required this.importanceScore,
    required this.isClicked,
  });

  final int importanceScore;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Sizes.size40,
      width: Sizes.size50,
      decoration: ShapeDecoration(
        color: isClicked ? Theme.of(context).primaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
        ),
      ),
      child: Text(
        importanceScore.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isClicked ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
