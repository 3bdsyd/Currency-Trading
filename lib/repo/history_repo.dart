import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/network/crud.dart';
import 'package:currency_trading/model/history_details_model.dart';
import 'package:currency_trading/model/history_model.dart';
import 'package:currency_trading/utils/constants/app_api.dart';
import 'package:dio/dio.dart';

abstract class HistoryRepository {
  Future fetchHistory();
  Future fetchHistoryDetails(String name);
}

class HistoryRepositoryImpl extends HistoryRepository {
  @override
  Future fetchHistory() async {
    print(AppApi.history);
    return _fetchData(
      url: AppApi.history,
      fromJson: (json) {
        List<HistoryModel> historyModel = [];
        historyModel = (json['data'] as List)
            .map((e) => HistoryModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return historyModel;
      },
    );
  }

// ============ History Details ==============

  @override
  Future fetchHistoryDetails(String name) async {
    print('${AppApi.historyDetails}$name');
    return _fetchData(
      url: ('${AppApi.historyDetails}$name'),
      fromJson: (json) => HistoryDetailsModel.fromJson(json),
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
