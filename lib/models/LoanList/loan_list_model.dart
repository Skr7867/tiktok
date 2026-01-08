class LoanListModel {
  bool? success;
  List<Data>? data;

  LoanListModel({this.success, this.data});

  LoanListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  DtiCalculation? dtiCalculation;
  VehicleInfo? vehicleInfo;
  ApplicationStatus? applicationStatus;
  String? sId;
  int? loanAmount;
  int? loanTenureMonths;

  Data({
    this.dtiCalculation,
    this.vehicleInfo,
    this.applicationStatus,
    this.sId,
    this.loanAmount,
    this.loanTenureMonths,
  });

  Data.fromJson(Map<String, dynamic> json) {
    dtiCalculation = json['dtiCalculation'] != null
        ? new DtiCalculation.fromJson(json['dtiCalculation'])
        : null;
    vehicleInfo = json['vehicleInfo'] != null
        ? new VehicleInfo.fromJson(json['vehicleInfo'])
        : null;
    applicationStatus = json['applicationStatus'] != null
        ? new ApplicationStatus.fromJson(json['applicationStatus'])
        : null;
    sId = json['_id'];
    loanAmount = json['loanAmount'];
    loanTenureMonths = json['loanTenureMonths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dtiCalculation != null) {
      data['dtiCalculation'] = this.dtiCalculation!.toJson();
    }
    if (this.vehicleInfo != null) {
      data['vehicleInfo'] = this.vehicleInfo!.toJson();
    }
    if (this.applicationStatus != null) {
      data['applicationStatus'] = this.applicationStatus!.toJson();
    }
    data['_id'] = this.sId;
    data['loanAmount'] = this.loanAmount;
    data['loanTenureMonths'] = this.loanTenureMonths;
    return data;
  }
}

class DtiCalculation {
  int? maxEligibleLoanAmount;

  DtiCalculation({this.maxEligibleLoanAmount});

  DtiCalculation.fromJson(Map<String, dynamic> json) {
    maxEligibleLoanAmount = json['maxEligibleLoanAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxEligibleLoanAmount'] = this.maxEligibleLoanAmount;
    return data;
  }
}

class VehicleInfo {
  String? vehicleType;
  String? vehicleBrand;
  String? vehicleModel;
  int? estimatedPrice;

  VehicleInfo({
    this.vehicleType,
    this.vehicleBrand,
    this.vehicleModel,
    this.estimatedPrice,
  });

  VehicleInfo.fromJson(Map<String, dynamic> json) {
    vehicleType = json['vehicleType'];
    vehicleBrand = json['vehicleBrand'];
    vehicleModel = json['vehicleModel'];
    estimatedPrice = json['estimatedPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleType'] = this.vehicleType;
    data['vehicleBrand'] = this.vehicleBrand;
    data['vehicleModel'] = this.vehicleModel;
    data['estimatedPrice'] = this.estimatedPrice;
    return data;
  }
}

class ApplicationStatus {
  String? currentStage;
  String? stage1CompletedAt;
  String? finalDecision;
  String? stage2CompletedAt;
  String? submittedAt;

  ApplicationStatus({
    this.currentStage,
    this.stage1CompletedAt,
    this.finalDecision,
    this.stage2CompletedAt,
    this.submittedAt,
  });

  ApplicationStatus.fromJson(Map<String, dynamic> json) {
    currentStage = json['currentStage'];
    stage1CompletedAt = json['stage1CompletedAt'];
    finalDecision = json['finalDecision'];
    stage2CompletedAt = json['stage2CompletedAt'];
    submittedAt = json['submittedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentStage'] = this.currentStage;
    data['stage1CompletedAt'] = this.stage1CompletedAt;
    data['finalDecision'] = this.finalDecision;
    data['stage2CompletedAt'] = this.stage2CompletedAt;
    data['submittedAt'] = this.submittedAt;
    return data;
  }
}
