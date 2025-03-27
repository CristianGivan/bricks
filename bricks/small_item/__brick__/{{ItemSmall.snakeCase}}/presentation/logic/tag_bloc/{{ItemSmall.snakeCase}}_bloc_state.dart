part of 'tag_bloc.dart';

// TagBlocState can be more descriptive and concise.
class TagBlocState extends OrganizerBlocState<TagEntity> {
  final String? errorMessage;

  TagBlocState({
    required super.status,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
