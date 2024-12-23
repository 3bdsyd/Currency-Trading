import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/network/crud.dart';
import 'package:currency_trading/model/signals/signal_details_model.dart';
import 'package:currency_trading/utils/constants/app_api.dart';
import 'package:dio/dio.dart';

abstract class SignalDetailsRepository {
  Future signalsDetails(int id);
}

class SignalDetailsRepositoryImpl extends SignalDetailsRepository {
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
  Future signalsDetails(int id) {
    print('${AppApi.signalsDetails}${id}');
    return _fetchData(
      url: '${AppApi.signalsDetails}${id}',
      fromJson: (json) => SignalDetailsModel.fromJson(json),
    );
  }
}
