import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/rss_feed_model.dart';
import '../widgets/widgets.dart';



class PlayerPage extends StatelessWidget {
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
