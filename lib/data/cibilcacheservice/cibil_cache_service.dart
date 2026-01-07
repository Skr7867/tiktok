import 'dart:convert';
import 'package:hive/hive.dart';

import '../../models/CibilScore/cibil_score_model.dart';

class CibilCacheService {
  static const String _boxName = 'cibilBox';
  static const String _cibilKey = 'cibil_score';
  static const String _timestampKey = 'cibil_timestamp';

  /// 🔹 SAVE CIBIL SCORE
  Future<void> saveCibilScore(CibilScoreModel model) async {
    final box = await Hive.openBox(_boxName);

    final jsonString = jsonEncode(model.toJson());

    await box.put(_cibilKey, jsonString);
    await box.put(
      _timestampKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// 🔹 GET CIBIL SCORE
  Future<CibilScoreModel?> getCibilScore() async {
    final box = await Hive.openBox(_boxName);

    final jsonString = box.get(_cibilKey);
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    return CibilScoreModel.fromJson(jsonMap);
  }

  /// 🔹 CHECK IF CACHE EXPIRED (24 HOURS)
  bool isCacheExpired(int timestamp) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return (now - timestamp) > const Duration(hours: 24).inMilliseconds;
  }

  /// 🔹 GET VALID CIBIL (CACHE FIRST)
  Future<CibilScoreModel?> getValidCibilScore() async {
    final box = await Hive.openBox(_boxName);

    final jsonString = box.get(_cibilKey);
    final timestamp = box.get(_timestampKey);

    if (jsonString == null || timestamp == null) return null;

    if (isCacheExpired(timestamp)) {
      await clearCibilScore();
      return null;
    }

    return CibilScoreModel.fromJson(
      jsonDecode(jsonString),
    );
  }

  /// 🔹 CLEAR CACHE
  Future<void> clearCibilScore() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_cibilKey);
    await box.delete(_timestampKey);
  }
}
