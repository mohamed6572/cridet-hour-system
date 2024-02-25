class Absennse_Model{
  String? name;
  List<dynamic>? list_t =[];
  List<dynamic>? date =[];
  String? uid;
  Absennse_Model({
    required this.name,
    required this.uid,
    required this.date,
    required this.list_t,
  });
  factory Absennse_Model.fromJson(Map<String, dynamic> json) {
    return Absennse_Model(
      name: json['name'],
      uid: json['uid'],
      list_t: json['list_t'],
      date: json['date'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'list_t': list_t,
      'date': date,
      'uid': uid,
      'name': name,

    };
  }
}