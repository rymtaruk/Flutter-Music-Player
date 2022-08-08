import 'dart:convert';

import 'package:musicplayer/Models/result_model.dart';

TrackModel trackModelFromJson(String str) => TrackModel.fromJson(json.decode(str));
String trackModelToJson(TrackModel data) => json.encode(data.toJson());
class TrackModel {
  TrackModel({
    int? resultCount,
    List<ResultModel>? results,}){
    _resultCount = resultCount;
    _results = results;
  }

  TrackModel.fromJson(dynamic json) {
    _resultCount = json['resultCount'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(ResultModel.fromJson(v));
      });
    }
  }
  int? _resultCount;
  List<ResultModel>? _results;
  TrackModel copyWith({  int? resultCount,
    List<ResultModel>? results,
  }) => TrackModel(  resultCount: resultCount ?? _resultCount,
    results: results ?? _results,
  );
  int? get resultCount => _resultCount;
  List<ResultModel>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resultCount'] = _resultCount;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}