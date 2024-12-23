import 'package:currency_trading/core/network/crud.dart';
import 'package:currency_trading/model/auth/login_model.dart';
import 'package:currency_trading/utils/constants/app_api.dart';

abstract class LoginRepository {
  Future loginUser({
    required String email,
    required String password,
  });
}

class LoginRepositoryImpl extends LoginRepository {
  /// Registers a new user with the provided details and returns a `RegisterModel` or `Failures`.
  @override
  Future loginUser({
    required String email,
    required String password,
  }) async {
    return _postData(
      url: AppApi.login,
      fromJson: (json) => LoginModel.fromJson(json),
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  /// Generic method to post data to the API and handle errors.
  Future _postData({
    required String url,
    required Function fromJson,
    required Map<String, String> body,
  }) async {
    // try {
    final result = await Crud().post(url: url, body: body);
    return result.fold(
      (failure) => failure,
      (data) => fromJson(data),
    );
    // } catch (_) {
    //   return Failures(
    //     errMessage: languageService.currentLanguageCode() == 'en'
    //         ? 'An error occurred'
    //         : 'حدث خطأ ما',
    //   );
    // }
  }
}
