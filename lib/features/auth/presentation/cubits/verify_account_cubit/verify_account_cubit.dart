import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:opi_se/features/auth/domain/use_cases/verify_account_use_case.dart';
import '../../../data/models/verify_account_models/verify_account_response.dart';

part 'verify_account_state.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  VerifyAccountCubit(
    this._verifyAccountUseCase,
  ) : super(VerifyAccountInitial());

  final VerifyAccountUseCase _verifyAccountUseCase;

  Future<void> verifyAccount(String email) async {
    emit(VerifyAccountLoading());
    var result = await _verifyAccountUseCase.call(email);
    result.fold(
      (failure) => emit(VerifyAccountFailure(failure.errMessage)),
      (response) => emit(VerifyAccountSuccess(response)),
    );
  }
}
