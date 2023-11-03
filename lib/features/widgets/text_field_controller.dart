import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';

class TextFieldController extends StatelessWidget {
  const TextFieldController({
    super.key,
    required this.controller,
    required this.vertical,
    required this.horizontal,
    this.maxLines,
    this.maxLength,
    required this.hintText,
    this.height,
    this.textInputAction,
  });

  final TextEditingController controller;
  final double vertical;
  final double horizontal;
  final int? maxLines;
  final int? maxLength;
  final String hintText;
  final double? height;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(
        top: Sizes.size12,
        bottom: Sizes.size24,
      ),
      child: TextField(
        maxLines: maxLines,
        maxLength: maxLength,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            vertical: vertical,
            horizontal: horizontal,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(
              Sizes.size10,
            ),
          ),
        ),
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
          fontSize: Sizes.size12,
        ),
      ),
    );
  }
}
