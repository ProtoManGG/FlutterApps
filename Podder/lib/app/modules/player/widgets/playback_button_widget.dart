import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';

class PlaybackButtonBar extends StatefulWidget {
  final String guid;

  const PlaybackButtonBar({@required this.guid}) : assert(guid != null);
  @override
  _PlaybackButtonState createState() => _PlaybackButtonState();
}

class _PlaybackButtonState extends State<PlaybackButtonBar> {
  bool _isPlaying = false;
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  double _playPosition;

  Stream _playerSubscription;

  @override
  void initState() {
    super.initState();
    _player.openAudioSession().then((value) {
      setState(() {
        // flutterSoundPlayer = true;
      });
    });
    _playPosition = 0;
  }

  Future<void> _stop() async {
    await _player.stopPlayer();
    setState(() => _isPlaying = false);
  }

  Future<void> _play(String url) async {
    try {
      // _player = await FlutterSound().thePlayer.openAudioSession();
      print(_player.isOpen());
      await _player.startPlayer(fromURI: url);
      print(_player.isOpen());
      _playerSubscription = _player.onProgress
        ..listen(
          (e) {
            setState(
              () => _playPosition = e.position.inSeconds / e.duration.inSeconds,
            );
            print(e);
          },
        );
      setState(
        () => _isPlaying = true,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _forward() async {
    if (_isPlaying) {
      setState(
        () async {
          await _player.seekToPlayer(const Duration(seconds: -50));
        },
      );
    }
  }

  Future<void> _rewind() async {
    if (_isPlaying) {
      setState(
        () async {
          await _player.seekToPlayer(const Duration(seconds: 50));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          onChanged: (value) {},
          value: _playPosition,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.fast_rewind),
              onPressed: _rewind,
            ),
            IconButton(
              icon: _isPlaying
                  ? const Icon(Icons.stop)
                  : const Icon(Icons.play_arrow),
              onPressed: () {
                if (_isPlaying) {
                  _stop();
                } else {
                  _play(widget.guid);
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.fast_forward),
              onPressed: _forward,
            ),
          ],
        ),
      ],
    );
  }
}
