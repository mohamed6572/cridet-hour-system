class Last_Exam_Image_Model{
  String? url;
  String? uid;
  String? public_id;
  String? grade;
  Last_Exam_Image_Model({
    required this.url,
    required this.uid,
    required this.public_id,
    required this.grade,
  });
  factory Last_Exam_Image_Model.fromJson(Map<String, dynamic> json) {
    return Last_Exam_Image_Model(
      url: json['url'],
      public_id: json['public_id'],
      uid: json['uid'],
      grade: json['grade'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'public_id': public_id,
      'uid': uid,
      'grade': grade,

    };
  }
}