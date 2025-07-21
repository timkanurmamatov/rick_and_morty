import 'package:dio/dio.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/data/models/paged_list_dto.dart';

import '../data/models/character_dto.dart';

class ApiService {
  final Dio _dio;

  ApiService({required DioClient dioClient}) : _dio = dioClient.dio;

  Future<List<CharacterDto>> getCharactersByIdList(List<int> ids) async {
    String idList = ids.join(","); // [1, 2, 3] => "1,2,3"
    Response res = await _dio.get(
      "/character/$idList",
    ); // запрос на сервер => Response

    List<CharacterDto> characters = [];
    for (var element in res.data) {
      CharacterDto characterModel = CharacterDto.fromJson(
        element,
      );

      characters.add(characterModel);
    }

    return characters;
  }

  Future<CharacterDto> getCharacterById(int id) async {
    Response res = await _dio.get("/character/$id");

    // res.data is Map<String, dynamic> => true

    CharacterDto character = CharacterDto.fromJson(res.data);
    return character;
  }

  Future<PagedListDto<CharacterDto>> getCharacters({
    int? page,
    String? name,
    String? species,
    String? status,
    String? type,
    String? gender,
  }) async {
    Map<String, dynamic> queries = {
      if (page != null) "page": page,
      if (name != null) "name": name,
      if (species != null) "species": species,
      if (status != null) "status": status,
      if (type != null) "type": type,
      if (gender != null) "gender": gender,
    };

    Response res = await _dio.get("/character", queryParameters: queries);

    PagedListDto<CharacterDto> pagedList = PagedListDto<CharacterDto>.fromJson(
      res.data,
      CharacterDto.fromJson,
    );
    return pagedList;
  }

  // Future<PagedListModel<LocationModel>> getLocations() async {
  //   Response res = await _dio.get("/location");
  //
  //   PagedListModel<LocationModel> pagedList = PagedListModel<LocationModel>.fromJson(
  //     res.data,
  //     LocationModel.fromJson,
  //   );
  //   return pagedList;
  // }
  //

  Future<PagedListDto<EpisodeDto>> getEpisodes({
    int? page,
    String? name,
  }) async {
    Map<String, dynamic> queries = {
      if (page != null) "page": page,
      if (name != null) "name": name,
    };

    Response res = await _dio.get(
      "/episode",
      queryParameters: queries,
    );

    PagedListDto<EpisodeDto> pagedList = PagedListDto<EpisodeDto>.fromJson(
      res.data,
      EpisodeDto.fromJson,
    );
    return pagedList;
  }

  Future<List<EpisodeDto>> getEpisodesByIdList(List<int> ids) async {
    if (ids.isEmpty) {
      return [];
    }

    String idList = ids.join(","); // [1, 2, 3] => "1,2,3"
    Response res = await _dio.get(
      "/episode/$idList,",
    ); // запрос на сервер => Response

    List<EpisodeDto> episodes = [];
    for (var element in res.data) {
      EpisodeDto episodeDto = EpisodeDto.fromJson(
        element,
      );

      episodes.add(episodeDto);
    }

    return episodes;
  }

  Future<EpisodeDto> getEpisodeById(int id) async {
    Response res = await _dio.get("/episode/$id");

    EpisodeDto episodeDto = EpisodeDto.fromJson(res.data);
    return episodeDto;
  }
}
