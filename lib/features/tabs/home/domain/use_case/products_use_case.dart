import 'package:e_commerce/features/tabs/home/domain/entity/models_entity.dart';
import 'package:e_commerce/features/tabs/home/domain/home_repo.dart' show HomeRepo;
import 'package:injectable/injectable.dart';
import '../../../../../core/api_result/api_result.dart';

@injectable
class ProductsUseCase {
  final HomeRepo homeRepo;

  ProductsUseCase(this.homeRepo);

  Future<ApiResult<List<ProductEntity>>> call() async {
    return await homeRepo.loadProducts();
  }
}