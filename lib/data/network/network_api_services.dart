import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../appexception/app_exception.dart';
import 'base_api_services.dart';
import 'dio_client.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url, {String? token}) async {
    if (kDebugMode) log("GET Token: $token");
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          if (token != null) "Authorization": "Bearer $token",
        },
      ).timeout(const Duration(seconds: 60));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Please turn on internet');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on ServerException {
      throw ServerException();
    } on InvalidUrl {
      throw InvalidUrl();
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(
    dynamic data,
    String url, {
    String? token,
    bool isFileUpload = false,
  }) async {
    if (kDebugMode) {
      log("POST URL: $url");
      if (data != null) log("POST DATA: $data");
      if (token != null) log("POST TOKEN: $token");
      if (isFileUpload) log("IS FILE UPLOAD: $isFileUpload");
    }

    try {
      Response response;

      /// 🔹 MULTIPART (FILE UPLOAD)
      if (isFileUpload) {
        if (data is! Map<String, dynamic>) {
          throw FetchDataException('Invalid multipart payload');
        }

        String? filePath;
        final Map<String, dynamic> fields = {};

        for (final entry in data.entries) {
          if (entry.key == 'businessDocumentFilePath') {
            filePath = entry.value?.toString();
          } else {
            fields[entry.key] = entry.value.toString();
          }
        }

        MultipartFile? multipartFile;

        if (filePath != null) {
          final file = File(filePath);

          if (!await file.exists()) {
            throw FetchDataException('File not found at path: $filePath');
          }

          String mimeType = 'application/octet-stream';

          if (filePath.endsWith('.pdf')) {
            mimeType = 'application/pdf';
          } else if (filePath.endsWith('.jpg') || filePath.endsWith('.jpeg')) {
            mimeType = 'image/jpeg';
          } else if (filePath.endsWith('.png')) {
            mimeType = 'image/png';
          }

          multipartFile = await MultipartFile.fromFile(
            filePath,
            filename: file.path.split('/').last,
            contentType: DioMediaType.parse(mimeType),
          );

          if (kDebugMode) {
            log('File added: ${file.path}');
            log('File size: ${await file.length()} bytes');
            log('Content-Type: $mimeType');
          }
        }

        final formData = FormData.fromMap({
          ...fields,
          if (multipartFile != null)
            'businessDocumentUrl': multipartFile, // 🔴 SAME KEY
        });

        response = await DioClient.dio.post(
          url,
          data: formData,
          options: Options(
            headers: {
              if (token != null) 'Authorization': 'Bearer $token',
            },
            contentType: 'multipart/form-data',
          ),
        );
      }

      /// 🔹 NORMAL JSON POST
      else {
        response = await DioClient.dio.post(
          url,
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              if (token != null) 'Authorization': 'Bearer $token',
            },
          ),
        );
      }

      if (kDebugMode) {
        log('Response Code: ${response.statusCode}');
        log('Response Body: ${response.data}');
      }

      return response.data;
    }

    /// 🔴 ERROR HANDLING (MATCHES YOUR CURRENT BEHAVIOR)
    on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final resData = e.response?.data;

      if (statusCode == null) {
        throw InternetException('Please turn on internet');
      }

      switch (statusCode) {
        case 400:
        case 401:
        case 403:
        case 404:
          throw FetchDataException(
            resData != null && resData['message'] != null
                ? resData['message']
                : 'Error: $statusCode',
          );
        case 500:
        case 502:
        case 503:
          throw ServerException(
            resData != null && resData['message'] != null
                ? resData['message']
                : 'Server error occurred',
          );
        default:
          throw FetchDataException(
            'Unexpected error occurred: $statusCode',
          );
      }
    } on TimeoutException {
      throw RequestTimeOut('');
    } catch (e) {
      throw FetchDataException('Unexpected error: $e');
    }
  }

  @override
  Future<dynamic> patchApi(
    Map<String, dynamic> data,
    String url, {
    String? token,
  }) async {
    if (kDebugMode) {
      log("PATCH URL: $url");
      log("PATCH DATA: $data");
      if (token != null) log("PATCH TOKEN: $token");
    }

    dynamic responseJson;
    try {
      final response = await http
          .patch(
            Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              if (token != null) "Authorization": "Bearer $token",
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Please check your internet connection');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on ServerException {
      throw ServerException();
    } on InvalidUrl {
      throw InvalidUrl();
    }

    if (kDebugMode) log("PATCH RESPONSE: $responseJson");
    return responseJson;
  }

  @override
  Future<dynamic> deleteApi(String url, {String? token}) async {
    if (kDebugMode) {
      log("DELETE URL: $url");
      if (token != null) log("DELETE TOKEN: $token");
    }

    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          if (token != null) "Authorization": "Bearer $token",
        },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Please turn on internet');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on ServerException {
      throw ServerException();
    } on InvalidUrl {
      throw InvalidUrl();
    }

    if (kDebugMode) log("DELETE RESPONSE: $responseJson");
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      log('Response Code: ${response.statusCode}');
      log('Response Body: ${response.body}');
    }

    dynamic responseJson;

    if (response.body.isNotEmpty) {
      try {
        responseJson = jsonDecode(response.body);
      } catch (e) {
        // If JSON parsing fails, throw error with response body
        throw FetchDataException(
          'Failed to parse response. Status: ${response.statusCode}, Body: ${response.body}',
        );
      }
    } else {
      responseJson = true;
    }

    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
      case 206:
      case 304:
        return responseJson;
      case 400:
      case 403:
      case 404:
        throw FetchDataException(
          responseJson != true && responseJson['message'] != null
              ? responseJson['message']
              : 'Error: ${response.statusCode}',
        );
      case 401:
        throw FetchDataException(
          responseJson != true && responseJson['message'] != null
              ? responseJson['message']
              : 'Unauthorized access',
        );
      case 409:
        return responseJson;
      case 500:
      case 502:
      case 503:
        throw ServerException(
          responseJson != true && responseJson['message'] != null
              ? responseJson['message']
              : 'Server error occurred',
        );
      default:
        throw FetchDataException(
          'Unexpected error occurred: ${response.statusCode}',
        );
    }
  }
}
