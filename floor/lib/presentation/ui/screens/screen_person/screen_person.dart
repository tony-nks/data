import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:floor_skillbox/data/models/app_person/app_person.dart';
import 'package:floor_skillbox/domain/blocs/bloc_persons.dart';
import 'package:floor_skillbox/domain/blocs/bloc_persons_event.dart';
import 'package:floor_skillbox/presentation/consts/keys.dart';
import 'package:floor_skillbox/presentation/consts/translations.dart';
import 'package:floor_skillbox/presentation/ui/components/ui_app_bar.dart';
import 'package:floor_skillbox/presentation/ui/components/ui_text_field.dart';

part 'components/ui_avatar.dart';
part 'components/ui_avatar_picker.dart';

const int _maxLengthAge = 3;

class ScreenPerson extends StatefulWidget {
  final AppPerson? person;
  final String? card;

  const ScreenPerson({
    super.key,
    this.person,
    this.card,
  });

  @override
  State<ScreenPerson> createState() => _ScreenPersonState();
}

class _ScreenPersonState extends State<ScreenPerson> {
  late final TextEditingController _controllerName;
  late final TextEditingController _controllerSurname;
  late final TextEditingController _controllerAge;
  late final TextEditingController _controllerPhone;
  late final TextEditingController _controllerCard;
  late String _avatar;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final person = widget.person;

    _controllerName = TextEditingController(text: person?.name);
    _controllerSurname = TextEditingController(text: person?.surname);
    _controllerAge = TextEditingController(text: person?.age.toString());
    _controllerPhone = TextEditingController(text: person?.phone.toString());
    _controllerCard = TextEditingController(text: widget.card);

    _avatar = person?.avatar ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final validatorAge = ValidationBuilder().maxLength(_maxLengthAge).build();

    return Scaffold(
      appBar: UiAppBar(title: labelsPerson[keyTitle]!),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                UiTextField(
                  labelText: labelsPerson[keyName]!,
                  controller: _controllerName,
                ),
                UiTextField(
                  labelText: labelsPerson[keySurname]!,
                  controller: _controllerSurname,
                ),
                UiTextField(
                  labelText: labelsPerson[keyAge]!,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  controller: _controllerAge,
                  maxLength: _maxLengthAge,
                  validator: validatorAge,
                ),
                UiTextField(
                  labelText: labelsPerson[keyPhone]!,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  controller: _controllerPhone,
                ),
                UiTextField(
                  labelText: labelsPerson[keyCard]!,
                  controller: _controllerCard,
                ),
                _UiAvatarPicker(
                  onSelect: _handleSetAvatar,
                  path: _avatar,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleValidate,
        child: const Icon(Icons.done),
      ),
    );
  }

  void _handleSetAvatar(String path) {
    _avatar = path;
  }

  void _handleValidate() {
    if (_form.currentState?.validate() == true) {
      _handleSubmit();
    }
  }

  void _handleSubmit() {
    final person = AppPerson(
      id: widget.person?.id ?? context.read<BlocPersons>().repo.maxId + 1,
      name: _controllerName.text,
      surname: _controllerSurname.text,
      age: int.parse(_controllerAge.text),
      phone: _controllerPhone.text,
      avatar: _avatar,
    );

    final card = _controllerCard.text;

    if (widget.person != null) {
      context.read<BlocPersons>().add(
            BlocPersonsEventUpdate(person: person, card: card),
          );
    } else {
      context.read<BlocPersons>().add(
            BlocPersonsEventAdd(person: person, card: card),
          );
    }

    Navigator.of(context).pop();
  }
}
