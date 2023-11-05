import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';
import 'package:idea_note3/data/db_config.dart';
import 'package:idea_note3/data/db_helper.dart';
import 'package:idea_note3/features/screens/detail_screen/detail_screen.dart';
import 'package:idea_note3/features/screens/edit_screen/edit_screen.dart';
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

  /// Access to DB Server
  var dbHelper = DatabaseHelper();

  /// Prepare List array for appending DB Instances
  List<IdeaInfo> lstIdeaInfo = [];

  /// READ Database
  Future<void> _getIdeaInfo() async {
    /// Get all DB Instances from <db_config.dart>
    await dbHelper.initDatabase();

    /// Append DB Instances to Array
    lstIdeaInfo = await dbHelper.selectIdeaInfo();

    /// SELECT * FROM `jh_write_idea` WHERE (1) ORDER BY datetime DESC
    lstIdeaInfo.sort(
      (IdeaInfo a, IdeaInfo b) => b.dateTime.compareTo(a.dateTime),
    );
    setState(() {});
  }

  Future<void> insertDummyData() async {
    await dbHelper.initDatabase();
    await dbHelper.insertIdeaInfo(
      IdeaInfo(
        title: "해병 수육을 만드는 방법",
        motive: "황근출 해병님의 해병 제트킥을 맞아보고서 생각난 아이디어",
        content: "막사에 아무렇게나 굴러 다니는 황룡을 잡아서 수육으로 만들자!",
        importance: 4,
        feedback: "따흐흑! 따흐흑! 비켜 나세요! 아쎄이가 나갑니다! 따흐흐흐흑!",
        dateTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _backHandlerButton = BackHandlerButton(context: context);
    _getIdeaInfo();
    //insertDummyData();
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
            itemCount: lstIdeaInfo.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  var result = await Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: lstIdeaInfo[index],
                  );

                  if (result != null) {
                    String msg = "";

                    /// 1. 수정하기 Action (update)
                    if (result == "update") {
                      msg = "게시글 수정이 완료되었습니다.";
                    } else if (result == "delete") {
                      /// 2. 삭제하기 Action (delete)
                      msg = "게시글 삭제가 완료되었습니다.";
                    }
                    _getIdeaInfo();

                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(msg),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    }
                  }
                },
                child: IdeaList(
                  index: index,
                  lstIdeaInfo: lstIdeaInfo,
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
          onPressed: () async {
            var result = await Navigator.pushNamed(
              context,
              EditScreen.routeName,
            );

            if (result != null) {
              _getIdeaInfo();

              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("게시글 작성이 완료되었습니다!"),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            }
          },
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
