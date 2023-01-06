import 'package:flutter/material.dart';
import 'package:getx/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function()? onPress;
  const CustomButtonSocial(
      {this.text = '', this.imageName = '',  this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey.shade300),
      child: TextButton(
        onPressed: onPress,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            imageName,
            scale: 15,
          ),
          SizedBox(
            width: 60,
          ),
          CustomText(
            text: text,
          )
        ]),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
