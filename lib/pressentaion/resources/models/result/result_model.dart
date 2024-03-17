class Result_Model{
  List<dynamic>? grades =[];
  String? uid;
  Result_Model({
    required this.uid,
    required this.grades,
  });
  factory Result_Model.fromJson(Map<String, dynamic> json) {
    return Result_Model(
      uid: json['uid'],
      grades: json['grades'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'grades': grades,
      'uid': uid,

    };
  }
}
class ResultDataModel {
  List<Map<String, dynamic>>? grades;
  String? name;

  ResultDataModel({
    required this.name,
    required this.grades,
  });

  factory ResultDataModel.fromJson(Map<String, dynamic> json) {
    return ResultDataModel(
      name: json['name'],
      grades: List<Map<String, dynamic>>.from(json['grades']?.map((x) => x)),
    );
  }
}
