class IdeaInfo {
  /// Data Class: DTO
  int? id; // PK, AUTO INCREMENT
  String title; // 아이디어 제목
  String motive; // 아이디어 동기
  String content; // 아이디어 내용
  int importance; // 아이디어 중요도 점수
  String feedback; // 유저 피드백 사항
  int dateTime; // 게시글 작성일

  /// Constructor
  IdeaInfo({
    this.id,
    required this.title,
    required this.motive,
    required this.content,
    required this.importance,
    required this.feedback,
    required this.dateTime,
  });

  /// <form name="" id="" action="?" method="post">
  ///   <input type="hidden" id="" value="">
  ///   <input type="hidden" id="" value="">
  ///   ...
  /// </form>
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "motive": motive,
      "content": content,
      "importance": importance,
      "feedback": feedback,
      "dateTime": dateTime
    };
  }

  /// print_r($_POST);
  /// $instance = $_POST["key"];
  factory IdeaInfo.fromMap(Map<String, dynamic> map) {
    return IdeaInfo(
      id: map["id"],
      title: map["title"],
      motive: map["motive"],
      content: map["content"],
      importance: map["importance"],
      feedback: map["feedback"],
      dateTime: map["dateTime"],
    );
  }
}
