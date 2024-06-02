import 'dart:ui';
import 'package:real_estate/utils/imports/generalImports.dart';

class ListingItem extends StatelessWidget {
  const ListingItem({
    required this.image,
    required this.title,
    this.height = 190,
    this.width = double.infinity,
    super.key,
  });

  final String image;
  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 8,
                  sigmaY: 8,
                ),
                child: Container(
                  height: 42,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.4),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Center(
                          child: GeneralTextDisplay(
                            title,
                            15,
                            textColor: primaryBlack,
                            noOfTextLine: 1,
                            textFontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        right: 3,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Iconsax.arrow_right_3,
                            size: 14,
                            color: primaryBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
              .animate(
                delay: 4.8.seconds,
              )
              .scaleX(
                alignment: Alignment.centerLeft,
                begin: 0,
                end: 1,
                duration: 500.ms,
              ),
        ],
      ),
    );
  }
}
