import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  void updateFilters({
    CharacterStatus? selectedStatus,
    Gender? selectedGender,
  }) {
    bool statusChanged = selectedStatus != state.selectedStatus;
    bool genderChanged = selectedGender != state.selectedGender;

    if (statusChanged || genderChanged) {
      emit(
        FilterUpdated(selectedStatus: selectedStatus, selectedGender: selectedGender),
      );
    }
  }

  void filterUsed() {
    emit(
      FilterUsed(
        selectedStatus: state.selectedStatus,
        selectedGender: state.selectedGender,
      ),
    );
  }
}
