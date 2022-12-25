import 'dart:io';
import 'dart:convert';
import 'package:demo_app/Provider/customException.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<dynamic> get() async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(
          'https://7b799511-b5f4-43fb-ae5d-1f65f67dd8d1.mock.pstmn.io/api/v1/home/feed'));
      responseJson = _response(response);

      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return responseJson;
      case 400:
        // throw BadRequestException(response.body.toString());
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return responseJson;
      case 401:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        return responseJson;

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      case 700:
        Fluttertoast.showToast(
          msg: "Wrong Version ",
          // timeInSecForIos: 4
        );

        throw WrongVersionException(response.body.toString());

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
