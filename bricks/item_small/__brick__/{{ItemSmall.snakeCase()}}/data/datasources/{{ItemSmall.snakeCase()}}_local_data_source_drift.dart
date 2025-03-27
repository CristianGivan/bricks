import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';

class TagLocalDataSourceDrift implements TagLocalDataSource {
  final OrganizerDriftDB db;

  TagLocalDataSourceDrift({required this.db});

  @override
  Future<TagTableDriftG?> addTag(TagTableDriftCompanion tagCompanion) {
    return db.transaction(() async {
      final id = await db.tagDaoDrift.addTag(tagCompanion);
      return getTagById(id);
    });
  }

  @override
  Future<TagTableDriftG?> getTagById(int id) => db.tagDaoDrift.getTagById(id);

  @override
  Future<List<QueryRow>?> getTagItemsFromUser(int userId) =>
      db.tagDaoDrift.getTagItemsFromUser(userId);

  @override
  Future<TagTableDriftG?> updateTag(TagTableDriftCompanion tagCompanion) async {
    return db.transaction(() async {
      final isUpdate = await db.tagDaoDrift.updateTag(tagCompanion);
      return isUpdate ? getTagById(tagCompanion.id.value) : Future.value(null);
    });
  }

  Future<int> deleteTag(int tagIds) {
    return db.transaction(() => db.tagDaoDrift.deleteTag(tagIds));
  }

  @override
  Future<List<int>?> deleteTagItems(List<int> tagIds) async {
    if (tagIds.isEmpty) return [];

    return db.transaction(() async {
      await db.tagUserLinkDaoDrift.deleteTagUsersByTagIds(tagIds);
      await db.tagDaoDrift.deleteTagsByIds(tagIds);
      return tagIds;
    });
  }

  @override
  Future<TagUserLinkTableDriftG?> addTagUserLink(TagUserLinkTableDriftCompanion companion) async {
    return db.transaction(() async {
      final tagUserLinkId = await db.tagUserLinkDaoDrift.addTagUser(companion);
      return await _getTagUserLinkById(tagUserLinkId);
    });
  }

  @override
  Future<List<UserTableDriftG?>?> getUserItemsByTagId(int tagId) {
    return db.transaction(() async {
      final userIds = await db.tagUserLinkDaoDrift.getUserIdsByTagId(tagId);
      return await db.userDaoDrift.getUserEntitiesByIdSet(userIds);
    });
  }

  @override
  Future<TagUserLinkTableDriftG?> updateTagUserLink(
      TagUserLinkTableDriftCompanion companion) async {
    return db.transaction(() async {
      await db.tagUserLinkDaoDrift.updateTagUserLink(companion);
      return await _getTagUserLinkById(companion.id.value);
    });
  }

  @override
  Future<void> addUserItemsToTag(int tagId, List<int> userItems) async {
    if (userItems.isEmpty) return;
    final companions =
        userItems.map((userId) => _createSelectedTagUserCompanion(tagId, userId)).toList();
    await db.tagUserLinkDaoDrift.addTagUsersBatch(companions);
  }

  @override
  Future<void> deleteUserItemsFromTag(int tagId, List<int> userItems) async {
    if (userItems.isEmpty) return;
    await db.tagUserLinkDaoDrift.deleteTagUsersBatch(tagId, userItems);
  }

  Future<TagUserLinkTableDriftG?> _getTagUserLinkById(int tagUserLinkId) =>
      db.tagUserLinkDaoDrift.getTagUserById(tagUserLinkId);

  TagUserLinkTableDriftCompanion _createSelectedTagUserCompanion(int tagId, int userId) {
    return TagUserLinkTableDriftCompanion(
      id: Value.absent(),
      tagId: Value(tagId),
      userId: Value(userId),
      linkingDate: Value(DateTime.now()),
    );
  }
}
