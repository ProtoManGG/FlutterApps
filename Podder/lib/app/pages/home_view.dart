import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/controllers/home_controller.dart';
import '../widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: EpisodeListView(rssFeed: controller.rssFeed),
      ),
    );
  }
}
