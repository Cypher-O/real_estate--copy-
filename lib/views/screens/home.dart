import 'package:real_estate/utils/imports/generalImports.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffF8F8F8),
                Color(0xffF5D8B4),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CustomizedAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                S(h: 35),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kScreenHorizontalPadding,
                  ),
                  child: const GeneralTextDisplay(
                    userGreeting,
                    25,
                    textColor: primaryGreen,
                    noOfTextLine: 1,
                    textFontWeight: FontWeight.w500,
                  ).animate().fadeIn(
                        delay: 2.5.seconds,
                      ),
                ),
                S(h: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kScreenHorizontalPadding,
                  ),
                  child: const GeneralTextDisplay(
                    subText,
                    33,
                    textColor: primaryBlack,
                    noOfTextLine: 2,
                    textFontWeight: FontWeight.w500,
                  )
                      .animate()
                      .fadeIn(
                        delay: 2.9.seconds,
                      )
                      .move(
                        begin: const Offset(0, 30),
                        curve: Curves.decelerate,
                      ),
                ),
                S(h: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kScreenHorizontalPadding,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 170,
                          padding: const EdgeInsets.only(top: 15),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryOrange,
                          ),
                          child: Column(
                            children: [
                              S(h: 10),
                              GeneralTextDisplay(
                                buy.toUpperCase(),
                                15,
                                textColor: white,
                                noOfTextLine: 1,
                                textFontWeight: FontWeight.w400,
                              ),
                              S(h: 25),
                              Animate().custom(
                                delay: 4.seconds,
                                duration: 900.ms,
                                begin: 0,
                                end: 1034,
                                builder: (_, value, __) => GeneralTextDisplay(
                                  '${value.round()}',
                                  40,
                                  textColor: white,
                                  noOfTextLine: 1,
                                  textFontWeight: FontWeight.w600,
                                ),
                              ),
                              const GeneralTextDisplay(
                                offers,
                                15,
                                textColor: white,
                                noOfTextLine: 1,
                                textFontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ).animate().scale(
                              delay: 3.5.seconds,
                              duration: 900.ms,
                            ),
                      ),
                      S(w: 10),
                      Expanded(
                        child: Container(
                          height: 155,
                          padding: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            color: white,
                          ),
                          child: Column(
                            children: [
                              S(h: 10),
                              GeneralTextDisplay(
                                rent.toUpperCase(),
                                15,
                                textColor: primaryGreen,
                                noOfTextLine: 1,
                                textFontWeight: FontWeight.w400,
                              ),
                              S(h: 25),
                              Animate().custom(
                                delay: 4.seconds,
                                duration: 900.ms,
                                begin: 0,
                                end: 2212,
                                builder: (_, value, __) => GeneralTextDisplay(
                                  '${value.round()}',
                                  40,
                                  textColor: primaryGreen,
                                  noOfTextLine: 1,
                                  textFontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              const GeneralTextDisplay(
                                offers,
                                15,
                                textColor: primaryGreen,
                                noOfTextLine: 1,
                                textFontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ).animate().scale(
                              delay: 3.5.seconds,
                              duration: 900.ms,
                            ),
                      ),
                    ],
                  ),
                ),
                S(h: 30),
                Container(
                  padding: const EdgeInsets.fromLTRB(7, 10, 7, 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(23),
                    ),
                    color: white,
                  ),
                  child: Column(
                    children: [
                      const ListingItem(
                        image: ImageAssets.apartment_listing,
                        title: listingLocationName,
                      ),
                      S(h: 10),
                      Row(
                        children: [
                          const Expanded(
                            child: ListingItem(
                              image: ImageAssets.apartment_listing2,
                              title: listingLocationName2,
                              height: 300,
                            ),
                          ),
                          S(w: 10),
                          Expanded(
                            child: Column(
                              children: [
                                const ListingItem(
                                  image: ImageAssets.apartment_listing3,
                                  title: listingLocationName3,
                                  height: 145,
                                ),
                                S(h: 10),
                                const ListingItem(
                                  image: ImageAssets.apartment_listing4,
                                  title: listingLocationName4,
                                  height: 145,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                    .animate(
                      delay: 4.5.seconds,
                    )
                    .slideY(
                      duration: 800.ms,
                      begin: 1,
                      end: 0,
                      curve: Curves.decelerate,
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
