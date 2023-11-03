import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.size66,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size8,
          ),
        ),
      ),
      child: Text(
        status,
        style: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
