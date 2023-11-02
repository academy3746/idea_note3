import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';
import 'package:idea_note3/features/widgets/back_handler_button.dart';
import 'package:idea_note3/features/widgets/idea_list_builder.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static String routeName = "/main";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Exit Application with SnackBar on foreground
  late BackHandlerButton _backHandlerButton;

  @override
  void initState() {
    super.initState();

    _backHandlerButton = BackHandlerButton(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backHandlerButton.onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "IDEA NOTE",
            style: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size32,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
            vertical: Sizes.size16,
          ),
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return IdeaList(index: index);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
          onPressed: () {},
          child: Image.asset(
            "assets/images/post.png",
            color: Colors.white,
            height: Sizes.size28,
            width: Sizes.size28,
          ),
        ),
      ),
    );
  }
}
