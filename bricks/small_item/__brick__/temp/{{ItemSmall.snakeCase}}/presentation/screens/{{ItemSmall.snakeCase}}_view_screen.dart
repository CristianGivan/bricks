import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/widgets/menu/tag_edit_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_strings.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagViewScreen extends StatelessWidget {
  final int tagId;

  const TagViewScreen({super.key, required this.tagId});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TagStrings().screenViewTitle,
      body: _buildStateWidget(),
      menuOptions: (context, userId) => TagEditScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: (String query) {},
    );
  }

  _buildStateWidget() {
    return BlocBuilder<TagBloc, OrganizerBlocState>(
      builder: (context, state) {
        switch (state.status) {
          case OrganizerBlocStatus.loading:
            return _buildLoadingState();
          case OrganizerBlocStatus.loaded:
            return _buildTagView(context, state);
          case OrganizerBlocStatus.error:
            return _buildErrorState(state.errorMessage);
          default:
            return _noStateAvailable();
        }
      },
    );
  }

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _noStateAvailable() => Center(child: Text(TagStrings().noItemsAvailable));

  Widget _buildTagView(BuildContext context, OrganizerBlocState state) {
    final tag = (state.displayedItems?.getById(tagId) as TagDto).tag;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Subject: ${tag.subject}', style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
