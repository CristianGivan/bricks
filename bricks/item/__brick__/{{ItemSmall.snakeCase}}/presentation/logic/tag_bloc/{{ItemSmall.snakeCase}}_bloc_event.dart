part of 'tag_bloc.dart';

class UpdateTagBlocEvent<P> extends OrganizerBlocEvent {
  final P params;

  const UpdateTagBlocEvent(this.params);

  @override
  List<Object> get props => [params as Object];
}

class TagItemsSortBlocEvent<P> extends OrganizerBlocEvent {
  final P sortParams;

  const TagItemsSortBlocEvent({
    required this.sortParams,
  });

  @override
  List<Object> get props => [sortParams as Object];
}

class TagItemsFilterBlocEvent<P> extends OrganizerBlocEvent {
  final P filterParams;

  const TagItemsFilterBlocEvent({
    required this.filterParams,
  });

  @override
  List<Object> get props => [filterParams as Object];
}

class ExportTagToExcelBlocEvent extends OrganizerBlocEvent {
  final TagParams params;

  const ExportTagToExcelBlocEvent(this.params);

  @override
  List<Object> get props => [params];
}
