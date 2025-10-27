import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import '../features/tabs/ Fav/ui/fav_view.dart';
import '../features/tabs/Categories/ui/categories_view.dart';
import '../features/tabs/Profile/ui/profile_view.dart';
import '../features/tabs/home/ui/view/home_view.dart';

class HomeTabs extends StatefulWidget {
  HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int currentIndex = 0;

  List<Widget> pages = [HomeView(), CategoriesView(), FavView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: pages[currentIndex],

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: BottomNavigationBar(
              backgroundColor: AppColors.black,
              fixedColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },

              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                     currentIndex == 0 ? Assets.iconsSelectHome: Assets.iconsHome,
                    height: 40,
                    width: 40,
                  ),
                  label: "home",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    currentIndex == 1
                        ? Assets.iconsCategoryCategory
                        : Assets.iconsCategories,
                    height: 40,
                    width: 40,
                  ),
                  label: "items",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    currentIndex == 2 ? Assets.iconsSelectFav: Assets.iconsFav,
                    height: 40,
                    width: 40,
                  ),
                  label: "fav",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    currentIndex == 3 ? Assets.iconsSelectProfile: Assets.iconsProfilepng, height: 40, width: 40),
                  label: "profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
