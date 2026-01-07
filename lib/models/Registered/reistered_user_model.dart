class RegisterdUserModel {
  bool? success;
  int? page;
  int? totalPages;
  int? totalUsers;
  List<Users>? users;

  RegisterdUserModel(
      {this.success, this.page, this.totalPages, this.totalUsers, this.users});

  RegisterdUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    page = json['page'];
    totalPages = json['totalPages'];
    totalUsers = json['totalUsers'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    data['totalUsers'] = this.totalUsers;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? sId;
  String? name;
  String? gender;
  Null email;
  int? phone;
  Location? location;
  String? aadharNo;
  String? dateOfBirth;
  String? panCardNo;
  bool? cibilAgree;
  String? role;
  CibilApiUsage? cibilApiUsage;
  RegisteredBy? registeredBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  CibilReport? cibilReport;

  Users(
      {this.sId,
      this.name,
      this.gender,
      this.email,
      this.phone,
      this.location,
      this.aadharNo,
      this.dateOfBirth,
      this.panCardNo,
      this.cibilAgree,
      this.role,
      this.cibilApiUsage,
      this.registeredBy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.cibilReport});

  Users.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    aadharNo = json['aadharNo'];
    dateOfBirth = json['dateOfBirth'];
    panCardNo = json['panCardNo'];
    cibilAgree = json['cibilAgree'];
    role = json['role'];
    cibilApiUsage = json['cibilApiUsage'] != null
        ? new CibilApiUsage.fromJson(json['cibilApiUsage'])
        : null;
    registeredBy = json['registeredBy'] != null
        ? new RegisteredBy.fromJson(json['registeredBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    cibilReport = json['cibilReport'] != null
        ? new CibilReport.fromJson(json['cibilReport'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['aadharNo'] = this.aadharNo;
    data['dateOfBirth'] = this.dateOfBirth;
    data['panCardNo'] = this.panCardNo;
    data['cibilAgree'] = this.cibilAgree;
    data['role'] = this.role;
    if (this.cibilApiUsage != null) {
      data['cibilApiUsage'] = this.cibilApiUsage!.toJson();
    }
    if (this.registeredBy != null) {
      data['registeredBy'] = this.registeredBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.cibilReport != null) {
      data['cibilReport'] = this.cibilReport!.toJson();
    }
    return data;
  }
}

class Location {
  String? fullAddress;
  dynamic latitude;
  dynamic longitude;
  dynamic city;
  dynamic state;
  dynamic country;

  Location(
      {this.fullAddress,
      this.latitude,
      this.longitude,
      this.city,
      this.state,
      this.country});

  Location.fromJson(Map<String, dynamic> json) {
    fullAddress = json['fullAddress'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullAddress'] = this.fullAddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}

class CibilApiUsage {
  YearWise? yearWise;

  CibilApiUsage({this.yearWise});

  CibilApiUsage.fromJson(Map<String, dynamic> json) {
    yearWise = json['yearWise'] != null
        ? new YearWise.fromJson(json['yearWise'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.yearWise != null) {
      data['yearWise'] = this.yearWise!.toJson();
    }
    return data;
  }
}

class YearWise {
  YearWise.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class RegisteredBy {
  String? userType;
  String? userId;

  RegisteredBy({this.userType, this.userId});

  RegisteredBy.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userType'] = this.userType;
    data['userId'] = this.userId;
    return data;
  }
}

class CibilReport {
  String? reportGeneratedAt;
  Score? score;

  CibilReport({this.reportGeneratedAt, this.score});

  CibilReport.fromJson(Map<String, dynamic> json) {
    reportGeneratedAt = json['reportGeneratedAt'];
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportGeneratedAt'] = this.reportGeneratedAt;
    if (this.score != null) {
      data['score'] = this.score!.toJson();
    }
    return data;
  }
}

class Score {
  int? value;
  String? date;
  String? scoreCardName;
  List<Reasons>? reasons;

  Score({this.value, this.date, this.scoreCardName, this.reasons});

  Score.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    date = json['date'];
    scoreCardName = json['scoreCardName'];
    if (json['reasons'] != null) {
      reasons = <Reasons>[];
      json['reasons'].forEach((v) {
        reasons!.add(new Reasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['date'] = this.date;
    data['scoreCardName'] = this.scoreCardName;
    if (this.reasons != null) {
      data['reasons'] = this.reasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reasons {
  int? code;
  String? name;

  Reasons({this.code, this.name});

  Reasons.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}
