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

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final String url =
      "https://raw.githubusercontent.com/ta93abe/sample-resource-files/master/News_Room_News.mp3";

  AudioPlayer _audioPlayer;
  AudioPlayerState _playerState = AudioPlayerState.STOPPED;

  Duration _duration;
  Duration _position;

  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _isPlaying => _playerState == AudioPlayerState.PLAYING;
  get _durationText =>
      _duration?.toString()?.split(".")?.first?.substring(2) ?? "";
  get _positionText =>
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

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _durationSubscription = _audioPlayer.onDurationChanged.listen(
      (d) => setState(() => _duration = d),
    );
    _positionSubscription = _audioPlayer.onAudioPositionChanged.listen(
      (p) => setState(() => _position = p),
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
  void dispose() {
    _audioPlayer.stop();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
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
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/layer.png",
            ),
            radius: 100,
          ),
          Spacer(),
          Text(
            "Title",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Spacer(),
          Slider(
            label: "length",
            activeColor: Colors.pinkAccent,
            inactiveColor: Colors.grey,
            onChanged: (double value) {
              final pos = value * _duration.inMilliseconds;
              _audioPlayer.seek(Duration(milliseconds: pos.round()));
            },
            value: (_position != null &&
                    _duration != null &&
                    _position.inMilliseconds > 0 &&
                    _position.inMilliseconds < _duration.inMilliseconds)
                ? _position.inMilliseconds / _duration.inMilliseconds
                : 0,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _position != null
                  ? Text(_positionText)
                  : Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("/"),
              ),
              Text(
                _position != null ? _durationText : "",
              ),
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
                onPressed: () {
                  if (_isPlaying) {
                    _position = Duration(
                        milliseconds: _position.inMilliseconds - 10000);
                    _play(url);
                  } else {
                    _position = null;
                  }
                },
              ),
              _isPlaying
                  ? IconButton(
                      icon: Icon(
                        Icons.pause,
                      ),
                      onPressed: _isPlaying ? () => _pause() : null,
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                      ),
                      onPressed: _isPlaying ? null : () => _play(url),
                    ),
              IconButton(
                icon: Icon(
                  Icons.forward_10,
                ),
                onPressed: () {
                  if (_isPlaying) {
                    _position = Duration(
                        milliseconds: _position.inMilliseconds + 10000);
                    _play(url);
                  } else {
                    _position = null;
                  }
                },
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
