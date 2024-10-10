
import 'package:exam_final/model/user_model.dart';
import 'package:exam_final/view/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../model/firebase_model.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _showAddTodoDialog(context, controller);
      //   },
      //   child: Icon(Icons.add),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff005667),
        onPressed: () {
          _showAddDialog(context, controller);
          Get.to(SignupScreen());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'Home Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.user.length,
                itemBuilder: (context, index) {
                  final user = controller.user[index];
                  return ListTile(
                    title: Text(user.username ?? ''),
                    subtitle: Text(user.email ?? ''),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _showEditDialog(context, user);
                          },
                          icon: Icon(Icons.edit, color: Colors.grey),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.deleteUser(user.id!);
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                    onTap: () {
                      controller.updateUser(user);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddDialog(BuildContext context, HomeController controller) {
    // final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a Todo'),
          content: TextField(
            controller: controller.username,
            decoration: InputDecoration(hintText: 'Enter todo name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.username.text.isNotEmpty) {
                  controller.addUser(controller.username.text,
                      controller.password, controller.email);
                  controller.username.clear();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Users user) {
    final TextEditingController editController = TextEditingController(
      text: user.username,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Todo'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(hintText: 'Enter new todo name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (editController.text.isNotEmpty) {
                  user.username = editController.text;
                  Get.find<HomeController>().updateUser(user);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}