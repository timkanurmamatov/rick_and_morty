import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';

extension CharacterExtension on CharacterStatus {
  String get text {
    switch (this) {
      case CharacterStatus.alive:
        return "ЖИВОЙ";
      case CharacterStatus.dead:
        return "МЕРТВЫЙ";
      case CharacterStatus.unknown:
        return "НЕ ИЗВЕСТНО";
    }
  }

  Color get color {
    switch (this) {
      case CharacterStatus.alive:
        return Colors.green;
      case CharacterStatus.dead:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
