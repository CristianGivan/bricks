import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_link_bloc/tag_link_bloc_factory.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/widgets/menu/tag_edit_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_link_params_factory.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_strings.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_link/item_link_entities_view_page.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagUpdateScreen extends StatelessWidget {
  final int tagId;

  const TagUpdateScreen({super.key, required this.tagId});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TagStrings().screenEditTitle,
      body: (userId) => _buildEditPage(userId),
      menuOptions: (context, userId) => TagEditScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: (String query) {},
    );
  }

  Widget _buildEditPage(int userId) {
    return Column(
      children: [
        _buildTagIdField(),
        _buildUserEntityBlocProvider(userId),
      ],
    );
  }

  Widget _buildTagIdField() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Tag ID: '),
      controller: TextEditingController(text: tagId.toString()),
    );
  }

  Widget _buildUserEntityBlocProvider(int userId) {
    return BlocProvider(
      create: (context) => TagLinksBlocFactory.createFor<UserEntity>(),
      child: _buildLinkEntityBlocProvider<UserEntity>(userId),
    );
  }

  Widget _buildLinkEntityBlocProvider<T extends ItemEntity>(int userId) {
    final params = TagLinkParamsFactory.create<T>(id: tagId, forUserId: userId);
    return ItemLinkEntitiesViewPage<T>(params: params);
  }
}
