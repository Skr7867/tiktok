import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class DioClient {
  static late Dio dio;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    final cookieJar = PersistCookieJar(
      storage: FileStorage('${dir.path}/cookies'),
    );

    dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
        },
        extra: {
          'withCredentials': true,
        },
      ),
    );

    dio.interceptors.add(CookieManager(cookieJar));
  }
}
