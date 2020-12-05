import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/enums.dart';
import 'player_controller.dart';
import '../../widgets/state_widgets.dart';
import 'package:webfeed/domain/rss_item.dart';

import 'playback_button_bar_widget.dart';

class PlayerView extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.appState.value == AppState.loading) {
              return buildLoadingWidget();
            } else if (controller.appState.value == AppState.failure) {
              return buildFailureWidget(controller.failure);
            } else {
              return Player(rssItem: controller.rssItem);
            }
          },
        ),
      ),
    );
  }
}

class Player extends StatelessWidget {
  final RssItem rssItem;
  const Player({@required this.rssItem}) : assert(rssItem != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 5,
          child: Image.network(rssItem.itunes.image.href),
        ),
        Flexible(
          flex: 5,
          child: SingleChildScrollView(
            child: Text(rssItem.description),
          ),
        ),
        Flexible(
          flex: 3,
          child: PlaybackButtonBar(rssItem: rssItem),
        ),
      ],
    );
  }
}
