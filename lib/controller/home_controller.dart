import 'package:exam_final/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/database_helper.dart';

class HomeController extends GetxController {
  var user = <Users>[].obs;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    user.value = await DatabaseHelper.instance.getTodos();
  }

  Future<void> addUser(String username, email, password) async {
    Users todo =
    Users(username: username, email: email, password: password);
    await DatabaseHelper.instance.insertTodo(todo);
    await fetchData();
  }

  Future<void> updateUser(Users user) async {
    await DatabaseHelper.instance.updates(user);
    await fetchData();

  }

  Future<void> deleteUser(int id) async {
    await DatabaseHelper.instance.delete(id);
    await fetchData();
  }
}