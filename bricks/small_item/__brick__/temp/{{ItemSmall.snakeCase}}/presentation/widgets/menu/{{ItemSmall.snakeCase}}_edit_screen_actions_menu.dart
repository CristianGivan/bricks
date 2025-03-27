import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagEditScreenActionsMenu {
  static List<PopupMenuEntry> getMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        child: Text('Save Tag'),
        onTap: () => context.pop(),
      )
    ];
  }
}
