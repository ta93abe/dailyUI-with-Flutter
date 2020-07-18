/* Day 9 - Music Player

Design Hint...

Design a music player.
Consider the controls, placements, imagery such as the artist or album cover, etc.
Also, consider the device type that's playing the music.
A dashboard in a tourbus, a smartwatch, or via a web browser.
Each device type will have different requirements, features, and restrictions to consider.

 */

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Player(),
    );
  }
}

final String url = "";

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer _audioPlayer;
  AudioPlayerState _playerState = AudioPlayerState.STOPPED;

  Duration _duration;
  Duration _position;

  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  bool get _isPlaying => _playerState == AudioPlayerState.PLAYING;
  String get _durationText =>
      _duration?.toString()?.split(".")?.first?.substring(2) ?? "";
  String get _positionText =>
      _position?.toString()?.split(".")?.first?.substring(2) ?? "";

  Future<int> _play(String url) async {
    final playPos = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;
    final res = await _audioPlayer.play(url, position: playPos);
    if (res == 1) setState(() => _playerState = AudioPlayerState.PLAYING);
    _audioPlayer.setPlaybackRate(playbackRate: 1.0);
    return res;
  }

  Future<int> _pause() async {
    final res = await _audioPlayer.pause();
    if (res == 1) setState(() => _playerState = AudioPlayerState.PAUSED);
    return res;
  }

  Future<int> _stop() async {
    final res = await _audioPlayer.stop();
    if (res == 1) {
      setState(() {
        _playerState = AudioPlayerState.STOPPED;
        _position = Duration();
      });
    }
    return res;
  }

  double v = 30;
  bool isPlay = false;
  _playSwitch() => setState(() => isPlay = !isPlay);

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _durationSubscription = _audioPlayer.onDurationChanged.listen(
      (d) => setState(
        () => _duration = d,
      ),
    );
    _positionSubscription = _audioPlayer.onAudioPositionChanged.listen(
      (p) => setState(
        () => _position = p,
      ),
    );
    _playerCompleteSubscription = _audioPlayer.onPlayerCompletion.listen(
      (_) => setState(
        () {
          _playerState = AudioPlayerState.STOPPED;
          _position = _duration;
        },
      ),
    );
    _playerErrorSubscription = _audioPlayer.onPlayerError.listen(
      (_) => setState(
        () {
          _duration = Duration(seconds: 0);
          _position = Duration(seconds: 0);
        },
      ),
    );
    _audioPlayer.onPlayerStateChanged.listen(
      (state) {
        if (!mounted) return;
        setState(
          () => _playerState = state,
        );
      },
    );
    _play(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              SleekCircularSlider(
                onChange: (value) => setState(
                  () => v = value,
                ),
                appearance: CircularSliderAppearance(
                  size: 300,
                  customWidths: CustomSliderWidths(progressBarWidth: 10),
                ),
                min: 0,
                max: 100,
                initialValue: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/layer.png",
                ),
                foregroundColor: Colors.pink,
                radius: 100,
              ),
            ],
          ),
          Spacer(),
          Text(
            "Title",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("00:00"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("/"),
              ),
              Text("12:34"),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.fast_rewind,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.replay_10,
                ),
                onPressed: () {},
              ),
              isPlay
                  ? IconButton(
                      icon: Icon(
                        Icons.pause,
                      ),
                      onPressed: () {
                        _playSwitch();
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                      ),
                      onPressed: () {
                        _playSwitch();
                      },
                    ),
              IconButton(
                icon: Icon(
                  Icons.forward_10,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.fast_forward,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("made with Flutter"),
                FlutterLogo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
