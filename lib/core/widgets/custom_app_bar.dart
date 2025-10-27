import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import '../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
          Image.asset(Assets.imagesAlfahdLogo,
            height: 70.h,
            width: 70.w,
          ),
          customSearch(context),
          SizedBox(width: 10.w,),
          CustomShopingCart(context),
        ],);

  }
  customSearch(BuildContext context) {
    return Expanded(
      child: TextField(
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,size: 24,),
          prefixIconColor: Theme.of(context).primaryColor,
          hintText: "what do you search for?",filled: true,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          fillColor:Theme.of(context).scaffoldBackgroundColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(100),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor,),
            borderRadius: BorderRadius.circular(100),
          ),
          border:
          OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black,),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }

  CustomShopingCart(BuildContext context) {
    return Icon(Icons.shopping_cart, color: Theme
        .of(context)
        .primaryColor, size: 40,);
  }

  }
