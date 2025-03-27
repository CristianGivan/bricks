import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagDeleteScreenActionsMenu {
  static List<PopupMenuEntry> getMenuItems(BuildContext context, IdSet selectedIds) {
    return [
      PopupMenuItem(
        child: Text('Delete Tags'),
        onTap: () => DialogManager.confirmAndDelete<TagDto>(context, selectedIds),
      )
    ];
  }
}
