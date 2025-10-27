import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';


class FavView extends StatelessWidget {
  const FavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}
