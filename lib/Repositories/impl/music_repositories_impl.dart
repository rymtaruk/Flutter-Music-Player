import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:musicplayer/Models/track_model.dart';
import 'package:musicplayer/Repositories/imusic_repository.dart';
import 'package:musicplayer/Repositories/network/network.dart';

@singleton 
class MusicRepositoriesImpl implements IMusicRepository{
  @override
  Future<TrackModel?> getMusicByTitle(Network network, String term) async{

    late Response? response;
    try {
      response = await network.getNetwork("/search?music=musicTrack", queryParameters: {
        "term": term
      });
      return trackModelFromJson(response?.data);
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}