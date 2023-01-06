import 'package:flutter/material.dart';
import 'package:getx/view/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? hint;
  final Function(String?)? onSave;
  final String? Function(dynamic) validator;

  const CustomTextFormField(
      { this.text ,
       this.hint ,
       this.onSave,
       required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text!,
            fontSize: 13,
            color: Colors.black87,
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey.shade500)),
          )
        ],
      ),
    );
  }
}
