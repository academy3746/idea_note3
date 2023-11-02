import 'package:flutter/material.dart';

class BackHandlerButton {
  BuildContext context;
  DateTime? lastPressed;
  void Function()? onExit;

  BackHandlerButton({
    required this.context,
    this.onExit,
  });

  Future<bool> onWillPop() async {
    final now = DateTime.now();
    final bool interval = lastPressed == null ||
        now.difference(lastPressed!) > const Duration(seconds: 3);

    if (interval) {
      lastPressed = now;
      const snackBar = SnackBar(
        content: Text("뒤로가기 버튼을 한 번 더 누르면 앱이 종료됩니다."),
        duration: Duration(seconds: 2),
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(snackBar);
        return false;
      }
    } else {
      if (onExit != null) {
        onExit!();
        return true;
      }
    }

    return true;
  }
}
