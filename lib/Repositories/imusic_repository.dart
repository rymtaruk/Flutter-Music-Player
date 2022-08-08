import 'package:musicplayer/Models/track_model.dart';
import 'package:musicplayer/Repositories/network/network.dart';

abstract class IMusicRepository{
  Future<TrackModel?> getMusicByTitle(Network network, String term);
}