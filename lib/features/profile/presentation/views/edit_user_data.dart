import 'package:boklo_mart/features/profile/presentation/widgets/edit_user_data_screen_widgets/edit_user_data_text_form_fields.dart';
import 'package:flutter/material.dart';

class EditUserDataScreen extends StatelessWidget {
  const EditUserDataScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit user data'),
      ),
      body: const EditUserDataTextFormFields(),
    );
  }
}
