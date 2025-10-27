import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String ?label;
  final String ? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const CustomTextFormField({super.key,
 this.label,
 this.hintText,
  this.validator,
  this.controller,
  this.keyboardType,
  this.obscureText=false,
   this.prefixIcon,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      child: TextFormField(

        obscureText: obscureText!,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: Theme.of(context).primaryColor,

        decoration: InputDecoration(
          filled: true,
          fillColor:Theme.of(context).scaffoldBackgroundColor ,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),

          border: OutlineInputBorder
            (borderRadius:
          BorderRadius.circular(16),),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: label,
          hintStyle: Theme.of(context).textTheme.bodySmall,



        ),

      ),
    );
  }
}
