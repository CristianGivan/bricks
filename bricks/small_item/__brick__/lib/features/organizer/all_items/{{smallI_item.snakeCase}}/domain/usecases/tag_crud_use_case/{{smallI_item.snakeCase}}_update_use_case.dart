import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';

class TagUpdateUseCase extends UseCase<TagDto, TagParams> {
  final TagRepository repository;

  TagUpdateUseCase(this.repository);

  @override
  Future<Either<Failure, TagDto>> call(TagParams params) async {
    if (params.tagDto.tag.isEmpty) {
      return Left(TagFailure("Tag is empty"));
    }

    final updateResults = await _performUpdates(params);

    return _processUpdateResults(updateResults, params.tagDto);
  }

  Future<List<Either<Failure, Equatable>>> _performUpdates(TagParams params) {
    return Future.wait([
      if (!params.tagEntity.isEmpty) repository.updateTag(params.tagEntity),
      if (!params.tagUserLinkEntity.isEmpty) repository.updateTagUserLink(params.tagUserLinkEntity),
    ]);
  }

  Either<Failure, TagDto> _processUpdateResults(
      List<Either<Failure, Equatable>> updateResults, TagDto tagDto) {
    TagDto updatedTagDto = tagDto;
    List<Failure> failures = [];

    for (final updateResult in updateResults) {
      updateResult.fold(
        (failure) => failures.add(failure),
        (updatedEntity) {
          if (updatedEntity is TagEntity) {
            updatedTagDto = updatedTagDto.copyWith(tag: updatedEntity);
          } else if (updatedEntity is TagUserLinkEntity) {
            updatedTagDto = updatedTagDto.copyWith(tagUserLink: updatedEntity);
          }
        },
      );
    }

    if (failures.isNotEmpty) {
      return Left(CombinedFailure(failures));
    }

    return Right(updatedTagDto);
  }
}
