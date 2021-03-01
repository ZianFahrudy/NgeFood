import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngefood/models/api_return_value.dart';
import 'package:ngefood/models/models.dart';
import 'package:ngefood/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransaction();
    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionLoadingFailed(result.message));
    }
  }

  Future<String> submitTransactions(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transaction + [result.value]));
      return result.value.paymentUrl;
    } else {
      return null;
    }
  }
}
