import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = ProfileCubit.get(context);

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return CircleAvatar(
          radius: AppDimensions.radius80,
          backgroundImage: NetworkImage(profileCubit.user.image ?? ''),
        );
      },
    );
  }
}
