import 'package:fo_fe/features/organizer/items/{{BrickChangeName.snakeCase()}}/domain/entities/{{BrickChangeName.snakeCase()}}_entity.dart';

class {{BrickChangeName.pascalCase()}}LocalDataSourceDrift implements {{BrickChangeName.pascalCase()}}LocalDataSource {
  final OrganizerDriftDB db;

{{BrickChangeName.pascalCase()}}LocalDataSourceDrift({
    required this.db,
  });

  }


