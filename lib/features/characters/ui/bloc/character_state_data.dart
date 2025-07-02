import 'package:rick_and_morty/data/models/character_model.dart';

class CharacterStateData {
  final List<CharacterModel> characters;

  const CharacterStateData({required this.characters});

  const CharacterStateData.empty() : characters = const [];

  CharacterStateData copyWith({
    List<CharacterModel>? characters,
  }) {
    return CharacterStateData(
      characters: characters ?? this.characters,
    );
  }
}
