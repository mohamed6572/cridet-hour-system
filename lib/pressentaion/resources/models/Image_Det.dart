class Image_Det {
  Status? status;
  Data? data;

  Image_Det({this.status, this.data});

  Image_Det.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? title;
  String? uuidToken;
  String? preview;
  Null? prefix;
  Null? source;
  String? description;
  String? linkToShare;
  Category? category;
  String? createdAt;
  String? updatedAt;
  bool? isFile;
  String? background;
  String? copywrite;
  String? fileSize;
  String? photoType;
  String? resolution;
  String? downloadTokenId;
  String? ownerName;
  List<String>? tags;
  List<SimilarPhotos>? similarPhotos;

  Data(
      {this.id,
        this.title,
        this.uuidToken,
        this.preview,
        this.prefix,
        this.linkToShare,
        this.source,
        this.description,
        this.category,
        this.createdAt,
        this.updatedAt,
        this.isFile,
        this.background,
        this.copywrite,
        this.fileSize,
        this.photoType,
        this.resolution,
        this.downloadTokenId,
        this.ownerName,
        this.tags,
        this.similarPhotos});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    linkToShare = json['linkToShare'];
    title = json['title'];
    uuidToken = json['uuid_token'];
    preview = json['preview'];
    prefix = json['prefix'];
    source = json['source'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFile = json['is_file'];
    background = json['background'];
    copywrite = json['copywrite'];
    fileSize = json['file_size'];
    photoType = json['photo_type'];
    resolution = json['resolution'];
    downloadTokenId = json['download_token_id'];
    ownerName = json['owner_name'];
    tags = json['tags'].cast<String>();
    if (json['similar_photos'] != null) {
      similarPhotos = <SimilarPhotos>[];
      json['similar_photos'].forEach((v) {
        similarPhotos!.add(new SimilarPhotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['linkToShare'] = this.linkToShare;
    data['title'] = this.title;
    data['uuid_token'] = this.uuidToken;
    data['preview'] = this.preview;
    data['prefix'] = this.prefix;
    data['source'] = this.source;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_file'] = this.isFile;
    data['background'] = this.background;
    data['copywrite'] = this.copywrite;
    data['file_size'] = this.fileSize;
    data['photo_type'] = this.photoType;
    data['resolution'] = this.resolution;
    data['download_token_id'] = this.downloadTokenId;
    data['owner_name'] = this.ownerName;
    data['tags'] = this.tags;
    if (this.similarPhotos != null) {
      data['similar_photos'] =
          this.similarPhotos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class SimilarPhotos {
  int? id;
  String? title;
  String? imageThumbnail;
  String? imageThemeBackground;

  SimilarPhotos(
      {this.id, this.title, this.imageThumbnail, this.imageThemeBackground});

  SimilarPhotos.fromJson(Map<String, dynamic> json) {
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
