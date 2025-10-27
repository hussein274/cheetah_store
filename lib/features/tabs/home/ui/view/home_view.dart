import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/network/model/responce/register_response/register_response.dart';
import 'package:e_commerce/features/tabs/home/domain/entity/models_entity.dart';
import 'package:e_commerce/features/tabs/home/ui/view_model/products_cubit/products_cubit.dart';
import 'package:e_commerce/features/tabs/home/ui/view_model/products_cubit/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../../../core/api_result/api_result.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/shared_pref_helper/shared_pref_helper.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/assets.dart';
import '../view_model/category_cubit/category_cubit.dart';
import '../view_model/category_cubit/category_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserModel? user;
 late final CategoryCubit _categoryCubit = getIt();
 late final ProductsCubit _productsCubit = getIt();
  void loadUser() async {
    SharedPrefHelper sharedPrefHelper = SharedPrefHelper();
    UserModel? saveUser = await sharedPrefHelper.getUser();
    if (saveUser != null) {
      setState(() {
        user = saveUser;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUser();
    _categoryCubit.getCategories();
    _productsCubit.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomAppBar()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: customWelcomeMessage()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: customAdvertisement()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: Text(
                " Categories",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            BlocBuilder<CategoryCubit, CategoryState>(
              bloc: _categoryCubit,
              builder: (context, state) {
                final categories = state.categories;
                if (categories is ApiLoading) {
                  return SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 10,
                            width: 60,
                            color: Colors.white,
                          ),
                        ],
                      )
                  );
                }
                if (categories is ApiError) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text("Something went wrong")),
                  );
                }
                if (categories is ApiSuccess<List<CategoryEntity>>) {
                  return SliverToBoxAdapter(
                    child: buildCategoryList(categories.data),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(
              child: Text(
                " Products",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            BlocBuilder<ProductsCubit, ProductsState>(
              bloc: _productsCubit,
              builder: (context, state) {
                final products = state.products;
                if (products is ApiLoading) {
                  return SliverToBoxAdapter();
                }
                if (products is ApiSuccess<List<ProductEntity>>) {
                  return SliverToBoxAdapter(
                    child: buildProductList(products.data),
                  );
                }
                if (products is ApiError) {
                  return SliverToBoxAdapter(
                    child: Text("Something went wrong"),
                  );
                }
                return SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }

  customWelcomeMessage() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Welcome , ${user?.name??"guest"} 👋"
        "\n"
        "What are you looking for today ?",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  customAdvertisement() {
    return CarouselSlider(
      items: [
        Image.asset(Assets.imagesAdvertisement2),
        Image.asset(Assets.imagesAdvertisement3),
        Image.asset(Assets.imagesAdvertisement1),
      ],
      options: CarouselOptions(
        height: 200.h,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  buildCategoryList(List<CategoryEntity> data) {
    return SizedBox(
      height: 230.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Shimmer(
                duration: const Duration(seconds: 2),
                interval: const Duration(seconds: 1),
                color: Colors.grey.shade300,
                colorOpacity: 0.4,
                enabled: true,
                direction: const ShimmerDirection.fromLTRB(),
                child: SizedBox(
                  height: 90.h,
                  width: 90.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50,
                    backgroundImage: NetworkImage(data[index].image!),
                  ),
                ),
              ),
              Text(
                data[index].name,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget? buildProductList(List<ProductEntity> data) {
    return SizedBox(
      height: 240.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Shimmer(
            duration: const Duration(seconds: 2),
            interval: const Duration(seconds: 1),
            color: Colors.grey.shade300,
            colorOpacity: 0.4,
            enabled: true,
            direction: const ShimmerDirection.fromLTRB(),
            child: Container(
              height: 220.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.black),
                color: AppColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            data[index].imageCover!,
                            height: 122.h,
                            width: 158.w,
                            fit: BoxFit.cover,
                          ),
                        ),

                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: 155,
                      child: Text(
                        data[index].title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          " Review(${data[index].ratingsAverage})",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Text(
                          " EGP ${data[index].price}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 65.w),
                        Image.asset(Assets.iconsAddToCart),
                      ],
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: data.length,
      ),
    );
  }
}
