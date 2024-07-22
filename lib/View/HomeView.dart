import 'dart:ui';

import 'package:alarm/Components/Colors.dart';
import 'package:alarm/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xffBAC3CF)])),
        child: SafeArea(
          child: Column(
            children: [
              Gap(height * 0.1),
              Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const Spacer(),
              GradientBorderContainer2(
                  containerHeight: height * .5,
                  containerWidth: width,
                  gradient: const LinearGradient(
                      stops: [0, 0.85],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white, Color(0xffC6CEDA)]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Alarms',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: black,
                              size: width * 0.1,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return GradientBorderContainer(
                                gradient: const LinearGradient(
                                    tileMode: TileMode.mirror,
                                    stops: [0, 0.85],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.white, Color(0xffBAC3CF)]),
                                child: ListTile(
                                  title: const Text(
                                    '7:30',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: black,
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: SizedBox(
                                    width: width * 0.5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        days(true, 'S'),
                                        days(true, 'S'),
                                        days(true, 'M'),
                                        days(true, 'T'),
                                        days(true, 'W'),
                                        days(true, 'T'),
                                        days(true, 'F'),
                                        GradientSwitch(
                                          value: false,
                                          onChanged: (value) {
                                            print('Switch value: $value');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientBorderContainer extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double borderWidth;
  final double borderRadius;

  const GradientBorderContainer({
    super.key,
    required this.child,
    required this.gradient,
    this.borderWidth = 1.0,
    this.borderRadius = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Container(
            height: height * 0.09,
            width: width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    offset: const Offset(-5, -5),
                    blurRadius: 20),
                BoxShadow(
                    color: const Color(0xffA6B4C8).withOpacity(0.57),
                    blurRadius: 12,
                    spreadRadius: -6,
                    offset: const Offset(13, 14))
              ],
              gradient: gradient,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: EdgeInsets.all(borderWidth),
            child: Container(
              height: height * 0.09,
              width: width,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffEEF0F5), Color(0xffE6E9EF)]),
                color: white,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(child: child),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientBorderContainer2 extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double borderWidth;
  final double borderRadius;
  final double containerHeight;
  final double containerWidth;

  const GradientBorderContainer2(
      {super.key,
      required this.child,
      required this.gradient,
      this.borderWidth = 1,
      this.borderRadius = 14.0,
      this.containerHeight = 50,
      this.containerWidth = 50});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.36),
                  offset: const Offset(-10, -10),
                  blurRadius: 20),
            ],
            gradient: const LinearGradient(
                stops: [0.3, 3],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffE2E4EA), Color(0xffEAECF1)]),
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          padding: EdgeInsets.all(borderWidth),
          child: Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffEEF0F5), Color(0xffE6E9EF)]),
              color: white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}

Widget days(bool active, String day) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2.0),
    child: Text(
      day,
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: true ? red : black,
        fontSize: 15,
      ),
    ),
  );
}

class GradientSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const GradientSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  _GradientSwitchState createState() => _GradientSwitchState();
}

class _GradientSwitchState extends State<GradientSwitch> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  void _toggleSwitch() {
    setState(() {
      _value = !_value;
    });
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 60.0,
        height: 30.0,
        child: InnerShadow(
          shadows: [
            Shadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 1.98,
                offset: const Offset(1.6, 1.3))
          ],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _value
                    ? [const Color(0xffFD2A22), const Color(0xffFE6C57)]
                    : [Colors.grey, Colors.grey.shade400],
              ),
            ),
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  left: _value ? 30.0 : 0.0,
                  right: _value ? 0.0 : 30.0,
                  child: Stack(
                    children: [
                      Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xffFAFBFB), Color(0xffC0CAD7)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xffEEF0F5), Color(0xffE6E9EF)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InnerShadowPainter extends CustomPainter {
  final Color shadowColor;
  final Offset offset;
  final double blurRadius;

  InnerShadowPainter({
    required this.shadowColor,
    required this.offset,
    required this.blurRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Paint shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius);

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(15.0)))
      ..addRRect(RRect.fromRectAndRadius(
          rect.deflate(blurRadius), const Radius.circular(15.0)))
      ..fillType = PathFillType.evenOdd;

    canvas.saveLayer(rect, Paint());
    canvas.translate(offset.dx, offset.dy);
    canvas.drawPath(path, shadowPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
