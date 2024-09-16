import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/add_tag_items_to_task.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void taskInit() {
  // Task Data Sources
  sl.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSourceImpl(
        httpClient: sl(),
      ));
  sl.registerLazySingleton<TaskLocalDataSourceDrift>(
      () => TaskLocalDataSourceDrift(
            db: sl<OrganizerDriftDB>(),
          ));

  // Task Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryDrift(
        localDataSource: sl<TaskLocalDataSourceDrift>(),
      ));

  // Task Use cases


  // Task BLoCs
  sl.registerFactory(() => {{BrickChangeName.snakeCase()}}Bloc( ));

}
