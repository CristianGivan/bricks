import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/item_add_params.dart';

class TagAddUseCase extends UseCase<TagDto, AddItemParams> {
  final TagRepository repository;

  TagAddUseCase(this.repository);

  @override
  Future<Either<Failure, TagDto>> call(AddItemParams params) async {
    final failureOrTag = await repository.addTag(params.item as TagEntity);

    return failureOrTag.fold(
      Left.new,
      (tag) => _addTagUserLinkAndReturnTagDto(tag, params.itemLinkParams),
    );
  }

  Future<Either<Failure, TagDto>> _addTagUserLinkAndReturnTagDto(
      TagEntity tag, ItemLinkParams? itemLinkParams) async {
    final tagUserLink = TagUserLinkEntity(
      tagId: tag.id,
      userId: tag.creatorId,
      linkingDate: DateTime.now(),
    );

    final failureOrTagUserLink = await repository.addTagUserLink(tagUserLink);

    return failureOrTagUserLink.fold(
      (failure) => _handleTagUserLinkFailure(tag, failure),
      (tagUserLink) => Right(TagDto(tag: tag, tagUserLink: tagUserLink)),
    );
  }

  Future<Either<Failure, TagDto>> _handleTagUserLinkFailure(TagEntity tag, Failure failure) async {
    final failureOrDelete = await repository.deleteTag(tag.id);
    return failureOrDelete.fold(
      (deleteFailure) => Left(CombinedFailure([failure, deleteFailure])),
      (_) => Left(failure),
    );
  }
}
