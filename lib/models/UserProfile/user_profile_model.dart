class UserProfileModel {
  bool? success;
  String? message;
  Data? data;

  UserProfileModel({this.success, this.message, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? location;
  String? registrationType;
  Null gstNumber;
  Null businessDocumentUrl;
  String? role;
  bool? blocked;
  String? isApproved;
  Null adminRemarks;
  String? aadharNo;
  String? panCardNo;
  int? registeredUsersCount;
  String? createdAt;
  String? updatedAt;

  Data({
    this.sId,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.registrationType,
    this.gstNumber,
    this.businessDocumentUrl,
    this.role,
    this.blocked,
    this.isApproved,
    this.adminRemarks,
    this.aadharNo,
    this.panCardNo,
    this.registeredUsersCount,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    location = json['location'];
    registrationType = json['registrationType'];
    gstNumber = json['gstNumber'];
    businessDocumentUrl = json['businessDocumentUrl'];
    role = json['role'];
    blocked = json['blocked'];
    isApproved = json['isApproved'];
    adminRemarks = json['adminRemarks'];
    aadharNo = json['aadharNo'];
    panCardNo = json['panCardNo'];
    registeredUsersCount = json['registeredUsersCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['registrationType'] = this.registrationType;
    data['gstNumber'] = this.gstNumber;
    data['businessDocumentUrl'] = this.businessDocumentUrl;
    data['role'] = this.role;
    data['blocked'] = this.blocked;
    data['isApproved'] = this.isApproved;
    data['adminRemarks'] = this.adminRemarks;
    data['aadharNo'] = this.aadharNo;
    data['panCardNo'] = this.panCardNo;
    data['registeredUsersCount'] = this.registeredUsersCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
