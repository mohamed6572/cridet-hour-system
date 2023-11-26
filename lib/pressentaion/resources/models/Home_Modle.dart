class Home_Model {
  Status? status;
  Data? data;

  Home_Model({this.status, this.data});

  Home_Model.fromJson(Map<String, dynamic> json) {
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
  List<String>? collections;
  List<CollectionsTags>? collectionsTags;
  String? linkToShare; int? nextPageId;
  int? previousPageId;
  bool? morePage;
  List<Images_Home>? images;

  Data({this.collections, this.linkToShare, this.images, this.nextPageId,
    this.previousPageId,
    this.collectionsTags,
    this.morePage,});

  Data.fromJson(Map<String, dynamic> json) {
    collections = json['collections'].cast<String>();
    if (json['collections_tags'] != null) {
      collectionsTags = <CollectionsTags>[];
      json['collections_tags'].forEach((v) {
        collectionsTags!.add(new CollectionsTags.fromJson(v));
      });
    }
    nextPageId = json['next_page_id'];
    previousPageId = json['previous_page_id'];
    morePage = json['more_page'];
    linkToShare = json['linkToShare'];
    if (json['images'] != null) {
      images = <Images_Home>[];
      json['images'].forEach((v) {
        images!.add(new Images_Home.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collections'] = this.collections;
    if (this.collectionsTags != null) {
      data['collections_tags'] =
          this.collectionsTags!.map((v) => v.toJson()).toList();
    }
    data['next_page_id'] = this.nextPageId;
    data['previous_page_id'] = this.previousPageId;
    data['more_page'] = this.morePage;
    data['linkToShare'] = this.linkToShare;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class CollectionsTags {
  String? name;
  String? slug;

  CollectionsTags({this.name, this.slug});

  CollectionsTags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Images_Home {
  int? id;
  String? title;
  String? imageThumbnail;
  String? imageThemeBackground;

  Images_Home({this.id, this.title, this.imageThumbnail, this.imageThemeBackground});

  Images_Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageThumbnail = json['image_thumbnail'];
    imageThemeBackground = json['image_theme_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_thumbnail'] = this.imageThumbnail;
    data['image_theme_background'] = this.imageThemeBackground;
    return data;
  }
}
