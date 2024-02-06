part of '../screen_records.dart';

class _UiBottomSheet extends StatelessWidget {
  final Function onAdd;

  _UiBottomSheet({
    required this.onAdd,
  });

  final controllerTitle = TextEditingController();
  final controllerDescription = TextEditingController();

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
            labelText: labelsRecords[keyLabelTitle],
          ),
          UiTextField(
            controller: controllerDescription,
            labelText: labelsRecords[keyLabelDescription],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UiButtonAdd(onAdd: _handleAdd),
              UiButtonCancel(onClear: _handleClear),
            ],
          ),
        ],
      ),
    );
  }

  void _handleAdd() {
    onAdd(
      controllerTitle.text,
      controllerDescription.text,
    );

    _handleClear();
  }

  void _handleClear() {
    controllerTitle.clear();
    controllerDescription.clear();
  }
}
