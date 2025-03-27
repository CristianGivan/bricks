import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

abstract class TagLocalDataSource {
  Future<TagTableDriftG?> addTag(TagTableDriftCompanion tagCompanion);

  Future<TagTableDriftG?> getTagById(int id);

  Future<List<QueryRow>?> getTagItemsFromUser(int userId);

  Future<TagTableDriftG?> updateTag(TagTableDriftCompanion tagCompanion);

  Future<int?> deleteTag(int tagIds);

  Future<List<int>?> deleteTagItems(List<int> tagIds);

  // User operations related to tags

  Future<TagUserLinkTableDriftG?> addTagUserLink(
      TagUserLinkTableDriftCompanion tagUserLinkCompanion);

  Future<List<UserTableDriftG?>?> getUserItemsByTagId(int tagId);

  Future<TagUserLinkTableDriftG?> updateTagUserLink(
      TagUserLinkTableDriftCompanion tagUserLinkCompanion);

  Future<void> addUserItemsToTag(int tagId, List<int> userIds);

  Future<void> deleteUserItemsFromTag(int tagId, List<int> userIds);
}
