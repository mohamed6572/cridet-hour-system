class Cat_Det {
  Status? status;
  Data? data;

  Cat_Det({this.status, this.data});

  Cat_Det.fromJson(Map<String, dynamic> json) {
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
  Category? category;
  List<SubCategories>? subCategories;
  int? nextPageId;
  int? previousPageId;
  String? linkToShare;
  bool? morePage;
  List<Images>? images;

  Data(
      {this.category,
        this.subCategories,
        this.nextPageId,
        this.linkToShare,
        this.previousPageId,
        this.morePage,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    linkToShare = json['linkToShare'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
    nextPageId = json['next_page_id'];
    previousPageId = json['previous_page_id'];
    morePage = json['more_page'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    data['linkToShare'] = this.linkToShare;
    data['next_page_id'] = this.nextPageId;
    data['previous_page_id'] = this.previousPageId;
    data['more_page'] = this.morePage;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  String? name;
  String? slug;
  int? imagesCount;

  SubCategories({this.id, this.name, this.slug, this.imagesCount});

  SubCategories.fromJson(Map<String, dynamic> json) {
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

class Category {
  int? id;
  String? name;
  String? slug;
  int? imagesCount;

  Category({this.id, this.name, this.slug, this.imagesCount});

  Category.fromJson(Map<String, dynamic> json) {
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

class Images {
  int? id;
  String? title;
  String? imageThumbnail;
  String? imageThemeBackground;

  Images({this.id, this.title, this.imageThumbnail, this.imageThemeBackground});

  Images.fromJson(Map<String, dynamic> json) {
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
