class Subject_Model {
  String? code;
  String? uid;
  String? dr_name;
  String? nameSubject;
  String? hours;
  double? grade;
  String? needs;
  Subject_Model(
      {required this.code,
        required this.uid,
        required this.dr_name,
        required this.nameSubject,
        required this.grade,
        required this.hours,
        required this.needs});

  factory Subject_Model.fromJson(Map<String, dynamic> json){
    return Subject_Model(code: json['code'],
        uid: json['uid'],
        dr_name: json['dr_name'],
        grade: json['grade'],
        nameSubject: json['nameSubject'],
        hours: json['hours'],
        needs:json ['needs']);
  }
  Map<String, dynamic> toJson(){
    return{
      'code':code,
      'grade':grade,
      'dr_name':dr_name,
      'nameSubject':nameSubject,
      'hours':hours,
      'needs':needs,
      'uid':uid,
    };
  }
}