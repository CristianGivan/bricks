import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/screens/tag_add_screen.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/screens/tag_update_screen.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/presentation/screens/item_delete_screen.dart';
import 'package:fo_fe/features/organizer/presentation/screens/item_export_screen.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../presentation/screens/tag_view_screen.dart';

class TagRoutes {
  static GoRoute routes() {
    return GoRoute(
      path: TagRouterNames.tagRoutePath,
      name: TagRouterNames.tagRouteName,
      pageBuilder: (context, state) {
        return MaterialPage(child: ItemScreen<TagDto>());
      },
      routes: [
        GoRoute(
          path: TagRouterNames.tagAddRoutePath,
          name: TagRouterNames.tagAddRouteName,
          pageBuilder: (context, state) {
            final ItemLinkParams itemLinkParams = state.extra as ItemLinkParams? ?? NoLinkParams();
            return MaterialPage(child: TagAddScreen(itemLinkParams));
          },
        ),
        GoRoute(
          path: TagRouterNames.tagViewRoutePath,
          name: TagRouterNames.tagViewRouteName,
          pageBuilder: (context, state) {
            final tagId = state.extra as int;
            return MaterialPage(child: TagViewScreen(tagId: tagId));
          },
        ),
        GoRoute(
          path: TagRouterNames.tagUpdateRoutePath,
          name: TagRouterNames.tagUpdateRouteName,
          pageBuilder: (context, state) {
            final tagId = state.extra as int;
            return MaterialPage(child: TagUpdateScreen(tagId: tagId));
          },
        ),
        GoRoute(
          path: TagRouterNames.tagDeleteRoutePath,
          name: TagRouterNames.tagDeleteRouteName,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: ItemDeleteScreen<TagDto>());
          },
        ),
        GoRoute(
          path: TagRouterNames.tagExportRoutePath,
          name: TagRouterNames.tagExportRouteName,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: ItemExportScreen<TagDto>());
          },
        ),
      ],
    );
  }
}
