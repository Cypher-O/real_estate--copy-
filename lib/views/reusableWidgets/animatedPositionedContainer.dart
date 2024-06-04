import 'package:real_estate/utils/imports/generalImports.dart';

Widget animatedPositionedContainer(
  BuildContext context, {
  double? left,
  double? right,
  required double top,
  required String text,
  required double containerWidth,
  required ValueNotifier<bool> isToggled,
}) {
  return Positioned(
    top: top,
    left: left,
    right: right,
    child: HookBuilder(
      builder: (context) {
        return AnimatedContainer(
          width: containerWidth,
          height: 50,
          duration: 600.ms,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          decoration: const BoxDecoration(
            color: primaryOrange,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Center(
            child: isToggled.value
                ? GeneralTextDisplay(
                    text,
                    15,
                    textColor: white,
                    noOfTextLine: 1,
                    textFontWeight: FontWeight.w400,
                  )
                : Center(
                    child: const Icon(
                      Iconsax.stickynote,
                      size: 18,
                      color: white,
                    ),
                  ),
          ),
        )
            .animate(
              delay: 0.3.seconds,
            )
            .fadeIn(curve: Curves.easeOut)
            .slideX(
              begin: -0.5,
              duration: 600.ms,
            );
      },
    ),
  );
}
