import 'package:rick_and_morty/data/models/info_model.dart';

class PagedListModel {
  final InfoModel info;
  final List results;

  PagedListModel({required this.info, required this.results});

  factory PagedListModel.fromJson(Map<String, dynamic> json) {
    return PagedListModel(
      info: InfoModel.fromJson(json["info"]),
      results: json["results"],
    );
  }
}


