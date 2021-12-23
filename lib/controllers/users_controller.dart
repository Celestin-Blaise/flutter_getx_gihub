import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubprofiles/apiServices/get_users.dart';
import 'package:githubprofiles/models/users_model.dart';

class GetUsersController extends GetxController {
  var usersList = <Githubuser>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    var userProfiles = await GetUsersApi.getUsers();
    if (userProfiles != null) {
      usersList.value = userProfiles;
    }
  }
}
