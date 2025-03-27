import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/update_link_ids_params.dart';

typedef TagUpdateLink<T extends ItemEntity> = Future<Either<Failure, OrganizerItems<T>>> Function(
    ItemLinkIdsParams params);

class UpdateTagLinkUseCase<T extends ItemEntity>
    extends UseCase<OrganizerItems<T>, ItemLinkIdsParams> {
  final TagRepository repository;

  UpdateTagLinkUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemLinkIdsParams params) {
    final updateTagLink = _typeToTagLink[T];

    if (updateTagLink == null) {
      return Future.value(
          Left(UnImplementedFailure("UpdateTagLinkUseCase: No implementation for type $T")));
    }

    return updateTagLink(params).then(
      (result) => result.map((items) => items as OrganizerItems<T>),
    );
  }

  Map<Type, TagUpdateLink> get _typeToTagLink => {
        UserEntity: (params) => repository.updateTagUserLinks(params),
      };
}
