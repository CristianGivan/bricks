import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagEntity extends OrganizerItemEntity {
  final String subject;
  final int id;
  final int creatorId;
  final int remoteId;
  final DateTime createdDate;
  final DateTime lastUpdate;
  final DateTime lastViewedDate;
  final int remoteViews;
  final int views;
  final String checksum;

  TagEntity({
    String? subject,
    int? id,
    int? creatorId,
    int? remoteId,
    DateTime? createdDate,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
    int? remoteViews,
    int? views,
    String? checksum,
  })  : subject = subject ?? '',
        id = id ?? 0,
        creatorId = creatorId ?? 0,
        remoteId = remoteId ?? 0,
        createdDate = createdDate ?? INITIAL_EPOCH_DATE,
        lastUpdate = lastUpdate ?? INITIAL_EPOCH_DATE,
        lastViewedDate = lastViewedDate ?? INITIAL_EPOCH_DATE,
        remoteViews = remoteViews ?? 0,
        views = views ?? 0,
        checksum = checksum ?? '',
        super(
          id: id ?? 0,
          remoteId: remoteId ?? 0,
          creatorId: creatorId ?? 0,
          subject: subject ?? '',
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
          lastUpdate: lastUpdate ?? INITIAL_EPOCH_DATE,
          lastViewedDate: lastViewedDate ?? INITIAL_EPOCH_DATE,
          remoteViews: remoteViews ?? 0,
          views: views ?? 0,
          checksum: checksum ?? '',
        );

  static final TagEntity _emptyInstance = TagEntity();

  factory TagEntity.empty() => _emptyInstance;

  @override
  get emptyInstance => _emptyInstance;

  @override
  bool get isEmpty => identical(this, _emptyInstance);

  TagEntity copyWith({
    String? subject,
    int? id,
    int? creatorId,
    int? remoteId,
    DateTime? createdDate,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
    int? remoteViews,
    int? views,
    String? checksum,
  }) {
    return TagEntity(
      subject: subject ?? this.subject,
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      createdDate: createdDate ?? this.createdDate,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewedDate: lastViewedDate ?? this.lastViewedDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
    );
  }

  @override
  List<Object?> get props => [
        subject,
        id,
        creatorId,
        remoteId,
        createdDate,
        lastUpdate,
        lastViewedDate,
        remoteViews,
        views,
        checksum,
      ];
}
