part of 'filter_cubit.dart';

@immutable
sealed class FilterState {
  final CharacterStatus? selectedStatus;
  final Gender? selectedGender;

  const FilterState({this.selectedStatus, this.selectedGender});
}

final class FilterInitial extends FilterState {}

final class FilterUpdated extends FilterState {
  const FilterUpdated({super.selectedStatus, super.selectedGender});
}

final class FilterUsed extends FilterState {
  const FilterUsed({super.selectedStatus, super.selectedGender});
}
