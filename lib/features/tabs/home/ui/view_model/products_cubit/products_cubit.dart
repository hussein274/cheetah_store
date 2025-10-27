import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/features/tabs/home/domain/use_case/products_use_case.dart';
import 'package:e_commerce/features/tabs/home/ui/view_model/products_cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final ProductsUseCase productsUseCase;

  ProductsCubit(this.productsUseCase) : super(ProductsState.initial());

  Future<void> getAllProducts() async {
    emit(ProductsState(products: ApiLoading()));

    try {
      final answer = await productsUseCase.call();
      emit(ProductsState(products: answer));
    } catch (e) {
      emit(ProductsState(products: ApiError(AppError(e.toString())))); // حالة الخطأ
    }
  }
}
