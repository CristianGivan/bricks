import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/tag/data/models/tag_user_link_mapper.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/OrganizerDatabaseHelper/OrganizerDatabaseHelper.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/update_link_ids_params.dart';

class TagRepositoryDrift implements TagRepository {
  final TagLocalDataSource localDataSource;
  final OrganizerDatabaseHelper dbHelper;

  TagRepositoryDrift({required this.localDataSource}) : dbHelper = OrganizerDatabaseHelper();

  @override
  Future<Either<Failure, TagEntity>> addTag(TagEntity tag) {
    return dbHelper.execute(
      () => localDataSource.addTag(TagMapper.tableDriftCompanionFromEntity(tag)),
      TagMapper.entityFromTableDrift,
      const TagFailure("Tag not added"),
    );
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagEntitiesFromUser(int forUserId) {
    return dbHelper.handleDatabaseOperation(() async {
      return TagMapper.entitiesFromRows(await localDataSource.getTagItemsFromUser(forUserId) ?? []);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TagDto>>> getTagItemsFromUser(int forUserId) {
    return dbHelper.handleDatabaseOperation(() async {
      return TagMapper.itemsFromRows(await localDataSource.getTagItemsFromUser(forUserId) ?? []);
    });
  }

  @override
  Future<Either<Failure, TagEntity>> updateTag(TagEntity tag) {
    return dbHelper.execute(
      () => localDataSource.updateTag(TagMapper.tableDriftCompanionFromEntity(tag)),
      TagMapper.entityFromTableDrift,
      const TagFailure("Tag not updated"),
    );
  }

  @override
  Future<Either<Failure, int>> deleteTag(int tagId) {
    return dbHelper.handleDatabaseOperation(() async => dbHelper.ensureNotNull(
        await localDataSource.deleteTag(tagId), const TagFailure("Tag not deleted")));
  }

  @override
  Future<Either<Failure, IdSet>> deleteTagItems(IdSet tagIds) {
    return dbHelper.handleDatabaseOperation(() async {
      final deletedItemsIds = await localDataSource.deleteTagItems(tagIds.toList());
      return IdSet.of(deletedItemsIds!);
    });
  }

  @override
  Future<Either<Failure, TagUserLinkEntity>> addTagUserLink(TagUserLinkEntity tagUserEntity) {
    return dbHelper.execute(
      () => localDataSource.addTagUserLink(TagUserLinkMapper.companionFomEntity(tagUserEntity)),
      TagUserLinkMapper.entityFromTableDrift,
      const TagFailure("TagUserLink not added"),
    );
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByTagId(int tagId) {
    return dbHelper.handleDatabaseOperation(() async {
      return dbHelper.getFilterNonNullItems(
        await localDataSource.getUserItemsByTagId(tagId),
        UserMapper.entityItemsFromTableDriftItems,
      );
    });
  }

  @override
  Future<Either<Failure, TagUserLinkEntity>> updateTagUserLink(TagUserLinkEntity tagUserEntity) {
    return dbHelper.execute(
      () => localDataSource.updateTagUserLink(TagUserLinkMapper.companionFomEntity(tagUserEntity)),
      TagUserLinkMapper.entityFromTableDrift,
      const TagFailure("TagUserLink not updated"),
    );
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> updateTagUserLinks(ItemLinkIdsParams params) {
    return dbHelper.handleDatabaseOperation(() async {
      final tagId = params.itemId;
      if (params.addedItems.isNotEmpty) {
        await localDataSource.addUserItemsToTag(tagId, params.addedItems.toList());
      }
      if (params.removedItems.isNotEmpty) {
        await localDataSource.deleteUserItemsFromTag(tagId, params.removedItems.toList());
      }
      return dbHelper.getFilterNonNullItems(
        await localDataSource.getUserItemsByTagId(tagId),
        UserMapper.entityItemsFromTableDriftItems,
      );
    });
  }
}
