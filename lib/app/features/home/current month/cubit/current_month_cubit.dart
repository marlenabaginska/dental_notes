import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dental_notes/domain/models/workdone_model.dart';
import 'package:dental_notes/domain/reporitories/workdone_repository.dart';

import 'package:meta/meta.dart';

part 'current_month_state.dart';

class CurrentMonthCubit extends Cubit<CurrentMonthState> {
  CurrentMonthCubit(this._workdoneRespository)
      : super(const CurrentMonthState(workdone: []));

  StreamSubscription? _streamSubscription;
  final WorkdoneRepository _workdoneRespository;

  Future<void> workdone() async {
    _streamSubscription = _workdoneRespository.workdone().listen((workdone) {
      emit(
        CurrentMonthState(
          workdone: workdone,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
