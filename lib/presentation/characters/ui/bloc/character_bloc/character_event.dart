part of 'character_bloc.dart';

@immutable
sealed class CharacterEvent {}

final class LoadCharactersEvent extends CharacterEvent {
  final String? name;
  final Map<CharacterStatus, bool>? characterFilter;
  final Map<Gender, bool>? genderFilter;

  LoadCharactersEvent({
    this.name,
    this.characterFilter,
    this.genderFilter,
  });
}

final class LoadNextCharactersPageEvent extends CharacterEvent {
  final String? name;
  final Map<CharacterStatus, bool>? characterFilter;
  final Map<Gender, bool>? genderFilter;

  LoadNextCharactersPageEvent({
    this.name,
    this.characterFilter,
    this.genderFilter,
  });
}
