import 'package:dio/dio.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/models/character_model.dart';

class ApiService {
  final Dio _dio;

  ApiService({required DioClient dioClient}) : _dio = dioClient.dio;

  Future<List<CharacterModel>> getCharactersByIdList(List<int> ids) async {
    String idList = ids.join(",");
    Response<List<CharacterModel>> res = await _dio.get<List<CharacterModel>>("/character/$idList");
    return res.data!;
  }
}