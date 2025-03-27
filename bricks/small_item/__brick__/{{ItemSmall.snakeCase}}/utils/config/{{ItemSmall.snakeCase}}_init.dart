import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/all_items/tag/data/datasources/tag_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/all_items/tag/data/repositories/tag_repository_drift.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/tag_crud_use_case/tag_add_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/tag_crud_use_case/tag_get_items_from_user_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/tag_link_use_case/tag_get_links_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/tag_link_use_case/tag_update_links_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_cubit/tag_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_cubit/tag_form_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/domain/usecases/export_items_to_excel_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void tagInit() {
  // Tag Data Source
  sl.registerLazySingleton<TagLocalDataSourceDrift>(
      () => TagLocalDataSourceDrift(db: sl<OrganizerDriftDB>()));

  // Tag Repository
  sl.registerLazySingleton<TagRepository>(() => TagRepositoryDrift(
        localDataSource: sl<TagLocalDataSourceDrift>(),
      ));

  // Tag Use cases
  sl.registerLazySingleton(() => TagAddUseCase(sl()));
  sl.registerLazySingleton(() => TagUpdateUseCase(sl()));
  sl.registerLazySingleton(() => TagDeleteUseCase(sl()));
  sl.registerLazySingleton(() => TagGetItemsFromUserUseCase(sl()));
  sl.registerLazySingleton(() => ExportItemsToExcelUseCase<TagDto>(sl()));

  // Task Link Use Cases

  sl.registerLazySingleton(() => TagGetLinksUseCase<UserEntity>(sl()));
  sl.registerLazySingleton(() => UpdateTagLinkUseCase<UserEntity>(sl()));

  // Tag BLoCs
  sl.registerLazySingleton<TagBloc>(() => TagBloc(sl()));

  // Tag Cubit
  sl.registerLazySingleton(() => TagCubit(
        getEntitiesFromUserUseCase: sl(),
      ));
  sl.registerFactory(() => TagFormCubit());
}
