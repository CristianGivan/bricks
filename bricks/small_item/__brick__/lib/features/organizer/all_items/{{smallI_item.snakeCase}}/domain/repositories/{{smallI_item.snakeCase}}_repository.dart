import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/update_link_ids_params.dart';

abstract class TagRepository {
  // Tag CRUD operations
  Future<Either<Failure, TagEntity>> addTag(TagEntity tag);

  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagEntitiesFromUser(int userId);

  Future<Either<Failure, OrganizerItems<TagDto>>> getTagItemsFromUser(int userId);

  Future<Either<Failure, TagEntity>> updateTag(TagEntity tag);

  Future<Either<Failure, int>> deleteTag(int tagId);

  Future<Either<Failure, IdSet>> deleteTagItems(IdSet tagIds);

  // User operations related to tags
  Future<Either<Failure, TagUserLinkEntity>> addTagUserLink(TagUserLinkEntity tagUserEntity);

  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByTagId(int tagId);

  Future<Either<Failure, TagUserLinkEntity>> updateTagUserLink(TagUserLinkEntity tag);

  Future<Either<Failure, OrganizerItems<UserEntity>>> updateTagUserLinks(ItemLinkIdsParams params);
}
