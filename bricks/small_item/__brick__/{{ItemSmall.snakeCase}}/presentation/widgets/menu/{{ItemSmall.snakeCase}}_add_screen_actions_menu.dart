import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_cubit/tag_form_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/item_add_params.dart';

class TagAddScreenActionsMenu {
  static List<PopupMenuEntry> getMenuItems(BuildContext context, int userId) {
    return [
      PopupMenuItem(
        child: const Text('Save Tag'),
        onTap: () => onTap(context, userId),
      ),
      PopupMenuItem(
        child: const Text('Not Save'),
        onTap: () => context.pop(),
      ),
    ];
  }

  static void onTap(BuildContext context, int userId) {
    final tagFormCubit = context.read<TagFormCubit>();
    final tagFormState = tagFormCubit.state;

    final tag = TagEntity(
      id: 0,
      subject: tagFormState.subject,
      createdDate: DateTime.now(),
      creatorId: userId,
    );

    final AddItemParams addItemParams = AddItemParams(
      item: tag,
    );

    BlocProvider.of<TagBloc>(context).add(AddItemBlocEvent(addItemParams));
    context.pop();
  }
}
