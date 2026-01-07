import 'package:hive/hive.dart';

part 'partner_hive.g.dart';

@HiveType(typeId: 2)
class PartnerHive extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? phone;

  @HiveField(4)
  String? location;

  @HiveField(5)
  String? registrationType;

  @HiveField(6)
  String? gstNumber;

  @HiveField(7)
  String? businessDocumentUrl;

  @HiveField(8)
  String? role;

  @HiveField(9)
  bool? blocked;

  @HiveField(10)
  String? isApproved;

  @HiveField(11)
  String? createdAt;

  @HiveField(12)
  String? updatedAt;

  @HiveField(13)
  int? registeredUsersCount;

  PartnerHive({
    this.id,
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
    this.createdAt,
    this.registeredUsersCount,
    this.updatedAt,
  });
}
