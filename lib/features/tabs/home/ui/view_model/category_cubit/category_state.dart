import 'package:e_commerce/features/tabs/home/domain/entity/models_entity.dart';

import '../../../../../../core/api_result/api_result.dart';



class CategoryState{
  late final ApiResult<List<CategoryEntity>> categories;
  CategoryState({required this.categories});
  CategoryState.initial(){
    categories=ApiInitial();
  }

}