import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/network/crud.dart';
import 'package:currency_trading/model/signals/signals_model.dart';
import 'package:currency_trading/model/signals/signals_slider_model.dart';
import 'package:currency_trading/utils/constants/app_api.dart';
import 'package:dio/dio.dart';

abstract class SignalsRepository {
  Future fetchSliderImages();
  Future signals();
}

class SignalsRepositoryImpl extends SignalsRepository {
  @override
  Future fetchSliderImages() async {
    print(AppApi.slidersSignals);
    return _fetchData(
      url: AppApi.slidersSignals,
      fromJson: (json) => SignalsSliderModel.fromJson(json),
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

  @override
  Future signals() {
    print(AppApi.signals);
    return _fetchData(
      url: AppApi.signals,
      fromJson: (json) => SignalsModel.fromJson(json),
    );
  }
}
