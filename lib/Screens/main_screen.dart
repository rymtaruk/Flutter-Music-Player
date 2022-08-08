import 'package:flutter/material.dart';

import 'package:musicplayer/Base/base_view.dart';
import 'package:musicplayer/Components/list_view_task_item.dart';
import 'package:musicplayer/Models/result_model.dart';
import 'package:musicplayer/ViewModels/music_player_screen_view_model.dart';

class MainScreen extends BaseView<MusicPlayerScreenViewModel> {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, MusicPlayerScreenViewModel viewModel,
      Widget? child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Music App')),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                child: TextFormField(
                  onChanged: (value) => viewModel.onSearchTextChange(),
                  decoration: InputDecoration(
                      hintText: 'Search Here',
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  controller: viewModel.searchTextBarController,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.listTrack?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListViewTaskItem(
                      trackData: viewModel.listTrack?[index],
                      onTrackSelected: (trackData) {
                        //onTrackSelected, do play here...
                        viewModel.playAudioFromUrl(
                            (trackData as ResultModel).previewUrl, trackData);
                      },
                    );
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Visibility(
              visible: viewModel.showMusicController,
              child: Container(
                height: 100,
                color: Colors.blue,
                alignment: AlignmentDirectional.bottomCenter,
                child: Column(
                  children: [
                    Visibility(
                      visible: viewModel.isPlay,
                      child: IconButton(
                          onPressed: () => viewModel.pauseAudio(),
                          icon: const Icon(Icons.pause)),
                    ),
                    Visibility(
                      visible: !viewModel.isPlay,
                      child: IconButton(
                          onPressed: () => viewModel.resumeMusic(),
                          icon: const Icon(Icons.play_arrow)),
                    ),
                    Slider(
                        value: viewModel.sliderValueHolder,
                        max: viewModel.duration ?? 0.0,
                        activeColor: Colors.green,
                        inactiveColor: Colors.grey,
                        onChanged: (playingTime){
                          viewModel.onPlayerSliderValueChange(playingTime);
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
