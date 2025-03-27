import 'package:excel/excel.dart';
import 'package:fo_fe/features/organizer/utils/exports/excel/excel_table_factory.dart';

import '../tag_exports.dart';

class TagExcelTableFactory extends ExcelTableFactory<TagDto> {
  @override
  String getTableName() => 'Tasks';

  @override
  List<CellValue?> createHeader() {
    return [
      TextCellValue('Tag ID'),
      TextCellValue('Tag Subject'),
      TextCellValue('Tag Description'),
    ];
  }

  @override
  List<CellValue?> createRow(TagDto entity) {
    return [
      IntCellValue(entity.tag.id),
      TextCellValue(entity.tag.subject),
    ];
  }
}
