import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/domain/models/paged_list_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getCharactersByIds(List<int> ids);

  Future<PagedListEntity<CharacterEntity>> getCharacters({
    int? page,
    String? name,
    Map<CharacterStatus, bool>? characterFilter,
    Map<Gender, bool>? genderFilter,
  });

  Future<CharacterEntity> getCharacterById(int id);
}
