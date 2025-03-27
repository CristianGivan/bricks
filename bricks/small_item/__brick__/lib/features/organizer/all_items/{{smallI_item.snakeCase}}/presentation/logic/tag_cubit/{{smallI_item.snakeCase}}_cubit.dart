import 'package:fo_fe/core/error/failures_map_to_message.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';
import 'package:fo_fe/features/organizer/domain/usecases/get_entities_from_user_use_case.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagCubit extends OrganizerCubit<TagEntity> {
  final GetEntitiesFromUserUseCase getEntitiesFromUserUseCase;

  TagCubit({
    required this.getEntitiesFromUserUseCase,
  });

  @override
  Future<void> getAllEntitiesFromUser(int userId) async {
    emit(OrganizerCubitState.loading());

    // Constructing parameters for the use case
    TagParams tagParams = TagParams(id: 0, forUserId: userId);

    final result = await getEntitiesFromUserUseCase(tagParams);
    result.fold(
      (failure) => emit(OrganizerCubitState.error(mapTagFailureToMessage(failure))),
      (entities) {
        if (entities is OrganizerItems<TagEntity>) {
          emit(OrganizerCubitState.loaded(entities));
        } else {
          emit(OrganizerCubitState.error("Unexpected type for entities"));
        }
      },
    );
  }
}
