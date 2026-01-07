class CibilScoreModel {
  bool? success;
  String? message;
  Report? report;
  User? user;

  CibilScoreModel({this.success, this.message, this.report, this.user});

  CibilScoreModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    report =
        json['report'] != null ? new Report.fromJson(json['report']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.report != null) {
      data['report'] = this.report!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Report {
  String? sId;
  UserId? userId;
  String? reportGeneratedAt;
  PersonalInfo? personalInfo;
  Score? score;
  List<Addresses>? addresses;
  List<Enquiries>? enquiries;
  List<Accounts>? accounts;
  Summary? summary;
  PaymentHistoryAnalysis? paymentHistoryAnalysis;
  String? pdfUrl;

  Report(
      {this.sId,
      this.userId,
      this.reportGeneratedAt,
      this.personalInfo,
      this.score,
      this.addresses,
      this.enquiries,
      this.accounts,
      this.summary,
      this.paymentHistoryAnalysis,
      this.pdfUrl});

  Report.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    reportGeneratedAt = json['reportGeneratedAt'];
    personalInfo = json['personalInfo'] != null
        ? new PersonalInfo.fromJson(json['personalInfo'])
        : null;
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    if (json['enquiries'] != null) {
      enquiries = <Enquiries>[];
      json['enquiries'].forEach((v) {
        enquiries!.add(new Enquiries.fromJson(v));
      });
    }
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(new Accounts.fromJson(v));
      });
    }
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    paymentHistoryAnalysis = json['paymentHistoryAnalysis'] != null
        ? new PaymentHistoryAnalysis.fromJson(json['paymentHistoryAnalysis'])
        : null;
    pdfUrl = json['pdfUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['reportGeneratedAt'] = this.reportGeneratedAt;
    if (this.personalInfo != null) {
      data['personalInfo'] = this.personalInfo!.toJson();
    }
    if (this.score != null) {
      data['score'] = this.score!.toJson();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    if (this.enquiries != null) {
      data['enquiries'] = this.enquiries!.map((v) => v.toJson()).toList();
    }
    if (this.accounts != null) {
      data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.paymentHistoryAnalysis != null) {
      data['paymentHistoryAnalysis'] = this.paymentHistoryAnalysis!.toJson();
    }
    data['pdfUrl'] = this.pdfUrl;
    return data;
  }
}

class UserId {
  Location? location;
  String? sId;
  String? aadharNo;

  UserId({this.location, this.sId, this.aadharNo});

  UserId.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
    aadharNo = json['aadharNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    data['aadharNo'] = this.aadharNo;
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

  Location({
    this.fullAddress,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.country,
  });

  Location.fromJson(Map<String, dynamic> json) {
    fullAddress = json['fullAddress'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    return {
      'fullAddress': fullAddress,
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'state': state,
      'country': country,
    };
  }
}

class PersonalInfo {
  String? name;
  String? birthDate;
  String? pan;
  String? gender;
  List<String>? mobiles;
  List<dynamic>? emails;

  PersonalInfo({
    this.name,
    this.birthDate,
    this.pan,
    this.gender,
    this.mobiles,
    this.emails,
  });

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthDate = json['birthDate'];
    pan = json['pan'];
    gender = json['gender'];
    mobiles =
        json['mobiles'] != null ? List<String>.from(json['mobiles']) : null;
    emails = json['emails'] != null ? List<dynamic>.from(json['emails']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birthDate': birthDate,
      'pan': pan,
      'gender': gender,
      'mobiles': mobiles,
      'emails': emails,
    };
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

class Addresses {
  int? index;
  int? category;
  String? type;
  String? line1;
  String? line2;
  int? pinCode;
  int? stateCode;

  Addresses(
      {this.index,
      this.category,
      this.type,
      this.line1,
      this.line2,
      this.pinCode,
      this.stateCode});

  Addresses.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    category = json['category'];
    type = json['type'];
    line1 = json['line1'];
    line2 = json['line2'];
    pinCode = json['pinCode'];
    stateCode = json['stateCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['category'] = this.category;
    data['type'] = this.type;
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['pinCode'] = this.pinCode;
    data['stateCode'] = this.stateCode;
    return data;
  }
}

class Enquiries {
  String? purpose;
  String? institution;
  String? date;

  Enquiries({this.purpose, this.institution, this.date});

  Enquiries.fromJson(Map<String, dynamic> json) {
    purpose = json['purpose'];
    institution = json['institution'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['purpose'] = this.purpose;
    data['institution'] = this.institution;
    data['date'] = this.date;
    return data;
  }
}

class Accounts {
  int? accountIndex;
  String? accountType;
  String? memberShortName;
  String? accountNumberMasked;
  String? ownership;
  String? accountStatus;
  String? dateOpened;
  String? dateClosed;
  String? lastPaymentDate;
  String? lastBankUpdate;
  int? repaymentTenureMonths;
  int? emiAmount;
  int? currentBalance;
  int? highCreditAmount;
  int? amountOverdue;
  String? paymentFrequency;
  dynamic interestRate; // ✅ FIXED
  List<MonthlyHistory>? monthlyHistory;
  int? monthsReported;
  List<dynamic>? yearBuckets; // ✅ FIXED

  Accounts({
    this.accountIndex,
    this.accountType,
    this.memberShortName,
    this.accountNumberMasked,
    this.ownership,
    this.accountStatus,
    this.dateOpened,
    this.dateClosed,
    this.lastPaymentDate,
    this.lastBankUpdate,
    this.repaymentTenureMonths,
    this.emiAmount,
    this.currentBalance,
    this.highCreditAmount,
    this.amountOverdue,
    this.paymentFrequency,
    this.interestRate,
    this.monthlyHistory,
    this.monthsReported,
    this.yearBuckets,
  });

  Accounts.fromJson(Map<String, dynamic> json) {
    accountIndex = json['accountIndex'];
    accountType = json['accountType'];
    memberShortName = json['memberShortName'];
    accountNumberMasked = json['accountNumberMasked'];
    ownership = json['ownership'];
    accountStatus = json['accountStatus'];
    dateOpened = json['dateOpened'];
    dateClosed = json['dateClosed'];
    lastPaymentDate = json['lastPaymentDate'];
    lastBankUpdate = json['lastBankUpdate'];
    repaymentTenureMonths = json['repaymentTenureMonths'];
    emiAmount = json['emiAmount'];
    currentBalance = json['currentBalance'];
    highCreditAmount = json['highCreditAmount'];
    amountOverdue = json['amountOverdue'];
    paymentFrequency = json['paymentFrequency'];
    interestRate = json['interestRate'];

    monthlyHistory = json['monthlyHistory'] != null
        ? (json['monthlyHistory'] as List)
            .map((v) => MonthlyHistory.fromJson(v))
            .toList()
        : null;

    monthsReported = json['monthsReported'];

    yearBuckets = json['yearBuckets'] != null
        ? List<dynamic>.from(json['yearBuckets'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'accountIndex': accountIndex,
      'accountType': accountType,
      'memberShortName': memberShortName,
      'accountNumberMasked': accountNumberMasked,
      'ownership': ownership,
      'accountStatus': accountStatus,
      'dateOpened': dateOpened,
      'dateClosed': dateClosed,
      'lastPaymentDate': lastPaymentDate,
      'lastBankUpdate': lastBankUpdate,
      'repaymentTenureMonths': repaymentTenureMonths,
      'emiAmount': emiAmount,
      'currentBalance': currentBalance,
      'highCreditAmount': highCreditAmount,
      'amountOverdue': amountOverdue,
      'paymentFrequency': paymentFrequency,
      'interestRate': interestRate,
      'monthlyHistory': monthlyHistory?.map((v) => v.toJson()).toList(),
      'monthsReported': monthsReported,
      'yearBuckets': yearBuckets,
    };
  }
}

class MonthlyHistory {
  String? date;
  String? status;

  MonthlyHistory({this.date, this.status});

  MonthlyHistory.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}

class Summary {
  int? totalActiveLoans;
  int? totalActiveCreditCards;
  int? totalLoanOutstanding;
  int? totalCardOutstanding;
  int? overduePaymentsCount;
  String? ageOfOldestAccount;
  int? recentEnquiriesCount3m;
  int? totalAccounts;

  Summary(
      {this.totalActiveLoans,
      this.totalActiveCreditCards,
      this.totalLoanOutstanding,
      this.totalCardOutstanding,
      this.overduePaymentsCount,
      this.ageOfOldestAccount,
      this.recentEnquiriesCount3m,
      this.totalAccounts});

  Summary.fromJson(Map<String, dynamic> json) {
    totalActiveLoans = json['totalActiveLoans'];
    totalActiveCreditCards = json['totalActiveCreditCards'];
    totalLoanOutstanding = json['totalLoanOutstanding'];
    totalCardOutstanding = json['totalCardOutstanding'];
    overduePaymentsCount = json['overduePaymentsCount'];
    ageOfOldestAccount = json['ageOfOldestAccount'];
    recentEnquiriesCount3m = json['recentEnquiriesCount3m'];
    totalAccounts = json['totalAccounts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalActiveLoans'] = this.totalActiveLoans;
    data['totalActiveCreditCards'] = this.totalActiveCreditCards;
    data['totalLoanOutstanding'] = this.totalLoanOutstanding;
    data['totalCardOutstanding'] = this.totalCardOutstanding;
    data['overduePaymentsCount'] = this.overduePaymentsCount;
    data['ageOfOldestAccount'] = this.ageOfOldestAccount;
    data['recentEnquiriesCount3m'] = this.recentEnquiriesCount3m;
    data['totalAccounts'] = this.totalAccounts;
    return data;
  }
}

class PaymentHistoryAnalysis {
  SeverityBreakdown? severityBreakdown;
  int? totalBouncesOrDelays;
  int? recentBounces3Months;
  int? recentBounces6Months;
  List<dynamic>? allBounces; // ✅ FIXED
  List<dynamic>? last6MonthsBounces; // ✅ FIXED
  String? analyzedAt;
  String? analysisVersion;

  PaymentHistoryAnalysis({
    this.severityBreakdown,
    this.totalBouncesOrDelays,
    this.recentBounces3Months,
    this.recentBounces6Months,
    this.allBounces,
    this.last6MonthsBounces,
    this.analyzedAt,
    this.analysisVersion,
  });

  PaymentHistoryAnalysis.fromJson(Map<String, dynamic> json) {
    severityBreakdown = json['severityBreakdown'] != null
        ? SeverityBreakdown.fromJson(json['severityBreakdown'])
        : null;
    totalBouncesOrDelays = json['totalBouncesOrDelays'];
    recentBounces3Months = json['recentBounces3Months'];
    recentBounces6Months = json['recentBounces6Months'];

    allBounces = json['allBounces'] != null
        ? List<dynamic>.from(json['allBounces'])
        : null;

    last6MonthsBounces = json['last6MonthsBounces'] != null
        ? List<dynamic>.from(json['last6MonthsBounces'])
        : null;

    analyzedAt = json['analyzedAt'];
    analysisVersion = json['analysisVersion'];
  }

  Map<String, dynamic> toJson() {
    return {
      'severityBreakdown': severityBreakdown?.toJson(),
      'totalBouncesOrDelays': totalBouncesOrDelays,
      'recentBounces3Months': recentBounces3Months,
      'recentBounces6Months': recentBounces6Months,
      'allBounces': allBounces,
      'last6MonthsBounces': last6MonthsBounces,
      'analyzedAt': analyzedAt,
      'analysisVersion': analysisVersion,
    };
  }
}

class SeverityBreakdown {
  int? mild;
  int? moderate;
  int? severe;
  int? critical;

  SeverityBreakdown({this.mild, this.moderate, this.severe, this.critical});

  SeverityBreakdown.fromJson(Map<String, dynamic> json) {
    mild = json['mild'];
    moderate = json['moderate'];
    severe = json['severe'];
    critical = json['critical'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mild'] = this.mild;
    data['moderate'] = this.moderate;
    data['severe'] = this.severe;
    data['critical'] = this.critical;
    return data;
  }
}

class User {
  String? aadharNo;
  Location? address;

  User({this.aadharNo, this.address});

  User.fromJson(Map<String, dynamic> json) {
    aadharNo = json['aadharNo'];
    address =
        json['address'] != null ? new Location.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aadharNo'] = this.aadharNo;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}
