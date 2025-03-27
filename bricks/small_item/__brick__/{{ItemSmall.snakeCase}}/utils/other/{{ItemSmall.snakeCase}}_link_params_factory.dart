import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/items_link_params/tag_user_link_params.dart';

typedef CreateTagLinkParams = ItemLinkParams Function(int id, int forUserId);

class TagLinkParamsFactory {
  static ItemLinkParams create<T extends ItemEntity>({required int id, required int forUserId}) {
    final createTagLinkParams = typeToParams[T];

    if (createTagLinkParams == null) {
      throw UnsupportedError('Unsupported type: $T');
    } else {
      return createTagLinkParams(id, forUserId);
    }
  }

  static final Map<Type, CreateTagLinkParams> typeToParams = {
    UserEntity: createUserLinkParams,
  };

  static TagUserLinkParams createUserLinkParams(int id, int forUserId) {
    return TagUserLinkParams(id: id, forUserId: forUserId);
  }
}
