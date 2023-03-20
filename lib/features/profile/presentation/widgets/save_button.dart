import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Stack(
          children: [
            CustomButton(
              text: 'Save',
              gradient: AppColors.secondaryGradient(),
              height: AppDimensions.height50,
              width: AppDimensions.width150,
              textColor: Colors.white,
              onTap: onTap,
            ),
            if (state is NameLoading)
              const Positioned.fill(
                child: LoadingIndicator(),
              ),
          ],
        );
      },
    );
  }
}
