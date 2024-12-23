import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/network/crud.dart';
import 'package:currency_trading/model/general_model.dart';
import 'package:currency_trading/model/subscription_package_model.dart';
import 'package:currency_trading/utils/constants/app_api.dart';
import 'package:dio/dio.dart';

abstract class GeneralRepository {
  Future fetchGeneralData();
  Future subscriptionPackage({String? value});
}

class GeneralRepositoryImpl extends GeneralRepository {
  @override
  Future fetchGeneralData() async {
    print(AppApi.general);
    return _fetchData(
      url: AppApi.general,
      fromJson: (json) => GeneralModel.fromJson(json),
    );
  }

// ============ Subscription Package ==============

  @override
  Future subscriptionPackage({String? value}) async {
    print(
      ('${AppApi.subscriptionPackage}$value'),
    );
    return _fetchData(
      url: ('${AppApi.subscriptionPackage}$value'),
      fromJson: (json) => SubscriptionPackageModel.fromJson(json),
    );
  }

  Future _fetchData(
      {required String url,
      required Function fromJson,
      CancelToken? cancelToken}) async {
    try {
      final result = await Crud().get(url: url, cancelToken: cancelToken);
      return result.fold(
        (failure) => failure,
        (data) => fromJson(data),
      );
    } catch (_) {
      return Failures(errMessage: 'An error occurred');
    }
  }
}