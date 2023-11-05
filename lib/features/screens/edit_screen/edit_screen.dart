import 'package:flutter/material.dart';
import 'package:idea_note3/constants/sizes.dart';
import 'package:idea_note3/data/db_config.dart';
import 'package:idea_note3/data/db_helper.dart';
import 'package:idea_note3/features/widgets/confirm_button.dart';
import 'package:idea_note3/features/widgets/importance_button.dart';
import 'package:idea_note3/features/widgets/post_handler.dart';
import 'package:idea_note3/features/widgets/text_field_controller.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    this.ideaInfo,
  });

  static String routeName = "/edit";

  final IdeaInfo? ideaInfo;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  /// Initialize Database Helper
  final _dbHelper = DatabaseHelper();

  /// Text Input Field Status
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _motiveController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  /// Importance Select Status
  bool isClicked01 = false;
  bool isClicked02 = false;
  bool isClicked03 = true;
  bool isClicked04 = false;
  bool isClicked05 = false;

  /// Selected Importance Score Status: Default is 3
  int importanceScore = 3;

  /// Keyboard Unfocus
  void _keyboardUnfocus() {
    FocusScope.of(context).unfocus();
  }

  /// 게시물 등록 or 수정
  Future<void> _editComplete() async {
    PostHandler postHandler = PostHandler(
      context: context,
      titleValue: _titleController.text.toString(),
      motiveValue: _motiveController.text.toString(),
      contentValue: _contentController.text.toString(),
      feedbackValue: _feedbackController.text.toString(),
      score: importanceScore,
      databaseHelper: _dbHelper,
      ideaInfo: widget.ideaInfo,
    );

    await postHandler.databaseHandler();
  }

  void _initClickedStatus() {
    isClicked01 = false;
    isClicked02 = false;
    isClicked03 = false;
    isClicked04 = false;
    isClicked05 = false;
  }

  @override
  void initState() {
    super.initState();

    _titleController;
    _motiveController;
    _contentController;
    _feedbackController;

    if (widget.ideaInfo != null) {
      /// 기존 입력 필드 Data Load
      _titleController.text = widget.ideaInfo!.title;
      _motiveController.text = widget.ideaInfo!.motive;
      _contentController.text = widget.ideaInfo!.content;

      if (widget.ideaInfo!.feedback.isNotEmpty) {
        _feedbackController.text = widget.ideaInfo!.feedback;
      }

      /// Importance Score Load
      _initClickedStatus();
      switch (widget.ideaInfo!.importance) {
        case 1:
          isClicked01 = true;
          break;

        case 2:
          isClicked02 = true;
          break;

        case 3:
          isClicked03 = true;
          break;

        case 4:
          isClicked04 = true;
          break;

        case 5:
          isClicked05 = true;
          break;
      }

      importanceScore = widget.ideaInfo!.importance;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _motiveController.dispose();
    _contentController.dispose();
    _feedbackController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.ideaInfo == null ? "새 아이디어 작성하기" : "아이디어 수정하기",
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
      ),
      body: GestureDetector(
        onTap: _keyboardUnfocus,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// title
                const Text("제목"),
                TextFieldController(
                  controller: _titleController,
                  height: Sizes.size42,
                  vertical: 0,
                  horizontal: Sizes.size20,
                  hintText: "아이디어 제목을 작성해 주세요",
                  textInputAction: TextInputAction.next,
                ),

                /// motive
                const Text("아이디어를 떠올린 계기"),
                TextFieldController(
                  controller: _motiveController,
                  height: Sizes.size42,
                  vertical: 0,
                  horizontal: Sizes.size20,
                  hintText: "아이디어를 떠올린 계기가 있으신가요?",
                  textInputAction: TextInputAction.next,
                ),

                /// content
                const Text("아이디어 내용"),
                TextFieldController(
                  controller: _contentController,
                  vertical: Sizes.size20,
                  horizontal: Sizes.size20,
                  maxLines: 8,
                  maxLength: 1000,
                  hintText: "아이디어 내용을 상세히 작성해 주세요.",
                ),

                /// importance
                const Text("아이디어 중요도 점수"),
                Container(
                  margin: const EdgeInsets.only(
                    top: Sizes.size12,
                    bottom: Sizes.size24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: ImportanceButton(
                          importanceScore: 1,
                          isClicked: isClicked01,
                        ),
                        onTap: () {
                          _initClickedStatus();
                          setState(() {
                            isClicked01 = true;
                            importanceScore = 1;
                          });
                        },
                      ),
                      GestureDetector(
                        child: ImportanceButton(
                          importanceScore: 2,
                          isClicked: isClicked02,
                        ),
                        onTap: () {
                          _initClickedStatus();
                          setState(() {
                            isClicked02 = true;
                            importanceScore = 2;
                          });
                        },
                      ),
                      GestureDetector(
                        child: ImportanceButton(
                          importanceScore: 3,
                          isClicked: isClicked03,
                        ),
                        onTap: () {
                          _initClickedStatus();
                          setState(() {
                            isClicked03 = true;
                            importanceScore = 3;
                          });
                        },
                      ),
                      GestureDetector(
                        child: ImportanceButton(
                          importanceScore: 4,
                          isClicked: isClicked04,
                        ),
                        onTap: () {
                          _initClickedStatus();
                          setState(() {
                            isClicked04 = true;
                            importanceScore = 4;
                          });
                        },
                      ),
                      GestureDetector(
                        child: ImportanceButton(
                          importanceScore: 5,
                          isClicked: isClicked05,
                        ),
                        onTap: () {
                          _initClickedStatus();
                          setState(() {
                            isClicked05 = true;
                            importanceScore = 5;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                /// feedback
                const Text("유저 피드백 사항 (선택)"),
                TextFieldController(
                  controller: _feedbackController,
                  vertical: Sizes.size20,
                  horizontal: Sizes.size20,
                  maxLines: 5,
                  maxLength: 500,
                  hintText: "다른 회원님들에게 전달받은\n\n피드백 사항을 작성해 주세요",
                ),

                /// Confirm or Edit Button
                GestureDetector(
                  onTap: _editComplete,
                  child: ConfirmButton(
                    status: widget.ideaInfo == null ? "작성완료" : "수정완료",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
