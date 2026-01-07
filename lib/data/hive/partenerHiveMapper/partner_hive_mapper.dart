import '../../../models/UserProfile/user_profile_model.dart';
import '../partener/partner_hive.dart';

extension PartnerHiveMapper on PartnerHive {
  static PartnerHive fromProfileApi(Data data) {
    return PartnerHive(
      id: data.sId,
      name: data.name,
      email: data.email,
      phone: data.phone,
      location: data.location,
      registrationType: data.registrationType,
      gstNumber: data.gstNumber,
      businessDocumentUrl: data.businessDocumentUrl,
      role: data.role,
      blocked: data.blocked,
      isApproved: data.isApproved,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      registeredUsersCount: data.registeredUsersCount,
    );
  }
}
