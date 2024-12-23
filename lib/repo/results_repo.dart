import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/network/crud.dart';
import 'package:currency_trading/model/results_model.dart';
import 'package:currency_trading/utils/constants/app_api.dart';
import 'package:dio/dio.dart';

abstract class ResultsRepository {
  Future results(int time);
}

class ResultsRepositoryImpl extends ResultsRepository {
  @override
  Future results(int time) async {
    print('${AppApi.results}$time');
    return _fetchData(
      url: '${AppApi.results}$time',
      fromJson: (json) => ResultsModel.fromJson(json),
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
