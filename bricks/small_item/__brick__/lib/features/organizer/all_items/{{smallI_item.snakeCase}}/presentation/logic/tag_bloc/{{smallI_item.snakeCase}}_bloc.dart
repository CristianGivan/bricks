import 'dart:async';

import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/tag_crud_use_case/tag_add_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/tag_crud_use_case/tag_get_items_from_user_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

part 'tag_bloc_event.dart';
part 'tag_bloc_state.dart';

class TagBloc extends OrganizerBloc<TagDto> {
  final TagUpdateUseCase updateTagUseCase;

  TagBloc(
    this.updateTagUseCase,
  ) : super(
          addItem: GetIt.instance.get<TagAddUseCase>().call,
          getItems: GetIt.instance.get<TagGetItemsFromUserUseCase>().call,
          deleteItems: GetIt.instance.get<TagDeleteUseCase>().call,
        ) {
    setupEventHandlers();
    on<UpdateTagBlocEvent<TagParams>>(_onUpdateTag);
  }

  Future<void> _onUpdateTag(
      UpdateTagBlocEvent<TagParams> event, Emitter<OrganizerBlocState<TagDto>> emit) async {
    await handleEvent(
      emit: emit,
      action: () => updateTagUseCase(event.params),
      originalItems: (updatedTag) => state.originalItems.copyWithUpdatedItem(updatedTag),
      displayedItems: (updatedTag) => state.displayedItems.copyWithUpdatedItem(updatedTag),
    );
  }
}
