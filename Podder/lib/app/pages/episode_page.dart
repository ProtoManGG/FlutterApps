import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podder/app/logic/controllers/home_controller.dart';

import '../widgets/widgets.dart';

class EpisodesPage extends GetView<HomeController>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EpisodeListView(rssFeed: controller.rssFeed),
      ),
    );
  }
}
