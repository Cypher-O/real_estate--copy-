import 'dart:ui';
import 'package:real_estate/utils/imports/generalImports.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isToggled = useState(true);
    final isModalOpen = useState(false);
    final containerWidth = isToggled.value ? 100.0 : 50.0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.search_normal_1,
                        size: 20,
                        color: primaryBlack,
                      ),
                      S(w: 8),
                      const GeneralTextDisplay(
                        location,
                        15,
                        textColor: primaryBlack,
                        noOfTextLine: 1,
                        textFontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ).animate().fadeIn(curve: Curves.easeOut).scale(
                      duration: 400.ms,
                    ),
              ),
              S(w: 7),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Iconsax.candle_2,
                  size: 20,
                  color: primaryBlack,
                ),
              ).animate().fadeIn(curve: Curves.easeOut).scale(
                    duration: 400.ms,
                  ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImageAssets.map,
              fit: BoxFit.cover,
            ),
          ),
          animatedPositionedContainer(
            context,
            top: 100,
            right: 50,
            text: firstMapMarker,
            isToggled: isToggled,
            containerWidth: containerWidth,
          ),
          animatedPositionedContainer(
            context,
            top: 300,
            left: 50,
            text: fourthMapMarker,
            isToggled: isToggled,
            containerWidth: containerWidth,
          ),
          animatedPositionedContainer(
            context,
            top: 170,
            left: 100,
            text: secondMapMarker,
            isToggled: isToggled,
            containerWidth: containerWidth,
          ),
          animatedPositionedContainer(
            context,
            top: 240,
            right: 20,
            text: thirdMapMarker,
            isToggled: isToggled,
            containerWidth: containerWidth,
          ),
          animatedPositionedContainer(
            context,
            top: 340,
            right: 70,
            text: fifthMapMarker,
            isToggled: isToggled,
            containerWidth: containerWidth,
          ),
          animatedPositionedContainer(
            context,
            top: 430,
            left: 55,
            text: sixthMapMarker,
            isToggled: isToggled,
            containerWidth: containerWidth,
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(
          bottom: 90,
          right: 15,
          left: 50,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HookBuilder(
                  builder: (context) {
                    final rippleController =
                        useAnimationController(duration: 400.ms);
                    return AnimatedSwitcher(
                      duration: 500.ms,
                      child: isModalOpen.value
                          ? Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildInkWellRow(
                                    context,
                                    Iconsax.shield_tick,
                                    cosy,
                                    primaryBlack.withOpacity(.45),
                                    isToggled,
                                    isModalOpen,
                                  ),
                                  S(h: 15),
                                  buildInkWellRow(
                                    context,
                                    Iconsax.empty_wallet,
                                    price,
                                    primaryOrange,
                                    isToggled,
                                    isModalOpen,
                                    iconColor: primaryOrange,
                                  ),
                                  S(h: 15),
                                  buildInkWellRow(
                                    context,
                                    Iconsax.bank4,
                                    infrastructure,
                                    primaryBlack.withOpacity(.45),
                                    isToggled,
                                    isModalOpen,
                                  ),
                                  S(h: 15),
                                  buildInkWellRow(
                                    context,
                                    Iconsax.layer,
                                    withoutLayer,
                                    primaryBlack.withOpacity(.45),
                                    isToggled,
                                    isModalOpen,
                                  ),
                                ],
                              ),
                            ).animate().scaleXY(
                                begin: 0.5,
                                alignment: Alignment.bottomLeft,
                              )
                          : HookBuilder(
                              builder: (context) {
                                final rippleController =
                                    useAnimationController(duration: 400.ms);
                                final isModalOpenValue =
                                    useValueListenable(isModalOpen);
                                return InkWell(
                                  onTap: () async {
                                    await rippleController.forward(from: 0);
                                    isModalOpen.value = !isModalOpen.value;
                                  },
                                  borderRadius: BorderRadius.circular(100),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 4,
                                            sigmaY: 4,
                                          ),
                                          child: Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.35),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Iconsax.layer,
                                                size: 20,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      AnimatedBuilder(
                                        animation: rippleController,
                                        builder: (context, child) {
                                          return Transform.scale(
                                            scale: rippleController.value * 1,
                                            child: Opacity(
                                              opacity:
                                                  1 - rippleController.value,
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: white,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ).animate().fadeIn(curve: Curves.easeOut).scale(
                                      duration: 400.ms,
                                    );
                              },
                            ),
                    );
                  },
                ),
                S(h: 5),
                HookBuilder(
                  builder: (context) {
                    final rippleController =
                        useAnimationController(duration: 400.ms);
                    return InkWell(
                      onTap: () {
                        rippleController.forward(from: 0);
                      },
                      borderRadius: BorderRadius.circular(100),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 4,
                                sigmaY: 4,
                              ),
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200.withOpacity(0.35),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Iconsax.direct_up,
                                    size: 20,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: rippleController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: rippleController.value * 1,
                                child: Opacity(
                                  opacity: 1 - rippleController.value,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ).animate().fadeIn(curve: Curves.easeOut).scale(
                          duration: 400.ms,
                        );
                  },
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4,
                ),
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.35),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.textalign_left,
                        size: 20,
                        color: white,
                      ),
                      S(w: 5),
                      const GeneralTextDisplay(
                        variants,
                        15,
                        textColor: white,
                        noOfTextLine: 1,
                        textFontWeight: FontWeight.w600,
                        letterSpacing: -0.6,
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(curve: Curves.easeOut).scale(
                    duration: 400.ms,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}