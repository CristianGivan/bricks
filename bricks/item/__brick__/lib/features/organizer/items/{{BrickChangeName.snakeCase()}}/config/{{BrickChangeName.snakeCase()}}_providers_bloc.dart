import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> get{{BrickChangeName.pascalCase()}}BlocProviders() {
  return [
    BlocProvider< {{BrickChangeName.pascalCase()}}Bloc>(
      create: (_) => GetIt.instance< {{BrickChangeName.pascalCase()}}Bloc>(),
    ),
  ];
}
