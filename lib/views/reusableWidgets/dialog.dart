import 'package:real_estate/utils/imports/generalImports.dart';

Widget customDialog(child,
    {Alignment? align,
    double? x,
    double? y,
    Color? color,
    double? width,
    double? height}) {
  return Align(
    alignment: align ?? Alignment(x!, y!),
    // for y -1 to 1 (from top to bottom)
    // for x -1 to 1 (from left to right)
    child: S(
      h: height ?? 200,
      w: width ?? 300,
      child: Material(
        color: color ?? Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(padding: const EdgeInsets.all(20.0), child: child),
      ),
    ),
  );
}

Widget loading() {
  return const CircularProgressIndicator();
}
