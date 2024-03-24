import 'package:dex_course/core/data/remote_response.dart';
import 'package:dex_course/core/domain/app_error/app_error.dart';
import 'package:dex_course/core/domain/use_case_result/use_case_result.dart';
import 'package:dex_course/features/auth/data/model/auth_credentials.dart';
import 'package:dex_course/features/auth/data/source/auth_data.dart';
import 'package:dex_course/features/auth/domain/entity/auth_credentials.dart';
import 'package:dex_course/util/rest_api_error_list_ext.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  Future<UseCaseResult<AuthCredentials>> signIn({
    required final String phone,
    required final String password,
  }) async {
    final sourceResult =
        await _authDataSource.signIn(phone: phone, password: password);

    return switch (sourceResult) {
      DataRemoteResponse<AuthCredentialsModel>(:final data) =>
        UseCaseResult.good(AuthCredentials.fromModel(data)),
      VoidRemoteResponse<AuthCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<AuthCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  Future<UseCaseResult<AuthCredentials>> signUp({
    required final String password,
    required final String repeatPassword,
  }) async {
    final sourceResult = await _authDataSource.signUp(
        password: password, repeatPassword: repeatPassword);

    return switch (sourceResult) {
      DataRemoteResponse<AuthCredentialsModel>(:final data) =>
        UseCaseResult.good(AuthCredentials.fromModel(data)),
      VoidRemoteResponse<AuthCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<AuthCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  Future<UseCaseResult<AuthCredentials>> recoveryPassword({
    required final String phone,
  }) async {
    final sourceResult = await _authDataSource.recoveryPassword(phone: phone);

    return switch (sourceResult) {
      DataRemoteResponse<AuthCredentialsModel>(:final data) =>
        UseCaseResult.good(AuthCredentials.fromModel(data)),
      VoidRemoteResponse<AuthCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<AuthCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  Future<UseCaseResult<AuthCredentials>> enterCode(
      {required final String number1,
      required final String number2,
      required final String number3,
      required final String number4}) async {
    final sourceResult = await _authDataSource.enterCode(
        number1: number1, number2: number2, number3: number3, number4: number4);

    return switch (sourceResult) {
      DataRemoteResponse<AuthCredentialsModel>(:final data) =>
        UseCaseResult.good(AuthCredentials.fromModel(data)),
      VoidRemoteResponse<AuthCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<AuthCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }
}
