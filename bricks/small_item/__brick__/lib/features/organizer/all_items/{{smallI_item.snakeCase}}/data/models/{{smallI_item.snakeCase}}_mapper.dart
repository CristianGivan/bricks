import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/data/models/tag_user_link_mapper.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagMapper {
  static TagEntity entityFromTableDrift(TagTableDriftG tableDrift) {
    return TagEntity(
      id: tableDrift.id,
      subject: tableDrift.subject,
      createdDate: tableDrift.createdDate,
      creatorId: tableDrift.creatorId,
      remoteId: tableDrift.remoteId,
      lastUpdate: tableDrift.lastUpdate,
      lastViewedDate: tableDrift.lastViewedDate,
      remoteViews: tableDrift.remoteViews,
      views: tableDrift.views,
      checksum: tableDrift.checksum,
    );
  }

  static OrganizerItems<TagEntity> entityItemsFromTableDriftItems(List<TagTableDriftG> items) {
    return OrganizerItems.of(items.map(entityFromTableDrift).toList());
  }

  static TagTableDriftCompanion tableDriftCompanionFromEntity(TagEntity entity) {
    return TagTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      subject: Value(entity.subject),
      createdDate: Value(entity.createdDate),
      creatorId: Value(entity.creatorId),
      remoteId: Value(entity.remoteId),
      lastUpdate: Value(entity.lastUpdate),
      lastViewedDate: Value(entity.lastViewedDate),
      remoteViews: Value(entity.remoteViews),
      views: Value(entity.views),
      checksum: Value(entity.checksum),
    );
  }

  static OrganizerItems<TagDto> itemsFromRows(List<QueryRow> rows) {
    final items = rows.map((row) {
      return TagDto(
        tag: tagEntityFromRow(row),
        tagUserLink: TagUserLinkMapper.tagUserEntityFromRow(row),
      );
    }).toList();
    return OrganizerItems.of(items);
  }

  static OrganizerItems<TagEntity> entitiesFromRows(List<QueryRow> rows) {
    final items = rows.map(tagEntityFromRow).toList();
    return OrganizerItems.of(items);
  }

  static TagEntity tagEntityFromRow(QueryRow row) {
    return TagEntity(
      id: row.read<int>('tag_id'),
      subject: row.read<String>('subject'),
      createdDate: row.read<DateTime>('created_date'),
      creatorId: row.read<int>('creator_id'),
      remoteId: row.read<int>('remote_id'),
      lastUpdate: row.read<DateTime>('last_update'),
      lastViewedDate: row.read<DateTime>('last_viewed_date'),
      remoteViews: row.read<int>('remote_views'),
      views: row.read<int>('views'),
      checksum: row.read<String>('checksum'),
    );
  }
}
