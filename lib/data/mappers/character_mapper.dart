import 'package:collection/collection.dart';
import 'package:rick_and_morty/common/utils.dart';
import 'package:rick_and_morty/data/mappers/location_mapper.dart';
import 'package:rick_and_morty/data/models/character_dto.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';

class CharacterMapper {
  static CharacterEntity fromDto(CharacterDto dto) {
    return CharacterEntity(
      id: dto.id,
      name: dto.name,
      species: dto.species,
      type: dto.type,
      image: dto.image,
      status: _toCharacterStatus(dto.status),
      gender: _toGender(dto.gender),
      origin: LocationMapper.fromDto(dto.origin),
      location: LocationMapper.fromDto(dto.location),
      episodeIds: dto.episode.map((e) => Utils.getIdFromUrl(e)).toList(),
    );
  }

  static CharacterStatus _toCharacterStatus(String status) {
    print(CharacterStatus.values); // => [CharacterStatus.dead, CharacterStatus.alive, CharacterStatus.unknown]

    return CharacterStatus.values.firstWhereOrNull((element) => element.name == status) ?? CharacterStatus.unknown;
  }

  static Gender _toGender(String gender) {
    return Gender.values.firstWhereOrNull((element) => element.name == gender) ?? Gender.unknown;
  }
}
