import 'package:attendance_keeper/app/data/models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:attendance_keeper/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final List<User> userList = controller.getUserList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('${DateTime.now().month}/${DateTime.now().year} '),
            Expanded(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = userList[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.joiningDate.year.toString()),
                    trailing: Obx(
                      () => IconButton(
                        icon: Icon(
                          user.isPresent.value
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: user.isPresent.value
                              ? Colors.greenAccent
                              : Colors.redAccent,
                        ),
                        onPressed: () {
                          user.isPresent.value = !user.isPresent.value;
                        },
                      ),
                    ),
                    leading: Text(user.package.index == 0 ? 'Basic' : 'O'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
