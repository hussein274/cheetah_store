import 'package:e_commerce/features/auth/ui/view/login_view.dart';
import 'package:flutter/material.dart';
import '../../../core/routing/app_routes.dart';
import '../../../generated/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.push(context, AppRoutes.LoginRoute());
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text("    Welcome To Cheetah Store  ",
              style:Theme.of(context).textTheme.bodyLarge),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(Assets.imagesAlfahdLogo,
              height: 250,width: 200,),
          ),
        ],
      ),
    );
  }
}
