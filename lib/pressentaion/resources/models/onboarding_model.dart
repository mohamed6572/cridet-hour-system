class OnBoardingModel {
  Status? status;
  Data? data;

  OnBoardingModel({this.status, this.data});

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
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
  List<OnBoarding>? onBoarding;
  String? appLogo;

  Data({this.onBoarding, this.appLogo});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['onBoarding'] != null) {
      onBoarding = <OnBoarding>[];
      json['onBoarding'].forEach((v) {
        onBoarding!.add(new OnBoarding.fromJson(v));
      });
    }
    appLogo = json['app_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.onBoarding != null) {
      data['onBoarding'] = this.onBoarding!.map((v) => v.toJson()).toList();
    }
    data['app_logo'] = this.appLogo;
    return data;
  }
}

class OnBoarding {
  int? id;
  String? title;
  String? image;

  OnBoarding({this.id, this.title, this.image});

  OnBoarding.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
