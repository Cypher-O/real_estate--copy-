import 'package:real_estate/utils/imports/generalImports.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing;
  final FontWeight? textFontWeight;
  final int? noOfTextLine;
  final String? textSemanticLabel;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;

  const GeneralTextDisplay(
    this.inputText,
    this.textFontSize, {
    super.key,
    this.textDecoration,
    this.textAlign,
    this.decorationColor,
    this.letterSpacing,
    this.textFontWeight,
    this.textSemanticLabel,
    this.textColor,
    this.noOfTextLine,
  });

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Text(
      inputText,
      style: GoogleFonts.urbanist(
          textStyle: TextStyle(
              color: textColor,
              letterSpacing: letterSpacing ?? 0.02,
              fontSize: orientation == Orientation.portrait
                  ? dynamicSize.height * (textFontSize! / 800)
                  : dynamicSize.width * (textFontSize! / 800),
              fontWeight: textFontWeight,
              decoration: textDecoration ?? TextDecoration.none,
              decorationColor: decorationColor ?? Colors.black,
              decorationStyle: TextDecorationStyle.solid)),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
    );
  }
}
