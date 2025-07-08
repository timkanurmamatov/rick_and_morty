import 'package:rick_and_morty/common/utils.dart';
import 'package:rick_and_morty/data/models/location_short_dto.dart';
import 'package:rick_and_morty/domain/models/location_short_entity.dart';

class LocationMapper {
  static LocationShortEntity fromDto(LocationShortDto dto) {
    return LocationShortEntity(
      name: dto.name,
      id: Utils.getIdFromUrl(dto.url),
    );
  }
}
