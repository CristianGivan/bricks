import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/presentation/pages/user_management_actions_page.dart';
import 'package:fo_fe/features/organizer/presentation/widgets/menu/item_screen_menu_factory.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagScreenActionsMenu extends ItemScreenActionMenuProvider {
  @override
  List<PopupMenuEntry> getMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        child: Text('Add Tag'),
        onTap: () => context.pushNamed(TagRouterNames.tagAddRouteName),
      ),
      PopupMenuItem(
        child: Text('Delete Tag'),
        onTap: () => context.pushNamed(TagRouterNames.tagDeleteRouteName),
      ),
      PopupMenuItem(
        child: Text('Filter Tasks'),
        onTap: () => showFilterDialog(context),
      ),
      PopupMenuItem(
        child: Text('Sort Tasks'),
        onTap: () => showSortDialog(context),
      ),
      PopupMenuItem(
        child: Text('Export Tags'),
        onTap: () => {
          context.pushNamed(TagRouterNames.tagExportRouteName),
          context.pop(),
        },
      ),
    ];
  }
}
