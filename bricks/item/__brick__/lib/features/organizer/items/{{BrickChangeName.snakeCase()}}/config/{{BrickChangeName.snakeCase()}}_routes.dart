

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
      name:  {{BrickChangeName.PascalCase()}}RouterNames. {{BrickChangeName.camelCase()}}Route,
      path: '/ {{BrickChangeName.snakeCase()}}',
      pageBuilder: (context, state) => const NoTransitionPage(
        child:  {{BrickChangeName.PascalCase()}}Screen(),
      ),
      routes: [
        GoRoute(
          name:  {{BrickChangeName.PascalCase()}}RouterNames. {{BrickChangeName.camelCase()}}AddRoute,
          path: ' {{BrickChangeName.snakeCase()}}_add',
          pageBuilder: (context, state) {
            // Accessing 'userId' from state.pathParameters
            return const NoTransitionPage(
              child:  {{BrickChangeName.PascalCase()}}AddScreen(),
            );
          },
        ),
      ],
    );
  }
}
