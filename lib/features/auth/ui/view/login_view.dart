import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/features/auth/ui/view/register_view.dart';
import 'package:e_commerce/features/auth/ui/view_model/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/ui/view_model/login_cubit/login_state.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/assets.dart';
import '../../../../home_tabs/home_tabs.dart';


class LoginView extends StatelessWidget {
   LoginView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginCubit _loginCubit=getIt();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: _loginCubit,

      listener: (BuildContext context, state) {
        if(state.apiResult is ApiSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.white,
              content: Text("success",style:
              TextStyle(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            )
          );
         Navigator.push(context, AppRoutes.HomeRoute());


        }
        if(state.apiResult is ApiError){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 5),
                backgroundColor: Colors.red,
                content: Text("please try again",style:
                TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              )
          );

        }
        if(state.apiResult is ApiLoading){

          Center(child: CircularProgressIndicator(color: AppColors.black,));

        }

      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

              Image.asset(Assets.imagesAlfahdLogo,
              height: 150.h,
              width: 150.w,
              ),
              SizedBox(height: 30.h,),
              Text("Welcome Back To Cheetah Store",style: Theme.of(context).textTheme.bodyLarge,),
              Text("Please sign in with your email",style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: 50.h,),

                Text("Email",
                style: Theme.of(context).textTheme.bodyMedium,),
             SizedBox(height: 20,),
              CustomTextFormField(
                controller: emailController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your email";
                  }
                  return null;
                },
                hintText: 'enter your email',
              ),
                SizedBox(height: 20,),

                Text("Password",style: Theme.of(context).textTheme.bodyMedium,)
                ,
                SizedBox(height: 20,),
                CustomTextFormField(
                  controller: passwordController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please Enter your Password";
                    }
                    return null;
                  },
                  hintText: 'enter your password',
                ),



               Align(
                 alignment: AlignmentGeometry.topRight,
                 child: TextButton(onPressed: (){},
                     child: Text("Forgot Password?",style: Theme.of(context).textTheme.bodyMedium,)),
               ),
               SizedBox(height: 120.h,),
                CustomElevatedButton(
                  text: 'Login',
                  function: (){
                    if(formKey.currentState!.validate()){
                      _loginCubit.login(emailController.text ,
                          passwordController.text );

                    }

                  },
                ),


                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterView(),));
                  },
                      child: Row(
                        children: [
                          Text(" Don't have an account? ",
                            style: Theme.of(context).textTheme.bodySmall),
                          Text(" create account",style: Theme.of(context).textTheme.bodyMedium,)
                        ],
                      ),)),


            ],),
          ),
        ) ,

      ),
    );
  }
}
