import 'package:flutter/material.dart';
import 'package:getx/constant/constance.dart';
import 'package:getx/view/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
 final Color color;
 final Color textColor;
  const CustomButton({this.text = '', this.onPressed , this.color = primaryColor , this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: textColor,
        ));
  }
}
