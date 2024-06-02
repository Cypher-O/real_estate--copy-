import 'package:real_estate/utils/imports/generalImports.dart';

class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomizedAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Animate().custom(
        begin: 10,
        end: 175,
        duration: 1.seconds,
        builder: (_, value, __) {
          return Container(
            height: 40,
            width: value,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.01),
                  blurRadius: 10,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Iconsax.location5,
                  size: 20,
                  color: primaryGreen,
                ),
                S(w: 5),
                const Text(
                  location,
                  style: TextStyle(
                    color: primaryGreen,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 1.7.seconds),
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: kScreenHorizontalPadding),
          child: Image.asset(
            ImageAssets.user_image,
            height: 40,
            width: 40,
          ).animate().scale(
                duration: 1.seconds,
              ),
        ),
      ],
    );
  }
}


//
// class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomizedAppBar({super.key});
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: kToolbarHeight,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: const BoxDecoration(
//         color: Colors.transparent, // Set the background color to transparent
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Your AppBar title or leading widget
//           Animate().custom(
//             begin: 10,
//             end: 175,
//             duration: 1.seconds,
//             builder: (_, value, __) {
//               return Container(
//                 height: 40,
//                 width: value,
//                 padding: const EdgeInsets.symmetric(horizontal: 18),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.01),
//                       blurRadius: 10,
//                       offset: const Offset(2, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(
//                       Iconsax.location5,
//                       size: 20,
//                       color: primaryGreen,
//                     ),
//                     S(w: 5),
//                     const Text(
//                       location,
//                       style: TextStyle(
//                         color: primaryGreen,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ).animate().fadeIn(delay: 1.7.seconds),
//               );
//             },
//           ),
//
//           // Your AppBar actions or trailing widget
//           Padding(
//             padding: const EdgeInsets.only(right: kScreenHorizontalPadding),
//             child: Image.asset(
//               ImageAssets.user_image,
//               height: 40,
//               width: 40,
//             ).animate().scale(
//               duration: 1.seconds,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }