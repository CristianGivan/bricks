import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getTaskBlocProviders() {
  return [
    BlocProvider<TaskBlocTask>(
      create: (_) => GetIt.instance<TaskBlocTask>(),
    ),
  ];
}
