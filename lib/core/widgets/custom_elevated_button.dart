import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
final VoidCallback function;
final String text;

CustomElevatedButton({super.key,required this.function,required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
padding: EdgeInsets.symmetric(vertical: 15)
      ),
        onPressed: function, child: Text(text,style: TextStyle(
      color: Theme.of(context).secondaryHeaderColor,fontSize: 15,fontWeight: FontWeight.bold
    ),));
  }
}