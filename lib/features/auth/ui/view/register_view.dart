import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/assets.dart';
import '../../../../home_tabs/home_tabs.dart';
import '../view_model/register_cubit/register_cubit.dart';
import '../view_model/register_cubit/register_state.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  RegisterCubit registerCubit=getIt();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      bloc:registerCubit ,
      listener: (context, state) {
        if(state.apiResult is ApiSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.white,
              content: Text("success",style:
              TextStyle(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            ),
          );
          Navigator.push(context, AppRoutes.HomeRoute(),);
        }
        if(state.apiResult is ApiError){
          final error = (state.apiResult as ApiError).error.message;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(error.toString(),style:
              TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            )
          );
        }
        if(state.apiResult is ApiLoading){
          Center(child: CircularProgressIndicator(color: AppColors.black,));

        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
        
                    Image.asset(Assets.imagesAlfahdLogo,
                      height: 150.h,
                      width: 150.w,
                    ),
                    SizedBox(height: 10.h),
        
                    Center(child: Text("Create a New Account",style: Theme.of(context).textTheme.bodyLarge)),
                    SizedBox(height: 10.h),
        
                    Text("Full Name", style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      hintText: 'Enter your full name',
                    ),
                    SizedBox(height: 20.h),
                    Text("E-mail address", style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your E-mail address";
                        }
                        return null;
                      },
                      hintText: 'Enter your E-mail address',
                    ),
                    SizedBox(height: 20.h),
                    Text("Password", style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Password";
                        }
                        return null;
                      },
                      hintText: 'Enter your Password',
                    ),
                    SizedBox(height: 20.h),
                    Text("Confirm Password", style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your RePassword";
                        }
                        return null;
                      },
                      hintText: 'Enter your RePassword',
                    ),
                    SizedBox(height: 20.h),
                    Text("Mobile Number", style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: phoneNumberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Phone";
                        }
                        return null;
                      },
                      hintText: 'Enter your mobile number',
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: AlignmentGeometry.bottomCenter,
                      child: InkWell(
                        onTap: () {
                         Navigator.pop(context);
                        },
                          child: Text("Already Have Account ?   Login",
                              style: Theme.of(context).textTheme.bodyMedium)),
                    ),
                    SizedBox(height: 30.h),
        
                    CustomElevatedButton(
                      function: () {
                        if (_formKey.currentState!.validate()) {
                          registerCubit.
                          register(confirmPasswordController.text,
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              phoneNumberController.text);
        
                        }
                      },
                      text: 'Sign Up',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
