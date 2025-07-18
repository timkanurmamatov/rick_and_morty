import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:collection/collection.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  void updateFilters({
    required Map<CharacterStatus, bool> statusFilter,
    required Map<Gender, bool> genderFilter,
  }) {
    final eq = DeepCollectionEquality();
    bool statusFilterChanged = !eq.equals(state.statusFilter, statusFilter);
    bool genderFilterChanged = !eq.equals(state.genderFilter, genderFilter);

    if (statusFilterChanged || genderFilterChanged) {
      emit(
        FilterUpdated(statusFilter: statusFilter, genderFilter: genderFilter),
      );
    }
  }

  void filterUdes() {
    emit(
      FilterUsed(
        statusFilter: state.statusFilter,
        genderFilter: state.genderFilter,
      ),
    );
  }
}
