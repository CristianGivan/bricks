import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class TagFormCubit extends Cubit<TagFormState> {
  TagFormCubit() : super(TagFormState());

  void updateSubject(String subject) {
    emit(state.copyWith(subject: subject));
  }
}

class TagFormState extends Equatable {
  final String subject;

  const TagFormState({this.subject = ''});

  TagFormState copyWith({String? subject}) {
    return TagFormState(
      subject: subject ?? this.subject,
    );
  }

  @override
  List<Object> get props => [subject];
}
