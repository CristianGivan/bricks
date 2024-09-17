import 'package:fo_fe/features/organizer/items/{{BrickChangeName.snakeCase()}}/domain/entities/{{BrickChangeName.snakeCase()}}_entity.dart';

class TaskAppBranch {
  static StatefulShellBranch branch(GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        route(),
      ],
    );
  }

  static GoRoute route() {
    return GoRoute(
      name:  {{BrickChangeName.pascalCase()}}RouterNames. {{BrickChangeName.camelCase()}}Route,
      path: '/ {{BrickChangeName.snakeCase()}}',
      pageBuilder: (context, state) => const NoTransitionPage(
        child:  {{BrickChangeName.pascalCase()}}Screen(),
      ),
      routes: [
        GoRoute(
          name:  {{BrickChangeName.pascalCase()}}RouterNames. {{BrickChangeName.camelCase()}}AddRoute,
          path: ' {{BrickChangeName.snakeCase()}}_add',
          pageBuilder: (context, state) {
            // Accessing 'userId' from state.pathParameters
            return const NoTransitionPage(
              child:  {{BrickChangeName.pascalCase()}}AddScreen(),
            );
          },
        ),
      ],
    );
  }
}
