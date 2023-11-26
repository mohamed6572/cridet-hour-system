class Category_Model {
  Status? status;
  Data? data;

  Category_Model({this.status, this.data});

  Category_Model.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Status {
  bool? status;
  int? hTTPCode;
  String? hTTPResponse;

  Status({this.status, this.hTTPCode, this.hTTPResponse});

  Status.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    hTTPCode = json['HTTP_code'];
    hTTPResponse = json['HTTP_response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['HTTP_code'] = this.hTTPCode;
    data['HTTP_response'] = this.hTTPResponse;
    return data;
  }
}

class Data {
  List<Categories>? categories;
  String? linkToShare;

  Data({this.categories,this.linkToShare});

  Data.fromJson(Map<String, dynamic> json) {
    linkToShare = json['linkToShare'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkToShare'] = this.linkToShare;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;
  int? imagesCount;

  Categories({this.id, this.name, this.slug, this.imagesCount});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    imagesCount = json['images_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['images_count'] = this.imagesCount;
    return data;
  }
}
