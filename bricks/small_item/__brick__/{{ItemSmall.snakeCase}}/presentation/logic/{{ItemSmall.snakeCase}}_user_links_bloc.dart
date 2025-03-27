import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/tag_link_use_case/tag_get_links_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/tag_link_use_case/tag_update_links_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

class TagUserLinksBloc extends OrganizerLinkBloc<UserEntity> {
  TagUserLinksBloc()
      : super(
          getItemsLinked: GetIt.instance<TagGetLinksUseCase<UserEntity>>(),
          updateItemsLinked: GetIt.instance<UpdateTagLinkUseCase<UserEntity>>(),
        ) {
    setupEventHandlers();
  }
}
