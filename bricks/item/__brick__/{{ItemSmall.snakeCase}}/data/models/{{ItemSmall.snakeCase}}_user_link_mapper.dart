import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';

class TagUserLinkMapper {
  static TagUserLinkEntity entityFromTableDrift(TagUserLinkTableDriftG tableDrift) {
    return TagUserLinkEntity(
      id: tableDrift.id,
      linkingDate: tableDrift.linkingDate,
      tagId: tableDrift.tagId,
      userId: tableDrift.userId,
      selectedByUser: tableDrift.selectedByUser ?? false,
      orderedByUser: tableDrift.orderedByUser ?? 0,
    );
  }

  static TagUserLinkTableDriftCompanion companionFomEntity(TagUserLinkEntity tagUserLinkEntity) {
    return TagUserLinkTableDriftCompanion(
      id: tagUserLinkEntity.id == 0 ? const Value.absent() : Value(tagUserLinkEntity.id),
      linkingDate: Value(tagUserLinkEntity.linkingDate ?? DateTime.now()),
      tagId: Value(tagUserLinkEntity.tagId ?? 0),
      userId: Value(tagUserLinkEntity.userId ?? 0),
      selectedByUser: Value(tagUserLinkEntity.isSelectedByUser ?? false),
      orderedByUser: Value(tagUserLinkEntity.orderedByUser ?? 0),
    );
  }

  static TagUserLinkEntity tagUserEntityFromRow(QueryRow row) {
    return TagUserLinkEntity(
      id: row.read<int>('id'),
      linkingDate: row.read<DateTime>('linking_date'),
      tagId: row.read<int>('tag_id'),
      userId: row.read<int>('user_id'),
      selectedByUser: row.read<bool>('selected_by_user'),
      orderedByUser: row.read<int>('ordered_by_user'),
    );
  }
}
