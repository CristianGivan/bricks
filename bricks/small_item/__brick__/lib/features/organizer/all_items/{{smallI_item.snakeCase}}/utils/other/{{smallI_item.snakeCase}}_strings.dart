import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagStrings extends ItemStrings {
  final String itemName;

  TagStrings()
      : itemName = 'tag',
        super('tag');

  String get noTagDtoLoaded => 'No tagDto loaded';
}
