// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/view_model/profile_view_model.dart';
import 'package:getx/view/auth/login_view.dart';
import 'package:getx/view/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value == true
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 40, left: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      image: DecorationImage(
                                          image: controller.userModel == null
                                              ? AssetImage(
                                                  "assets/images/Profile-Photo.png")
                                              : controller.userModel!.pic! ==
                                                      "defult"
                                                  ? AssetImage(
                                                      "assets/images/Profile-Photo.png")
                                                  : AssetImage(
                                                      "assets/images/Profile-Photo.png"),
                                          fit: BoxFit.contain),
                                    )),
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: controller.userModel!.name!,
                              color: Colors.black,
                              fontSize: 30,
                              alignment: Alignment.center,
                            ),
                            CustomText(
                              text: controller.userModel!.email!,
                              color: Colors.black,
                              fontSize: 26,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: TextButton(
                              onPressed: () {},
                              child: ListTile(
                                title: CustomText(text: 'Edit Profile'),
                                leading: Image.asset(
                                    'assets/menu_icons/Icon_Edit-Profile.png'),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextButton(
                              onPressed: () {
                                controller.signOut();
                                Get.offAll(LoginView());
                              },
                              child: ListTile(
                                title: CustomText(text: 'Log Out'),
                                leading: Image.asset(
                                    'assets/menu_icons/Icon_Exit.png'),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              )),
                        ),
                      ]),
                ),
              ),
            ),
    );
  }
}
