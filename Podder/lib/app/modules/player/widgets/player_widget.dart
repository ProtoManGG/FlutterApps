import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/rss_feed_model.dart';
import 'playback_button_widget.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final podcast = Provider.of<Podcast>(context);

    return Column(
      children: <Widget>[
        Flexible(
          flex: 5,
          child: Image.network(podcast.feed.image.url),
        ),
        Flexible(
          flex: 5,
          child: SingleChildScrollView(
            child: Text(podcast.selectedItem.description),
          ),
        ),
        Flexible(
          flex: 2,
          child: PlaybackButton(),
        ),
      ],
    );
  }
}
