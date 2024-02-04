class Courses_Model{
  String? name;
  String? Link;
  String? uid;
  Courses_Model({
    required this.name,
    required this.uid,
    required this.Link,
});
  factory Courses_Model.fromJson(Map<String, dynamic> json) {
    return Courses_Model(
      name: json['name'],
      uid: json['uid'],
      Link: json['Link'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Link': Link,
      'uid': uid,
      'name': name,

    };
  }
}