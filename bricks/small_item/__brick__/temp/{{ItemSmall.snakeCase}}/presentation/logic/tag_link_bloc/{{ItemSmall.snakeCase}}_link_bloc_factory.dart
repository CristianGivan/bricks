import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_user_links_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagLinksBlocFactory {
  static OrganizerLinkBloc<T> createFor<T extends ItemEntity>() {
    if (T == UserEntity) {
      return TagUserLinksBloc() as OrganizerLinkBloc<T>;
    } else {
      throw UnsupportedError('Unsupported type: $T');
    }
  }
}
