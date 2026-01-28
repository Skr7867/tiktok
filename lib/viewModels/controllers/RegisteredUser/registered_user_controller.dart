import 'package:get/get.dart';

import '../../../models/Registered/reistered_user_model.dart';
import '../../../repository/RegisteredUser/registered_user_repository.dart';
import '../../../utils/utils.dart';
import '../../services/user_session_service.dart';

class RegisteredUserController extends GetxController {
  final RegisteredUserRepository _repository = RegisteredUserRepository();
  final UserSessionService _sessionService = Get.find<UserSessionService>();

  /// UI STATES
  final isLoading = false.obs;
  final registeredUsers = Rxn<RegisterdUserModel>();

  /// 🔍 SEARCH
  final searchText = ''.obs;
  final filteredUsers = <Users>[].obs;

  /// TOKEN
  String get token {
    final token = _sessionService.token;
    if (token == null || token.isEmpty) {
      throw Exception('Session expired. Please login again.');
    }
    return token;
  }

  @override
  void onInit() {
    super.onInit();
    fetchRegisteredUsers();

    /// 🔹 LISTEN SEARCH
    ever(searchText, (_) => filterUsers());
  }

  /// 🔹 FETCH USERS
  Future<void> fetchRegisteredUsers() async {
    try {
      isLoading.value = true;

      final response = await _repository.registeredUser(token);

      if (response.success != true) {
        throw Exception('Failed to load registered users');
      }

      registeredUsers.value = response;
      filteredUsers.assignAll(response.users ?? []);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Utils.snackBar(e.toString().replaceAll('Exception:', '').trim(), 'Error');
    }
  }

  /// 🔹 FILTER LOGIC
  void filterUsers() {
    final query = searchText.value.toLowerCase();

    if (query.isEmpty) {
      filteredUsers.assignAll(usersList);
    } else {
      filteredUsers.assignAll(
        usersList.where((user) {
          final name = user.name?.toLowerCase() ?? '';
          final phone = user.phone?.toString() ?? '';
          return name.contains(query) || phone.contains(query);
        }).toList(),
      );
    }
  }

  /// 🔹 SAFE LIST
  List<Users> get usersList {
    return registeredUsers.value?.users ?? [];
  }
}
