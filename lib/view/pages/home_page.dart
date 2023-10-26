import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    physics: _currentIndex == 3 ? const NeverScrollableScrollPhysics() : const ScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {});
                      _currentIndex = value;
                    },
                    itemCount: 4,
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
                            _imageFromIndex(
                              index,
                            ),
                            Column(
                              children: [
                                Text(
                                  _titleFromIndex(index),
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
                                  _descriptionFromIndex(index),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                if (_currentIndex != 3) ...[
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

  String _titleFromIndex(int index) {
    switch (index) {
      case 0:
        return "Monitora il ciclo e gioca con Droppy";
      case 1:
        return "Consigli e contenuti di esperti solo per te";
      case 2:
        return "Più partecipi, più accumuli punti";
      case 3:
        return "Attiva il tuo calendario";
      default:
        return "";
    }
  }

  String _descriptionFromIndex(int index) {
    switch (index) {
      case 0:
        return "Tieni sotto controllo il tuo ciclo mestruale e, quando hai le mestruazioni, prenditi cura della tua Droppy.";
      case 1:
        return "Accedi a tanti contenuti creati per te dai nostri esperti e professionisti e approfondisci i topic più rilevanti per la fase del ciclo in cui ti trovi.";
      case 2:
        return "Scopri le missioni, ottieni badge e coins per accedere a premi contenuti esclusivi.";
      case 3:
        return "Consenti a myDrop di inviarti notifiche: ti aiuterà a monitorare il tuo ciclo e il tuo benessere inviandoti periodicamente consigli e promemoria!";
      default:
        return "";
    }
  }

  Image _imageFromIndex(int index) {
    switch (index) {
      case 0:
        return Image.asset(
          "assets/images/calendar.png",
        );
      case 1:
        return Image.asset(
          "assets/images/break.png",
          height: 246.h,
        );
      case 2:
        return Image.asset(
          "assets/images/yoga.png",
          height: 246.h,
        );
      case 3:
        return Image.asset(
          "assets/images/love.png",
          height: 260.h,
        );
      default:
        return Image.asset("");
    }
  }

  void _animateToPageByIndex(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }
}
