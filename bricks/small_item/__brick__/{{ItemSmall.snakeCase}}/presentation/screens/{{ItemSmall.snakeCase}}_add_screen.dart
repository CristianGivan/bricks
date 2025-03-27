import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/widgets/menu/tag_add_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagAddScreen extends StatelessWidget {
  final ItemLinkParams itemLinkParams;

  const TagAddScreen(
    this.itemLinkParams, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: "AddTag",
      body: (userId) => TagAddForm(userId: userId, itemLinkParams: itemLinkParams),
      menuOptions: (context, userId) => TagAddScreenActionsMenu.getMenuItems(context, userId),
      onSearchSubmitted: (String query) {},
    );
  }
}
