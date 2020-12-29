import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:bitcoin_ticker/app/constants/enums.dart';
import '../../../data/coin_data.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BitCoin Ticker 🤑'),
        leading: IconButton(
          icon: Icon(Get.isDarkMode ? Icons.nightlife : Icons.wb_sunny_rounded),
          onPressed: () => Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                ...List.generate(
                  cryptoList.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.all(5),
                    child: Obx(() {
                      if (controller.currentState.value == AppState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        );
                      } else if (controller.currentState.value ==
                          AppState.loaded) {
                        return Text(
                          '1 ${cryptoList[index]} = ${controller.lastPriceList[index]} ${controller.selectedCurrency}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      } else {
                        return Text(controller.data);
                      }
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
              child: CupertinoPicker.builder(
                childCount: currenciesList.length,
                backgroundColor: Theme.of(context).primaryColor,
                itemBuilder: (context, index) => Text(
                  currenciesList[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onSelectedItemChanged: (int index) =>
                    controller.getCoinData(index),
                itemExtent: 35.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
