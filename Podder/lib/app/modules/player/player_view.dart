import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/models/rss_feed_model.dart';
import 'player_controller.dart';
import 'widgets/player_widget.dart';

class PlayerView extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<Podcast>(context).selectedItem.title),
      ),
      body: SafeArea(
        child: Player(),
      ),
    );
  }
}
