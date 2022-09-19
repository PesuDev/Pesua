import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/login/model/login_redircted_model.dart';
import 'package:pesu/utils/constants/app_urls.dart';
import 'package:pesu/utils/services/sharedpreference_utils.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class PesuApiService {
  String _baseURL = AppUrls.baseUrl;
  late Dio _dio = Dio();
  /* PesuApiService(){
   this._dio.interceptors.add(InterceptorsWrapper(
     onRequest: (options, handler) {
     log('xyz :: ${options.uri}');

     },
   ));
  }*/

  SharedPreferenceUtil sharedPref = SharedPreferenceUtil();

  Future<Map<String, String>> getHeaders() async {
    Map<String, String> header = new Map();
    return header;
  }

  Future<dynamic> getApiCall(
      {required String endPoint, required Map<String, dynamic> params}) async {
    var responseJson;
    FormData formData = FormData.fromMap(params);
    try {
      final response = await http.get(
        Uri.https(_baseURL, endPoint),
        headers: await getHeaders(),
      );
      responseJson = _response(response);
    } on SocketException {
      log('Socket Exception');
    } catch (e) {
      log(e.toString());
    }
    return responseJson;
  }


  Future<dynamic> postApiCallForLogin(
      {required String endPoint,
       bodyParams,

      }) async {
    var url="MAcademy/j_spring_security_check?j_mobile=MOBILE&mode=0&j_mobileApp=YES&whichObjectId=loginSubmitButton&j_social=NO&j_password=pes123&action=0&j_appId=1&j_username=pes1ug20cs216&randomNum=0.6181071537315856";
    try {
      final response = await http.post(    Uri.https(_baseURL,endPoint),body: { "j_mobile":"MOBILE", "mode":"0", "j_mobileApp":"YES", "whichObjectId":"loginSubmitButton", "j_social":"NO", "j_password":"pes123", "action":"0", "j_appId":"1", "j_username":"pes1ug20cs216", "randomNum":"0.6181071537315856" },

      );

      log('Status Code :: ${response.statusCode}');
      log('url    :: $_baseURL$endPoint');
      if (response.statusCode == 302 ) {
        log('Response :: ${response.body.toString()}');
         //response.headers['location'];
        return response.body;
      }
    } on SocketException {
      log('Socket Exception');
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  Future<dynamic> postApiCall(
      {required String endPoint, required Map<String, dynamic> params}) async {
    var responseJson;
    FormData formData = FormData.fromMap(params);

    try {
      log('${Uri.https(
        _baseURL,
        endPoint,
      ).toString()}');
      log(params.toString());
      final response = await _dio.post(Uri.https(_baseURL, endPoint).toString(),
          options: Options(
              headers: {
            "mobileAppAuthenticationToken":
                "D3iJWqENvrEQHQ6qxyUx9MgptxdTWxA3s2eDSHee4wMJqZs0NbTKaaF07hqWoE7lVtnymYMYcvCadpRgK4T7ORt11zQwZkkB"
          }
          ),
          data: formData);
      log('Status Code :: ${response.statusCode}    url=  ${_baseURL}${endPoint}');
      if (response.statusCode == 200 && response.data.toString().isNotEmpty) {
        log('Response :: ${response.data.toString()}');
        return response.data;
      }
    } on SocketException {
      log('Socket Exception');
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  Future<dynamic> postApiCallWithQueryParamsLogin(
      {required String url,
        required Map<String, dynamic> queryParams}) async {
    try {

      log(queryParams.toString());
      // final response = await _dio.post(
      //   Uri.https(_baseURL, endPoint).toString(),
      //   queryParameters: queryParams,
      // );
log("base url $_baseURL");
final urlString= Uri.parse(url);
      final response1 = await http.post(urlString);
      // http.post(    Uri.https(_baseURL,
      //  "/MAcademy/a/0;jsessionid=b1hIUGnGnRtGX2kER3QfSOV2yE8WMTsKcsTOk1w_.prod01"),
      //   body: { "j_mobile":"MOBILE", "mode":"0", "j_mobileApp":"YES", "whichObjectId":"loginSubmitButton", "j_social":"NO", "j_password":"pes123", "action":"0", "j_appId":"1", "j_username":"pes1ug20cs216", "randomNum":"0.6181071537315856" },
      //
      // );
      // var response = await Dio().post( Uri.https("$_baseURL","MAcademy/failLogin;jsessionid=SIPSyWrVz2_gA4VMtL_r9Hn6DZNWPP9QMFSRE9q7.prod01",).toString(),
      //   data: queryParams,
      //   options: Options(
      //       followRedirects: true,
      //       validateStatus: (status) { return status! < 500;
      //       }
      //   ),
      // );
      log('Status Code :: ???????${response1.statusCode}');
  //    List<ReDirectModel> responseModel=response.headers as List<ReDirectModel>;
      log('Status Code :: ???????${response1.headers}');
  //    log('Status Code :: ???????$responseModel');
      if (response1.statusCode == 301) {
        log("Wait");
   final urlString2=Uri.parse("${response1.headers["location"]}");
        final response3 = await http.post(  urlString2
        );
        log("${response3.statusCode}");
        log("${response3.headers}");
        if(response3.statusCode==302){

          final urlString4=Uri.parse("${response3.headers["location"]}");
          final response4 = await http.post(  urlString4
          );
          log("....${response4.statusCode}");
          log("${response4.headers}");
          if(response4.statusCode==301){


            final urlString5=Uri.parse("${response4.headers["location"]}");
            final response5 = await http.post(  urlString5
            );
            log("....${response5.statusCode}");
            log("${response5.headers}");
            log(">>>>${response5.body}");
            log(">>>>${response5.toString()}");
          }

        }
     //   return response.headers;
      }
    } on SocketException {
      log('Socket Exception');
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  Future<dynamic> postApiCallWithQueryParams(
      {required String endPoint,
      required Map<String, dynamic> queryParams}) async {
    try {
      log('${Uri.https(
        _baseURL,
        endPoint,
      ).toString()}');
      log(queryParams.toString());
      // final response = await _dio.post(
      //   Uri.https(_baseURL, endPoint).toString(),
      //   queryParameters: queryParams,
      // );

      var response = await Dio().post( Uri.https(_baseURL, endPoint).toString(),
        data: queryParams,
        options: Options(
            followRedirects: true,
            validateStatus: (status) { return status! < 500; }
        ),
      );
      log('Status Code :: ${response.statusCode}');
      log('Status Code :: ${response.headers}');
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } on SocketException {
      log('Socket Exception');
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  Future<dynamic> putApiCall(
      {required String endPoint, required Map<String, dynamic> params}) async {
    var responseJson;
    FormData formData = FormData.fromMap(params);
    try {
      final response = await http.put(
        Uri.https(_baseURL, endPoint),
        headers: await getHeaders(),
        body: formData,
      );
      responseJson = _response(response);
    } on SocketException {
      log('Socket Exception');
    } catch (e) {
      log(e.toString());
    }
    return responseJson;
  }

  Future<dynamic> deleteApiCall(
      {required String endPoint, required Map<String, dynamic> params}) async {
    var responseJson;
    FormData formData = FormData.fromMap(params);
    try {
      final response = await http.delete(
        Uri.https(_baseURL, endPoint),
        headers: await getHeaders(),
        body: formData,
      );
      responseJson = _response(response);
    } on SocketException {
      log('Socket Exception');
    } catch (e) {
      log(e.toString());
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print("StatusCode::: ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        var responseJson;

        String decryptedData = response.body;
        if (decryptedData != null) {
          responseJson = json.decode(decryptedData);
          log('responseJson:$responseJson');
          return responseJson;
        } else {
          throw Exception(
              'Error occurred while decrypting data : ${response.statusCode}');
        }

      case 400:
        Map<String, dynamic> res = jsonDecode(response.body);
        print('ERORRRRRRRRRRRRRRRRRRRRRRRR 400 ${res['message']}');
        if (res['message'] != null) {
          getToast(message: res['message'], color: Color(0xffF40909));
          return null;
          //   throw BadRequestException(decryptException(response.body));
        }
        return null;

      // throw BadRequestException("Please Try Again");
      case 401:
        Map<String, dynamic> res = jsonDecode(response.body);

        if (res['message'] != null) {
          getToast(message: res['message'], color: Color(0xffF40909));
          //  throw BadRequestException(decryptException(response.body));
        }

        return null;

      //  throw BadRequestException("Please Try Again");

      //  throw UnauthorisedException(response.body.toString());
      case 403:
        Map<String, dynamic> res = jsonDecode(response.body);
        if (res['message'] != null) {
          print('ERORRRRRRRRRRRRRRRRRRRRRRRR 403 ${res['message']}');
          getToast(message: res['message'], color: Color(0xffF40909));
        }
        return null;
      case 404:
        Map<String, dynamic> res = jsonDecode(response.body);
        if (res['message'] != null) {
          print('ERORRRRRRRRRRRRRRRRRRRRRRRR 404 ${res['message']}');
          getToast(message: res['message'], color: Color(0xffF40909));
        }
        return null;
      case 406:
        Map<String, dynamic> res = jsonDecode(response.body);
        if (res['message'] != null) {
          print('ERORRRRRRRRRRRRRRRRRRRRRRRR 406 ${res['message']}');
          getToast(message: res['message'], color: Color(0xffF40909));
        }
        return null;

      // throw UnauthorisedException(decryptException(response.body));
      case 500:
        Map<String, dynamic> res = jsonDecode(response.body);
        if (res['message'] != null) {
          print('ERORRRRRRRRRRRRRRRRRRRRRRRR 500 ${res['message']}');
          getToast(message: res['message'], color: Color(0xffF40909));
          // throw BadRequestException(decryptException(response.body));
        }
        return null;

      // throw BadRequestException("Please Try Again");
      default:
        Map<String, dynamic> res = jsonDecode(response.body);
        if (res['message'] != null) {
          print('ERORRRRRRRRRRRRRRRRRRRRRRRR default ${res['message']}');
          getToast(message: res['message'], color: Color(0xffF40909));
        }
    }
  }

  dynamic responseException(http.Response response) {
    return _response(response);
  }

  void getToast({String? message, Color? color}) {}
}
