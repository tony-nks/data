import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:floor_skillbox/data/models/app_person/app_person.dart';

part 'bloc_persons_state.freezed.dart';

@freezed
class BlocPersonsState with _$BlocPersonsState {
  const factory BlocPersonsState.init() = BlocPersonsStateInit;

  const factory BlocPersonsState.loadedNoData() = BlocPersonsStateLoadedNoData;

  const factory BlocPersonsState.loadedData(
    List<AppPerson> persons,
    Map<String, String> cards,
  ) = BlocPersonsStateLoaded;
}
