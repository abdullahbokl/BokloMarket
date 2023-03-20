import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:boklo_mart/core/common/widgets/avatar_image.dart';
import 'package:boklo_mart/core/utils/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditAvatarImage extends StatelessWidget {
  const EditAvatarImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final ProfileCubit profileCubit = ProfileCubit.get(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ClipOval(
          child: Stack(
            children: [
              AvatarImage(
                imageUrl: auth.currentUser!.photoURL.toString().contains('http')
                    ? auth.currentUser!.photoURL.toString()
                    : AppImages.userDefaultNetworkAvatarImage,
                onTap: () {
                  profileCubit.updateProfileImage();
                },
              ),
              if (state is ProfileImageLoading)
                const Positioned.fill(
                  child: LoadingIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }
}
