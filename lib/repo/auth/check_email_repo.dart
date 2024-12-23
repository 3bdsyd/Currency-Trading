import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/network/crud.dart';
import 'package:currency_trading/model/auth/chech_email.dart';
import 'package:currency_trading/model/auth/register_model.dart';
import 'package:currency_trading/utils/constants/app_api.dart';

abstract class CheckEmailRepository {
  Future checkEmail({
    required String email,
  });
}

class CheckEmailRepositoryImpl extends CheckEmailRepository {
  @override
  Future checkEmail({
    required String email,
  }) async {
    return _postData(
      url: AppApi.checkEmail,
      fromJson: (json) => CheckEmailModel.fromJson(json),
      body: {
        'email': email,
      },
    );
  }

  /// Generic method to post data to the API and handle errors.
  Future _postData({
    required String url,
    required Function fromJson,
    required Map<String, String> body,
  }) async {
    try {
      final result = await Crud().post(url: url, body: body);
      return result.fold(
        (failure) => failure,
        (data) => fromJson(data),
      );
    } catch (_) {
      return Failures(errMessage: 'An error occurred');
    }
  }
}
