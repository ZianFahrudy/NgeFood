import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngefood/models/api_return_value.dart';
import 'package:ngefood/models/models.dart';
import 'package:ngefood/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    ApiReturnValue<List<Food>> result = await FoodServices.getFoods();

    if (result.value != null) {
      emit(FoodLoaded(result.value));
    } else {
      emit(FoodLoadingFailed(result.message));
    }
  }
}
