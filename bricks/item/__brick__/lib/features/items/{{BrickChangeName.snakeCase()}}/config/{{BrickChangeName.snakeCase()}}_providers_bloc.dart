import 'package:fo_fe/features/organizer/items/{{BrickChangeName.snakeCase()}}/config/{{BrickChangeName.snakeCase()}}_exports.dart';

List<BlocProvider> get{{BrickChangeName.pascalCase()}}BlocProviders() {
  return [
    BlocProvider< {{BrickChangeName.pascalCase()}}Bloc>(
      create: (_) => GetIt.instance< {{BrickChangeName.pascalCase()}}Bloc>(),
    ),
  ];
}
