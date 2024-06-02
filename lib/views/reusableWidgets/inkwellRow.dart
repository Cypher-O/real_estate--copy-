import 'package:real_estate/utils/imports/generalImports.dart';

Widget buildInkWellRow(
  BuildContext context,
  IconData icon,
  String text,
  Color textColor,
  ValueNotifier<bool> isToggled,
  ValueNotifier<bool> isModalOpen, {
  Color? iconColor,
}) {
  return InkWell(
    onTap: () {
      isToggled.value = !isToggled.value;
      isModalOpen.value = !isModalOpen.value;
    },
    child: Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: iconColor ?? textColor,
        ),
        S(w: 6),
        GeneralTextDisplay(
          text,
          15,
          textColor: textColor,
          noOfTextLine: 1,
          textFontWeight: FontWeight.w400,
          letterSpacing: -0.6,
        ),
      ],
    ),
  );
}
