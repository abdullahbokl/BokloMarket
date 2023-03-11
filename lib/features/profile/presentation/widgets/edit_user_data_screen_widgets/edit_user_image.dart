import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/core/common/widgets/avatar_image.dart';
import 'package:flutter/material.dart';

class EditUserImage extends StatelessWidget {
  const EditUserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = AuthBloc.get(context);

    return GestureDetector(
      onTap: () {
        /// todo : chabge user image
      },
      child: AvatarImage(
        imageUrl: authBloc.user.image ?? '',
      ),
    );
  }
}
