import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

typedef GetTagLink<T extends ItemEntity> = Future<Either<Failure, OrganizerItems<T>>> Function(
    ItemLinkParams params);

class TagGetLinksUseCase<T extends ItemEntity> extends UseCase<OrganizerItems<T>, ItemLinkParams> {
  final TagRepository repository;

  TagGetLinksUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemLinkParams params) {
    final getTagLink = _typeToGetTagLinkMap[T];

    if (getTagLink == null) {
      return Future.value(Left(UnexpectedFailure("No handler found for type $T")));
    }

    return getTagLink(params).then((result) => result.map((items) => items as OrganizerItems<T>));
  }

  Map<Type, GetTagLink<ItemEntity>> get _typeToGetTagLinkMap => {
        UserEntity: (params) => repository.getUserItemsByTagId(params.itemId),
      };
}
