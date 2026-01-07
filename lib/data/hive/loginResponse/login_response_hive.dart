import 'package:dsa/data/hive/partener/partner_hive.dart';
import 'package:hive/hive.dart';
part 'login_response_hive.g.dart';

@HiveType(typeId: 1)
class LoginResponseHive extends HiveObject {
  @HiveField(0)
  bool? success;

  @HiveField(1)
  String? message;

  @HiveField(2)
  String? token;

  @HiveField(3)
  PartnerHive? partner;

  LoginResponseHive({this.success, this.message, this.token, this.partner});
}
