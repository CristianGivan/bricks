import 'package:fo_fe/features/organizer/items/{{BrickChangeName.snakeCase()}}/domain/entities/{{BrickChangeName.snakeCase()}}_entity.dart';

class {{BrickChangeName.pascalCase()}}RepositoryDrift implements {{BrickChangeName.pascalCase()}}Repository {
  final {{BrickChangeName.pascalCase()}}LocalDataSourceDrift localDataSource;

  {{BrickChangeName.pascalCase()}}RepositoryDrift({required this.localDataSource});

}
