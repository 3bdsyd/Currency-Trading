import 'dart:async';

import 'package:currency_trading/model/results_model.dart';
import 'package:currency_trading/repo/results_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResultsController extends GetxController {
  Future<void> results();
}

class ResultsControllerImpl extends ResultsController {
  final ResultsRepositoryImpl _repository = ResultsRepositoryImpl();
  TextEditingController resultsController = TextEditingController();
  final StreamController streamController = StreamController();

  ResultsModel? resultsModel;

  int time = 7;
  int selectedIndex = 0;
  List timeItem = ['1W', '1M', '3M', '6M', '1Y'];

  @override
  void onInit() {
    super.onInit();
    results();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      streamController.add(timer.tick);
    });
  }

  @override
  void onClose() {
    streamController.close();
    super.onClose();
  }

  void selectTime(int index) async {
    if (index == selectedIndex) return;
    if (index == 0) {
      time = 7;
    } else if (index == 1) {
      time = 30;
    } else if (index == 2) {
      time = 90;
    } else if (index == 3) {
      time = 180;
    } else if (index == 4) {
      time = 360;
    }

    selectedIndex = index;
    await results();
    update();
  }

  @override
  Future<void> results() async {
    final result = await _repository.results(time);
    if (result is ResultsModel) {
      resultsModel = result;
      print('====================== succcus results');
    } else {
      await results();
    }
    update();
  }
}
