import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/themes/app_colors.dart';

class ProfileImage extends StatelessWidget {
  final String? profileImage;
  final double? size;
  const ProfileImage({
    super.key,
    required this.profileImage,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    if (profileImage == null) {
      return CircleAvatar(
        backgroundColor: AppColors.kDarkGrayColor,
        radius: size,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: SvgPicture.asset(
            "assets/svg/kImg_profile.svg",
          ),
        ),
      );
    }
    return CircleAvatar(
      backgroundColor: AppColors.kDarkGrayColor,
      radius: size,
      child: CachedNetworkImage(
        imageUrl: profileImage ?? "",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
