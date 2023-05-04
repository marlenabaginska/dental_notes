import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dental_notes/data/remote_data_sources/workdone_remote_data_source.dart';
import 'package:dental_notes/domain/models/workdone_model.dart';
import 'package:dental_notes/domain/reporitories/workdone_repository.dart';

import 'package:meta/meta.dart';

part 'current_month_state.dart';

class CurrentMonthCubit extends Cubit<CurrentMonthState> {
  CurrentMonthCubit(this._workdoneRespository, this._workdoneRemoteDataSource)
      : super(const CurrentMonthState(workdone: []));

  StreamSubscription? _streamSubscription;
  final WorkdoneRepository _workdoneRespository;
  final WorkdoneRemoteDataSource _workdoneRemoteDataSource;

  Future<void> workdone() async {
    _streamSubscription = _workdoneRespository.workdone().listen((workdone) {
      emit(
        CurrentMonthState(
          workdone: workdone,
        ),
      );
    });
  }

  Future<void> addWorkdone(
    DateTime date,
    String doctor,
    String patient,
    int quantity,
    String color,
    String type,
    String teeth,
  ) async {
    await _workdoneRemoteDataSource.addWorkdone(
      date,
      doctor,
      patient,
      quantity,
      color,
      type,
      teeth,
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
