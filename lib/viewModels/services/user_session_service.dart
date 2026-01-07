import 'package:dsa/data/hive/loginResponse/login_response_hive.dart';
import 'package:dsa/data/hive/partener/partner_hive.dart';
import 'package:hive/hive.dart';

class UserSessionService {
  static const String _boxName = 'userBox';

  Box<LoginResponseHive> get _box => Hive.box<LoginResponseHive>(_boxName);

  /// SAVE USER AFTER LOGIN
  Future<void> saveUser(LoginResponseHive user) async {
    await _box.put('user', user);
  }

  /// GET USER
  LoginResponseHive? getUser() {
    return _box.get('user');
  }

  /// GET TOKEN
  String? get token => _box.get('user')?.token;

  /// GET PROFILE
  PartnerHive? get profile => _box.get('user')?.partner;

  /// UPDATE PROFILE
  Future<void> updateProfile(PartnerHive partner) async {
    final user = _box.get('user');
    if (user == null) return;

    user.partner = partner;
    await user.save();
  }

  /// LOGOUT
  Future<void> logout() async {
    await _box.clear();
  }

  /// CHECK LOGIN
  bool get isLoggedIn {
    final token = _box.get('user')?.token;
    return token != null && token.isNotEmpty;
  }
}
