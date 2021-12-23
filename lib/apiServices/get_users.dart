import 'dart:convert';
import 'package:githubprofiles/models/users_model.dart';
import 'package:http/http.dart';

class GetUsersApi {
  static Future getUsers() async {
    String githubUrl = 'https://api.github.com/';
    String baseUrl = githubUrl + 'users';

    final response = await get(Uri.parse(baseUrl));
    List jsonResponse = json.decode(response.body);

    return jsonResponse.map((item) => new Githubuser.fromJson(item)).toList();
  }
}
