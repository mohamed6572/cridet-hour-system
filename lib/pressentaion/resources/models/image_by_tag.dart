class ImageByTag {
  Status? status;
  Data? data;

  ImageByTag({this.status, this.data});

  ImageByTag.fromJson(Map<String, dynamic> json) {
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
  int? nextPageId;
  int? previousPageId;
  String? linkToShare;
  bool? morePage;
  List<Images_ByTag>? images;

  Data({this.nextPageId, this.previousPageId, this.morePage, this.images, this.linkToShare});

  Data.fromJson(Map<String, dynamic> json) {
    nextPageId = json['next_page_id'];
    linkToShare = json['linkToShare'];
    previousPageId = json['previous_page_id'];
    morePage = json['more_page'];
    if (json['images'] != null) {
      images = <Images_ByTag>[];
      json['images'].forEach((v) {
        images!.add(new Images_ByTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next_page_id'] = this.nextPageId;
    data['linkToShare'] = this.linkToShare;
    data['previous_page_id'] = this.previousPageId;
    data['more_page'] = this.morePage;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images_ByTag {
  int? id;
  String? title;
  String? imageThumbnail;
  String? imageThemeBackground;

  Images_ByTag({this.id, this.title, this.imageThumbnail, this.imageThemeBackground});

  Images_ByTag.fromJson(Map<String, dynamic> json) {
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
