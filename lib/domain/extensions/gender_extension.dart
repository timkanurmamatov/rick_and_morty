import 'package:rick_and_morty/domain/models/character_entity.dart';

extension GenderExtension on Gender {
  String get text {
    switch (this) {
      case Gender.male:
        return "Мужской";
      case Gender.female:
        return "Женский";
      case Gender.genderless:
        return "Без полый";
      case Gender.unknown:
        return "не известно";
    }
  }
}
