import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/features/tabs/home/domain/entity/models_entity.dart';
import 'package:injectable/injectable.dart';

import '../home_repo.dart';

@injectable
class CategoryUseCase{

  final HomeRepo _homeRepo;
  CategoryUseCase(this._homeRepo);
  Future<ApiResult<List<CategoryEntity>>> call() async{
    return await _homeRepo.loadCategories();
  }

}