import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/view_model/auth_view_model.dart';
import 'package:getx/view/auth/login_view.dart';
import 'package:getx/view/widgets/custom_button.dart';
import 'package:getx/view/widgets/custom_text.dart';
import 'package:getx/view/widgets/custom_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        leading: GestureDetector(
          onTap: () {
            Get.to(() =>LoginView());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomText(
                  text: 'Sign Up,',
                  fontSize: 25,
                ),
                SizedBox(height: 40),
                CustomTextFormField(
                  text: 'UserName',
                  hint: 'username',
                  onSave: (value) {
                    controller.username = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  text: 'Full Name',
                  hint: 'Full Name',
                  onSave: (value) {
                    controller.fullName = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'exapmle@gmail.com',
                  onSave: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  text: 'Phone',
                  hint: '+20 123456789',
                  onSave: (value) {
                    controller.phone = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  text: 'Password',
                  hint: '*******',
                  onSave: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: 'Sign Up',
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        controller.signUpWithEmailAndPassword();
                      }
                    }), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
