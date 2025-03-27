// lib/features/organizer/items/tag/presentation/screen/tag_add_screen.dart
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_cubit/tag_form_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/item_add_params.dart';

class TagAddForm extends StatelessWidget {
  final int userId;
  final ItemLinkParams itemLinkParams;

  const TagAddForm({super.key, required this.userId, required this.itemLinkParams});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagFormCubit, TagFormState>(
      builder: (context, state) {
        return Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tag Name'),
                initialValue: state.subject,
                onChanged: (value) => context.read<TagFormCubit>().updateSubject(value),
                validator: validateTagName,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _saveTag(context),
                child: const Text('Save Tag'),
              ),
            ],
          ),
        );
      },
    );
  }

  String? validateTagName(value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter a tag name';
    }
    return null;
  }

  void _saveTag(BuildContext context) {
    final formState = context.read<TagFormCubit>().state;
    final tag = _createTagFromFormState(formState);
    final addItemParams = _createAddItemParams(tag);

    BlocProvider.of<OrganizerBloc<TagDto>>(context).add(AddItemBlocEvent(addItemParams));

    context.read<OrganizerCubit<TagEntity>>().getAllEntitiesFromUser(userId);
    context.pop();
  }

  AddItemParams _createAddItemParams(TagEntity tag) => AddItemParams(
        item: tag,
        itemLinkParams: itemLinkParams,
      );

  TagEntity _createTagFromFormState(TagFormState formState) {
    return TagEntity(
      id: 0,
      subject: formState.subject,
      createdDate: DateTime.now(),
      creatorId: userId,
    );
  }
}
