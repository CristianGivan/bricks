import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_route_names.dart';
import 'package:go_router/go_router.dart';

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
      name: TaskRouterNames.taskRoute,
      path: '/task',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: TaskScreen(),
      ),
      routes: [
        GoRoute(
          name: TaskRouterNames.taskAddRoute,
          path: 'task_add',
          pageBuilder: (context, state) {
            // Accessing 'userId' from state.pathParameters
            return const NoTransitionPage(
              child: TaskAddScreen(),
            );
          },
        ),
      ],
    );
  }
}
