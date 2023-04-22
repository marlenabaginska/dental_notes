import 'package:dental_notes/data/remote_data_sources/workdone_remote_data_source.dart';
import 'package:dental_notes/domain/models/workdone_model.dart';

class WorkdoneRepository {
  WorkdoneRepository(this._workdoneRemoteDataSource);
  final WorkdoneRemoteDataSource _workdoneRemoteDataSource;

  Stream<List<WorkdoneModel>> workdone() {
    return _workdoneRemoteDataSource.workdone().map((querySnapshots) =>
        querySnapshots.docs
            .map((workdone) => WorkdoneModel.fromJson(workdone))
            .toList());
  }
}
