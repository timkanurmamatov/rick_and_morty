import 'package:dio/dio.dart';
import 'package:rick_and_morty/api/dio_client.dart';
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
  }) async {
    Map<String, dynamic> queries = {
      if (page != null) "page": page,
      if (name != null) "name": name,
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
  // Future<PagedListModel<EpisodeModel>> getEpisodes() async {
  //   Response res = await _dio.get("/episode");
  //
  //   PagedListModel<EpisodeModel> pagedList = PagedListModel<EpisodeModel>.fromJson(
  //     res.data,
  //     EpisodeModel.fromJson,
  //   );
  //   return pagedList;
  // }
}
