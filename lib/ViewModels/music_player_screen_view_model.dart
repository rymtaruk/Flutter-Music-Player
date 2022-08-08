import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:musicplayer/Base/base_view_model.dart';
import 'package:musicplayer/Models/result_model.dart';
import 'package:musicplayer/Repositories/impl/music_repositories_impl.dart';
import 'package:musicplayer/Repositories/imusic_repository.dart';
import 'package:musicplayer/Repositories/network/network.dart';
import 'package:musicplayer/Setup.dart';

@injectable
class MusicPlayerScreenViewModel extends BaseViewModel {
  final audioPlayer = AudioPlayer(playerId: "music_player_test");
  final TextEditingController searchTextBarController = TextEditingController();

  ResultModel? _selectedTrack;
  double? _duration;
  double? _sliderValueHolder;
  String? _textField1;
  bool _isPlay = false;
  bool _showMusicController = false;
  Timer? _debounce;
  List<ResultModel>? _listTrack;
  Network network = Network();

  double get sliderValueHolder => _sliderValueHolder ?? 0;
  String? get textField1 => _textField1;

  bool get isPlay => _isPlay;

  bool get showMusicController => _showMusicController;

  List<ResultModel>? get listTrack => _listTrack;

  ResultModel? get selectedTrack => _selectedTrack;

  double? get duration => _duration;

  final IMusicRepository _repository = getIt<MusicRepositoriesImpl>();

  Future<void> onSearchTextChange() async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    if (!isPlay) {
      _showMusicController = false;
      notifyListeners();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final temp = await _repository.getMusicByTitle(
          network, searchTextBarController.text);

      _listTrack = temp?.results;
      notifyListeners();
    });
  }

  Future<void> playAudioFromUrl(String? url, [ResultModel? trackData]) async {
    _selectedTrack = trackData;
    if (url != null) {
      await audioPlayer.release();
      await audioPlayer.setSourceUrl(url);

      audioPlayer.onDurationChanged.listen((event) {
        _duration = event.inMilliseconds.toDouble();
        notifyListeners();
      });

      audioPlayer.onPositionChanged.listen((event) {
        _sliderValueHolder = event.inMilliseconds.toDouble();
        notifyListeners();
      });
    }
    await audioPlayer.resume();
    _isPlay = true;
    _showMusicController = true;
    notifyListeners();
  }

  void onPlayerSliderValueChange(double playingTime) {
    audioPlayer.seek(Duration(milliseconds: playingTime.toInt()));
    notifyListeners();
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    _isPlay = false;
    notifyListeners();
  }

  Future<void> resumeMusic() async {
    await audioPlayer.resume();
    _isPlay = true;
    notifyListeners();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    _debounce?.cancel();
    super.dispose();
  }
}
