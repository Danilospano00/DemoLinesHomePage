import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lines_demo_project/models/home_page_model.dart';
import 'package:lines_demo_project/theme/paint_utils.dart';
import 'package:lines_demo_project/view/widget/custom_elevated_button.dart';
import 'package:lines_demo_project/view/widget/page_indicator_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();

  int _currentIndex = 0;

  final pageModelList = [
    HomePageModel(
      image: Image.asset(
        "assets/images/calendar.png",
      ),
      title: "Monitora il ciclo \ne gioca con Droppy",
      description: "Tieni sotto controllo il tuo ciclo mestruale e, quando hai le mestruazioni, prenditi cura della tua Droppy.",
    ),
    HomePageModel(
      image: Image.asset(
        "assets/images/break.png",
        height: 246.h,
      ),
      title: "Consigli e contenuti di esperti solo per te",
      description: "Accedi a tanti contenuti creati per te dai nostri esperti e professionisti e approfondisci i topic più rilevanti per la fase del ciclo in cui ti trovi.",
    ),
    HomePageModel(
      image: Image.asset(
        "assets/images/yoga.png",
        height: 246.h,
      ),
      title: "Più partecipi, \npiù accumuli punti",
      description: "Consenti a myDrop di inviarti notifiche: ti aiuterà a monitorare il tuo ciclo e il tuo benessere inviandoti periodicamente consigli e promemoria!",
    ),
    HomePageModel(
      image: Image.asset(
        "assets/images/love.png",
        height: 260.h,
      ),
      title: "Attiva il tuo calendario",
      description: "Consenti a myDrop di inviarti notifiche: ti aiuterà a monitorare il tuo ciclo e il tuo benessere inviandoti periodicamente consigli e promemoria!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xFFDFC5D8),
                ],
              ),
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.only(
              bottom: 50.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: _isLastPageShowed ? const NeverScrollableScrollPhysics() : const ScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {});
                      _currentIndex = value;
                    },
                    itemCount: pageModelList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100.h,
                            ),
                            pageModelList[index].image,
                            SizedBox(
                              height: 14.h,
                            ),
                            Text(
                              pageModelList[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.sp,
                                foreground: PaintUtils.getLinearGradientPaint(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: const [
                                    Color(0xFFB63AB4),
                                    Color(0xFF513B9F),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            Text(
                              pageModelList[index].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                if (!_isLastPageShowed) ...[
                  PageIndicatorWidget(
                    itemCount: 3,
                    currentIndex: _currentIndex,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      _currentIndex++;
                      _animateToPageByIndex(_currentIndex++);
                    },
                    text: "CONTINUA",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      _currentIndex = 4;
                      _animateToPageByIndex(4);
                    },
                    child: Center(
                      child: Text(
                        "SALTA",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          foreground: PaintUtils.getLinearGradientPaint(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: const [
                              Color(0xFFB63AB4),
                              Color(0xFF1F2D4F),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomElevatedButton(
                    text: "INDIETRO",
                    onPressed: () {
                      _animateToPageByIndex(0);
                    },
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }

  void _animateToPageByIndex(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  bool get _isLastPageShowed => _currentIndex == pageModelList.length - 1;
}
