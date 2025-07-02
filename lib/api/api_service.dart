import 'package:dio/dio.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty/data/models/paged_list_model.dart';

class ApiService {
  final Dio _dio;

  ApiService({required DioClient dioClient}) : _dio = dioClient.dio;

  Future<List<CharacterModel>> getCharactersByIdList(List<int> ids) async {
    String idList = ids.join(","); // [1, 2, 3] => "1,2,3"
    Response res = await _dio.get(
      "/character/$idList",
    ); // запрос на сервер => Response

    List<CharacterModel> characters = [];
    for (var element in res.data) {
      CharacterModel characterModel = CharacterModel.fromJson(
        element,
      );

      characters.add(characterModel);
    }

    return characters;
  }

  Future<CharacterModel> getCharacterById(int id) async {
    Response res = await _dio.get("/character/$id");

    // res.data is Map<String, dynamic> => true

    CharacterModel character = CharacterModel.fromJson(res.data);
    return character;
  }

  Future<PagedListModel<CharacterModel>> getCharacters() async {
    Response res = await _dio.get("/character");

    PagedListModel<CharacterModel> pagedList = PagedListModel<CharacterModel>.fromJson(
      res.data,
      CharacterModel.fromJson,
    );
    return pagedList;
  }
}
