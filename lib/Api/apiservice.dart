import 'dart:convert';

import 'package:contact/model/loginmodel.dart';
import 'package:contact/model/model.dart';
import 'package:http/http.dart' as http;

class ApiServicesss {
  Future<LoginToken> login(LoginReguest loginReq) async {
    var url = Uri.parse('https://reqres.in/api/login');
    var postLogin = await http.post(url, body: loginReq.toJson());
    if (postLogin.statusCode == 200 || postLogin.statusCode == 400) {
      return LoginToken.fromJson(jsonDecode(postLogin.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<DataModel> getUserr(String page) async {
    var url = Uri.parse('https://reqres.in/api/users?page=' + page);
    var hasilGet = await http.get(url);
    if (hasilGet.statusCode == 200) {
      return DataModel.fromJson(jsonDecode(hasilGet.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
