import 'package:fo_fe/features/organizer/domain/entities/user_link_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagUserLinkEntity extends UserLinkEntity {
  final int tagId;
  final int userId;
  final DateTime linkingDate;
  final bool isSelectedByUser;
  final int orderedByUser;

  TagUserLinkEntity({
    int? id,
    int? tagId,
    int? userId,
    DateTime? linkingDate,
    bool? selectedByUser,
    int? orderedByUser,
  })  : tagId = tagId ?? 0,
        userId = userId ?? 0,
        linkingDate = linkingDate ?? INITIAL_EPOCH_DATE,
        isSelectedByUser = selectedByUser ?? false,
        orderedByUser = orderedByUser ?? 0,
        super(id: id ?? 0, remoteId: 0, isSelected: selectedByUser ?? false);

  static final TagUserLinkEntity _emptyInstance = TagUserLinkEntity();

  factory TagUserLinkEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => identical(this, _emptyInstance);

  @override
  List<Object?> get props => [
        id,
        linkingDate,
        tagId,
        userId,
        isSelectedByUser,
        orderedByUser,
      ];

  TagUserLinkEntity copyWith({
    int? id,
    DateTime? linkingDate,
    int? tagId,
    int? userId,
    bool? isSelectedByUser,
    int? orderedByUser,
  }) {
    return TagUserLinkEntity(
      id: id ?? this.id,
      linkingDate: linkingDate ?? this.linkingDate,
      tagId: tagId ?? this.tagId,
      userId: userId ?? this.userId,
      selectedByUser: isSelectedByUser ?? this.isSelectedByUser,
      orderedByUser: orderedByUser ?? this.orderedByUser,
    );
  }
}
