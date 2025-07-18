part of 'filter_cubit.dart';

@immutable
sealed class FilterState {
  final Map<CharacterStatus, bool> statusFilter;
  final Map<Gender, bool> genderFilter;

  const FilterState({required this.statusFilter, required this.genderFilter});
}

final class FilterInitial extends FilterState {
  FilterInitial()
    : super(
        genderFilter: Map.fromEntries(
          Gender.values.map(
            (e) => MapEntry(e, false),
          ),
        ),
        statusFilter: Map.fromEntries(
          CharacterStatus.values.map(
            (e) => MapEntry(e, false),
          ),
        ),
      );
}

final class FilterUpdated extends FilterState {
  const FilterUpdated({required super.statusFilter, required super.genderFilter});
}

final class FilterUsed extends FilterState {
  const FilterUsed({required super.statusFilter, required super.genderFilter});

}
