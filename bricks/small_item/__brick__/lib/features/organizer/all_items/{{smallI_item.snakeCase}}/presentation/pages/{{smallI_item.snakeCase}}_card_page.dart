import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/presentation/widgets/item_card_container.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagCard extends StatelessWidget {
  final TagEntity itemEntity;

  const TagCard(
    this.itemEntity, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemCardContainer(
      onTap: () => _handleTap(context),
      onLongPress: () => _handleLongPress(context),
      onConfirmDismiss: (direction, context) => _handleConfirmDismiss(direction, context),
      child: _buildCard(context),
    );
  }

  void _handleTap(BuildContext context) {
    context.pushNamed(TagRouterNames.tagViewRouteName, extra: itemEntity.id);
  }

  void _handleLongPress(BuildContext context) {
    context.pushNamed(TagRouterNames.tagUpdateRouteName, extra: itemEntity.id);
  }

  Future<bool> _handleConfirmDismiss(DismissDirection direction, BuildContext context) async {
    return true;
  }

  Widget _buildCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTagName(),
            _buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTagName() {
    return Text(
      itemEntity.subject,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () => context.pop(),
    );
  }
}
