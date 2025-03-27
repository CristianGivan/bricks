import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagDeleteUseCase extends UseCase<IdSet, IdSet> {
  final TagRepository repository;

  TagDeleteUseCase(this.repository);

  @override
  Future<Either<Failure, IdSet>> call(IdSet params) {
    return repository.deleteTagItems(params);
  }
}
