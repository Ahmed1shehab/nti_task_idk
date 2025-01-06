class PostModel {
  final int postID;
  final String postString;
  final String postBody;

  PostModel({
    required this.postID,
    required this.postString,
    required this.postBody,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postID: json['postID'] as int,
      postString: json['postString'] as String,
      postBody: json['postBody'] as String,
    );
  }
}
