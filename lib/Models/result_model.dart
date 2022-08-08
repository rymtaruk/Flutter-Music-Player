
import 'dart:convert';

ResultModel resultModelFromJson(String str) => ResultModel.fromJson(json.decode(str));
String resultModelToJson(ResultModel data) => json.encode(data.toJson());
class ResultModel {
  ResultModel({this.artistName, this.collectionName, this.trackName, this.previewUrl, this.artworkUrl100});

  String? artistName;
  String? collectionName;
  String? trackName;
  String? previewUrl;
  String? artworkUrl100;

  ResultModel.fromJson(dynamic json) {
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    trackName = json['trackName'];
    previewUrl = json['previewUrl'];
    artworkUrl100 = json['artworkUrl100'];
  }

  ResultModel copyWith({
    String? artistName,
    String? collectionName,
    String? trackName,
    String? previewUrl,
    String? artworkUrl100,
  }) => ResultModel(
    artistName: artistName ?? "",
    collectionName: collectionName ?? "",
    trackName: trackName ?? "",
    previewUrl: previewUrl ?? "",
    artworkUrl100: artworkUrl100 ?? "",
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['artistName'] = artistName;
    map['collectionName'] = collectionName;
    map['trackName'] = trackName;
    map['artworkUrl100'] = artworkUrl100;
    map['previewUrl'] = previewUrl;
    return map;
  }
}