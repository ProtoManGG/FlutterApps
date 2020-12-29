import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:bitcoin_ticker/app/constants/enums.dart';
import '../../../data/coin_data.dart';
import '../../../data/models/failure_model.dart';
import '../../../services/dio_service.dart';

class HomeController extends GetxController {
  final _api = ApiService().instance;

  final currentState = AppState.initial.obs;
  String data = 'Press the button 👇';

  String selectedCurrency = 'AUD';
  List<double> lastPriceList = [0.0, 0.0, 0.0];

  @override
  void onInit() {
    getCoinData(0);

    super.onInit();
  }

  Future getCoinData(int index) async {
    currentState.value = AppState.loading;

    selectedCurrency = currenciesList[index];
    for (final cryptoCurrency in cryptoList) {
      final String requestURL = '/$cryptoCurrency$selectedCurrency';
      try {
        final response = await _api.dio.get(requestURL);
        lastPriceList[cryptoList.indexOf(cryptoCurrency)] =
            response.data['last'] as double;
      } on DioError catch (e) {
        if (e.response != null) {
          throw Failure(
            statusCode: e.response.statusCode,
            message: e.response.statusMessage,
          );
        } else {
          throw Failure(message: e.message);
        }
      }
    }
    currentState.value = AppState.loaded;
  }
}
