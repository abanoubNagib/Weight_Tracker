import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/constant/constance.dart';
import 'package:getx/core/view_model/auth_view_model.dart';
import 'package:getx/view/auth/register_view.dart';
import 'package:getx/view/widgets/custom_button.dart';
import 'package:getx/view/widgets/custom_button_social.dart';
import 'package:getx/view/widgets/custom_text.dart';
import 'package:getx/view/widgets/custom_text_form_field.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Welcome,',
                      fontSize: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => RegisterView());
                      },
                      child: CustomText(
                        text: "Sign Up",
                        color: primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomText(
                  text: 'Sign in to Continue',
                  color: Colors.grey,
                  fontSize: 15,
                ),
                SizedBox(height: 40),
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
                CustomText(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: 'SIGN IN ',
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  text: 'Sign In with Google',
                  imageName: 'assets/images/google_logo_icon.png',
                  onPress: () {
                    controller.googleSignInMethod();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
