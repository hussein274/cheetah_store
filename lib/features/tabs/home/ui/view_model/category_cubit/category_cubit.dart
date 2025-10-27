import 'package:e_commerce/features/tabs/home/ui/view_model/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api_result/api_result.dart';
import '../../../domain/use_case/category_use_case.dart';


@Injectable()
class CategoryCubit extends Cubit<CategoryState> {
  CategoryUseCase _categoryUseCase;
  CategoryCubit(this._categoryUseCase) : super(CategoryState.initial());

  Future<void> getCategories()async{
    emit(CategoryState(categories: ApiLoading()));
    var response = await _categoryUseCase.call() ;
    emit(CategoryState(categories: response));
  }
}