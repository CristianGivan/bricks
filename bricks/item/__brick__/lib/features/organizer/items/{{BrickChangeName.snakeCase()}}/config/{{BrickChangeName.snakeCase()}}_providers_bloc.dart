import 'package:fo_fe/features/organizer/items/{{BrickChangeName.snakeCase()}}/domain/entities/{{BrickChangeName.snakeCase()}}_entity.dart';

List<BlocProvider> get{{BrickChangeName.pascalCase()}}BlocProviders() {
  return [
    BlocProvider< {{BrickChangeName.pascalCase()}}Bloc>(
      create: (_) => GetIt.instance< {{BrickChangeName.pascalCase()}}Bloc>(),
    ),
  ];
}
