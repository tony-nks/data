part of '../screen_images.dart';

class _UiBottomSheet extends StatelessWidget {
  final Function onAdd;

  _UiBottomSheet({
    required this.onAdd,
  });

  final controllerTitle = TextEditingController(
      text:
          'https://www.syncfusion.com/blogs/wp-content/uploads/2019/12/Flutter_Trends_and_Community_Updates_Social.jpg');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UiTextField(
            controller: controllerTitle,
            labelText: labelsImages[keyLabelTitle],
            suffix: UiButtonAdd(onAdd: _handleAdd),
          ),
        ],
      ),
    );
  }

  void _handleAdd() {
    onAdd(controllerTitle.text);

    _handleClear();
  }

  void _handleClear() {
    controllerTitle.clear();
  }
}
