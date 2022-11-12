import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  bool get isKeyBoardOpen => MediaQuery.of(this).viewInsets.bottom > 0;
  Brightness get appBrightness => MediaQuery.of(this).platformBrightness;
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get maxFinite=> double.maxFinite;
  // Dynamic values
  double get val1x => height * 0.01;
  double get val2x => height * 0.02;
  double get val3x => height * 0.03;
  double get val4x => height * 0.04;
  double get val5x => height * 0.05;
  double get val6x => height * 0.06;
  double get val7x => height * 0.07;
  double get val8x => height * 0.08;
  double get val9x => height * 0.09;
  double get val10x => height * 0.1;
  double get val11x => height * 0.11;
  double get val12x => height * 0.12;
  double get val13x => height * 0.13;
  double get val14x => height * 0.14;
  double get val15x => height * 0.15;

  // Dynamic height and weight generator
  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension DurationExtension on BuildContext {
  Duration get durationLow1x => const Duration(milliseconds: 100);
  Duration get durationLow2x => const Duration(milliseconds: 250);
  Duration get durationLow3x => const Duration(milliseconds: 500);
  Duration get durationLow4x => const Duration(milliseconds: 750);

  Duration get durationNormal1x => const Duration(milliseconds: 1000);
  Duration get durationNormal2x => const Duration(milliseconds: 1250);
  Duration get durationNormal3x => const Duration(milliseconds: 1500);
  Duration get durationNormal4x => const Duration(milliseconds: 1750);

  Duration get durationSlow1x => const Duration(milliseconds: 2000);
  Duration get durationSlow2x => const Duration(milliseconds: 2250);
  Duration get durationSlow3x => const Duration(milliseconds: 2500);
  Duration get durationSlow4x => const Duration(milliseconds: 2750);

  Duration get durationVerySlow1x => const Duration(milliseconds: 3000);
  Duration get durationVerySlow2x => const Duration(milliseconds: 3250);
  Duration get durationVerySlow3x => const Duration(milliseconds: 3500);
  Duration get durationVerySlow4x => const Duration(milliseconds: 3750);

  Duration get durationTooSlow1x => const Duration(milliseconds: 4000);
  Duration get durationTooSlow2x => const Duration(milliseconds: 4250);
  Duration get durationTooSlow3x => const Duration(milliseconds: 4500);
  Duration get durationTooSlow4x => const Duration(milliseconds: 4750);
}

extension PaddingExtension on BuildContext {
  // Padding All
  EdgeInsets get padding1x => EdgeInsets.all(val1x);
  EdgeInsets get padding2x => EdgeInsets.all(val2x);
  EdgeInsets get padding3x => EdgeInsets.all(val3x);
  EdgeInsets get padding4x => EdgeInsets.all(val4x);
  EdgeInsets get padding5x => EdgeInsets.all(val5x);
  EdgeInsets get padding6x => EdgeInsets.all(val6x);
  EdgeInsets get padding7x => EdgeInsets.all(val7x);
  EdgeInsets get padding8x => EdgeInsets.all(val8x);
  EdgeInsets get padding9x => EdgeInsets.all(val9x);
  EdgeInsets get padding10x => EdgeInsets.all(val10x);
  EdgeInsets get padding11x => EdgeInsets.all(val11x);
  EdgeInsets get padding12x => EdgeInsets.all(val12x);
  EdgeInsets get padding13x => EdgeInsets.all(val13x);
  EdgeInsets get padding14x => EdgeInsets.all(val14x);
  EdgeInsets get padding15x => EdgeInsets.all(val15x);

  // Padding Horizontal
  EdgeInsets get paddingHorizontal1x => EdgeInsets.symmetric(horizontal: val1x);
  EdgeInsets get paddingHorizontal2x => EdgeInsets.symmetric(horizontal: val2x);
  EdgeInsets get paddingHorizontal3x => EdgeInsets.symmetric(horizontal: val3x);
  EdgeInsets get paddingHorizontal4x => EdgeInsets.symmetric(horizontal: val4x);
  EdgeInsets get paddingHorizontal5x => EdgeInsets.symmetric(horizontal: val5x);
  EdgeInsets get paddingHorizontal6x => EdgeInsets.symmetric(horizontal: val6x);
  EdgeInsets get paddingHorizontal7x => EdgeInsets.symmetric(horizontal: val7x);
  EdgeInsets get paddingHorizontal8x => EdgeInsets.symmetric(horizontal: val8x);
  EdgeInsets get paddingHorizontal9x => EdgeInsets.symmetric(horizontal: val9x);
  EdgeInsets get paddingHorizontal10x =>
      EdgeInsets.symmetric(horizontal: val10x);
  EdgeInsets get paddingHorizontal11x =>
      EdgeInsets.symmetric(horizontal: val11x);
  EdgeInsets get paddingHorizontal12x =>
      EdgeInsets.symmetric(horizontal: val12x);
  EdgeInsets get paddingHorizontal13x =>
      EdgeInsets.symmetric(horizontal: val13x);
  EdgeInsets get paddingHorizontal14x =>
      EdgeInsets.symmetric(horizontal: val14x);
  EdgeInsets get paddingHorizontal15x =>
      EdgeInsets.symmetric(horizontal: val15x);

  // Padding Vertical
  EdgeInsets get paddingVertical1x => EdgeInsets.symmetric(vertical: val1x);
  EdgeInsets get paddingVertical2x => EdgeInsets.symmetric(vertical: val2x);
  EdgeInsets get paddingVertical3x => EdgeInsets.symmetric(vertical: val3x);
  EdgeInsets get paddingVertical4x => EdgeInsets.symmetric(vertical: val4x);
  EdgeInsets get paddingVertical5x => EdgeInsets.symmetric(vertical: val5x);
  EdgeInsets get paddingVertical6x => EdgeInsets.symmetric(vertical: val6x);
  EdgeInsets get paddingVertical7x => EdgeInsets.symmetric(vertical: val7x);
  EdgeInsets get paddingVertical8x => EdgeInsets.symmetric(vertical: val8x);
  EdgeInsets get paddingVertical9x => EdgeInsets.symmetric(vertical: val9x);
  EdgeInsets get paddingVertical10x => EdgeInsets.symmetric(vertical: val10x);
  EdgeInsets get paddingVertical11x => EdgeInsets.symmetric(vertical: val11x);
  EdgeInsets get paddingVertical12x => EdgeInsets.symmetric(vertical: val12x);
  EdgeInsets get paddingVertical13x => EdgeInsets.symmetric(vertical: val13x);
  EdgeInsets get paddingVertical14x => EdgeInsets.symmetric(vertical: val14x);
  EdgeInsets get paddingVertical15x => EdgeInsets.symmetric(vertical: val15x);
}

extension RadiusExtension on BuildContext {
  Radius get radius1x => Radius.circular(width * 0.01);
  Radius get radius2x => Radius.circular(width * 0.02);
  Radius get radius3x => Radius.circular(width * 0.03);
  Radius get radius4x => Radius.circular(width * 0.04);
  Radius get radius5x => Radius.circular(width * 0.05);
  Radius get radius6x => Radius.circular(width * 0.06);
  Radius get radius7x => Radius.circular(width * 0.07);
  Radius get radius8x => Radius.circular(width * 0.08);
  Radius get radius9x => Radius.circular(width * 0.09);
  Radius get radius10x => Radius.circular(width * 0.1);
  Radius get radius11x => Radius.circular(width * 0.11);
  Radius get radius12x => Radius.circular(width * 0.12);
  Radius get radius13x => Radius.circular(width * 0.13);
  Radius get radius14x => Radius.circular(width * 0.14);
  Radius get radius15x => Radius.circular(width * 0.15);
}

extension BorderExtension on BuildContext {
  // Border All
  BorderRadius get borderRadius1x => BorderRadius.all(radius1x);
  BorderRadius get borderRadius2x => BorderRadius.all(radius2x);
  BorderRadius get borderRadius3x => BorderRadius.all(radius3x);
  BorderRadius get borderRadius4x => BorderRadius.all(radius4x);
  BorderRadius get borderRadius5x => BorderRadius.all(radius5x);
  BorderRadius get borderRadius6x => BorderRadius.all(radius6x);
  BorderRadius get borderRadius7x => BorderRadius.all(radius7x);
  BorderRadius get borderRadius8x => BorderRadius.all(radius8x);
  BorderRadius get borderRadius9x => BorderRadius.all(radius9x);
  BorderRadius get borderRadius10x => BorderRadius.all(radius10x);
  BorderRadius get borderRadius11x => BorderRadius.all(radius11x);
  BorderRadius get borderRadius12x => BorderRadius.all(radius12x);
  BorderRadius get borderRadius13x => BorderRadius.all(radius13x);
  BorderRadius get borderRadius14x => BorderRadius.all(radius14x);
  BorderRadius get borderRadius15x => BorderRadius.all(radius15x);

  // Border Top
  BorderRadius get borderRadiusTop1x => BorderRadius.vertical(top: radius1x);
  BorderRadius get borderRadiusTop2x => BorderRadius.vertical(top: radius2x);
  BorderRadius get borderRadiusTop3x => BorderRadius.vertical(top: radius3x);
  BorderRadius get borderRadiusTop4x => BorderRadius.vertical(top: radius4x);
  BorderRadius get borderRadiusTop5x => BorderRadius.vertical(top: radius5x);
  BorderRadius get borderRadiusTop6x => BorderRadius.vertical(top: radius6x);
  BorderRadius get borderRadiusTop7x => BorderRadius.vertical(top: radius7x);
  BorderRadius get borderRadiusTop8x => BorderRadius.vertical(top: radius8x);
  BorderRadius get borderRadiusTop9x => BorderRadius.vertical(top: radius9x);
  BorderRadius get borderRadiusTop10x => BorderRadius.vertical(top: radius10x);
  BorderRadius get borderRadiusTop11x => BorderRadius.vertical(top: radius11x);
  BorderRadius get borderRadiusTop12x => BorderRadius.vertical(top: radius12x);
  BorderRadius get borderRadiusTop13x => BorderRadius.vertical(top: radius13x);
  BorderRadius get borderRadiusTop14x => BorderRadius.vertical(top: radius14x);
  BorderRadius get borderRadiusTop15x => BorderRadius.vertical(top: radius15x);

  // Border Bottom
  BorderRadius get borderRadiusBottom1x =>
      BorderRadius.vertical(bottom: radius1x);
  BorderRadius get borderRadiusBottom2x =>
      BorderRadius.vertical(bottom: radius2x);
  BorderRadius get borderRadiusBottom3x =>
      BorderRadius.vertical(bottom: radius3x);
  BorderRadius get borderRadiusBottom4x =>
      BorderRadius.vertical(bottom: radius4x);
  BorderRadius get borderRadiusBottom5x =>
      BorderRadius.vertical(bottom: radius5x);
  BorderRadius get borderRadiusBottom6x =>
      BorderRadius.vertical(bottom: radius6x);
  BorderRadius get borderRadiusBottom7x =>
      BorderRadius.vertical(bottom: radius7x);
  BorderRadius get borderRadiusBottom8x =>
      BorderRadius.vertical(bottom: radius8x);
  BorderRadius get borderRadiusBottom9x =>
      BorderRadius.vertical(bottom: radius9x);
  BorderRadius get borderRadiusBottom10x =>
      BorderRadius.vertical(bottom: radius10x);
  BorderRadius get borderRadiusBottom11x =>
      BorderRadius.vertical(bottom: radius11x);
  BorderRadius get borderRadiusBottom12x =>
      BorderRadius.vertical(bottom: radius12x);
  BorderRadius get borderRadiusBottom13x =>
      BorderRadius.vertical(bottom: radius13x);
  BorderRadius get borderRadiusBottom14x =>
      BorderRadius.vertical(bottom: radius14x);
  BorderRadius get borderRadiusBottom15x =>
      BorderRadius.vertical(bottom: radius15x);
}

extension FontExtension on BuildContext {
  // Fontweights
  FontWeight get fw100 => FontWeight.w100;
  FontWeight get fw200 => FontWeight.w200;
  FontWeight get fw300 => FontWeight.w300;
  FontWeight get fw400 => FontWeight.w400;
  FontWeight get fw500 => FontWeight.w500;
  FontWeight get fw600 => FontWeight.w600;
  FontWeight get fw700 => FontWeight.w700;
  FontWeight get fw800 => FontWeight.w800;
  FontWeight get fw900 => FontWeight.w900;
  FontWeight get fwBold => FontWeight.bold;
  FontWeight get fwNormal => FontWeight.normal;

  // TextAligns
  TextAlign get taStart => TextAlign.start;
  TextAlign get taCenter => TextAlign.center;
  TextAlign get taEnd => TextAlign.end;
  TextAlign get taLeft => TextAlign.left;
  TextAlign get taRight => TextAlign.right;
  TextAlign get taJustify => TextAlign.justify;
}

extension AlignmentExtension on BuildContext {

  // Alignment
  Alignment get alignmentBottomCenter => Alignment.bottomCenter;
  Alignment get alignmentBottomLeft => Alignment.bottomLeft;
  Alignment get alignmentBottomRight => Alignment.bottomRight;
  Alignment get alignmentCenter => Alignment.center;
  Alignment get alignmentCenterLeft => Alignment.centerLeft;
  Alignment get alignmentCenterRight => Alignment.centerRight;
  Alignment get alignmentTopCenter => Alignment.topCenter;
  Alignment get alignmentTopLeft => Alignment.topLeft;
  Alignment get alignmentTopRight => Alignment.topRight;

  // Main Axis
  MainAxisAlignment get mainAxisAStart => MainAxisAlignment.start;
  MainAxisAlignment get mainAxisACenter => MainAxisAlignment.center;
  MainAxisAlignment get mainAxisAEnd => MainAxisAlignment.end;
  MainAxisAlignment get mainAxisASpaceAround => MainAxisAlignment.spaceAround;
  MainAxisAlignment get mainAxisASpaceBetween => MainAxisAlignment.spaceBetween;
  MainAxisAlignment get mainAxisASpaceEvenly => MainAxisAlignment.spaceEvenly;

  // Cross Axis
  CrossAxisAlignment get crossAxisAStart => CrossAxisAlignment.start;
  CrossAxisAlignment get crossAxisACenter => CrossAxisAlignment.center;
  CrossAxisAlignment get crossAxisAEnd => CrossAxisAlignment.end;
  CrossAxisAlignment get crossAxisAStretch => CrossAxisAlignment.stretch;
  CrossAxisAlignment get crossAxisABaseline => CrossAxisAlignment.baseline;

  // Wrap
  WrapCrossAlignment get wrapCrossAStart => WrapCrossAlignment.start;
  WrapCrossAlignment get wrapCrossACenter => WrapCrossAlignment.center;
  WrapCrossAlignment get wrapCrossAEnd => WrapCrossAlignment.end;
}

extension TextInputTypeExtension on BuildContext {
  TextInputType get keyboardDatetime => TextInputType.datetime;
  TextInputType get keyboardEmailAddress => TextInputType.emailAddress;
  TextInputType get keyboardMultiline => TextInputType.multiline;
  TextInputType get keyboardName => TextInputType.name;
  TextInputType get keyboardNone => TextInputType.none;
  TextInputType get keyboardNumber => TextInputType.number;
  TextInputType get keyboardPhone => TextInputType.phone;
  TextInputType get keyboardStreetAddress => TextInputType.streetAddress;
  TextInputType get keyboardText => TextInputType.text;
  TextInputType get keyboardUrl => TextInputType.url;
  TextInputType get keyboardVisiblePassword => TextInputType.visiblePassword;
}

// Sized Boxes
class SpaceSizedHeightBox extends StatelessWidget {
  final double height;

  const SpaceSizedHeightBox({Key? key, required this.height})
      : assert(height > 0 && height <= 1),
        super(key: key);
  @override
  Widget build(BuildContext context) =>
      SizedBox(height: context.height * height);
}

class SpaceSizedWidthBox extends StatelessWidget {
  final double width;

  const SpaceSizedWidthBox({Key? key, required this.width})
      : assert(width > 0 && width <= 1),
        super(key: key);
  @override
  Widget build(BuildContext context) => SizedBox(width: context.width * width);
}

extension SizedBoxExtension on BuildContext {
  // Width Sized Box
  Widget get emptySizedWidthBox1x => const SpaceSizedWidthBox(width: 0.01);
  Widget get emptySizedWidthBox2x => const SpaceSizedWidthBox(width: 0.02);
  Widget get emptySizedWidthBox3x => const SpaceSizedWidthBox(width: 0.03);
  Widget get emptySizedWidthBox4x => const SpaceSizedWidthBox(width: 0.04);
  Widget get emptySizedWidthBox5x => const SpaceSizedWidthBox(width: 0.05);
  Widget get emptySizedWidthBox6x => const SpaceSizedWidthBox(width: 0.06);
  Widget get emptySizedWidthBox7x => const SpaceSizedWidthBox(width: 0.07);
  Widget get emptySizedWidthBox8x => const SpaceSizedWidthBox(width: 0.08);
  Widget get emptySizedWidthBox9x => const SpaceSizedWidthBox(width: 0.09);
  Widget get emptySizedWidthBox10x => const SpaceSizedWidthBox(width: 0.1);
  Widget get emptySizedWidthBox11x => const SpaceSizedWidthBox(width: 0.11);
  Widget get emptySizedWidthBox12x => const SpaceSizedWidthBox(width: 0.12);
  Widget get emptySizedWidthBox13x => const SpaceSizedWidthBox(width: 0.13);
  Widget get emptySizedWidthBox14x => const SpaceSizedWidthBox(width: 0.14);
  Widget get emptySizedWidthBox15x => const SpaceSizedWidthBox(width: 0.15);

  // Height Sized Box
  Widget get emptySizedHeightBox1x => const SpaceSizedHeightBox(height: 0.01);
  Widget get emptySizedHeightBox2x => const SpaceSizedHeightBox(height: 0.02);
  Widget get emptySizedHeightBox3x => const SpaceSizedHeightBox(height: 0.03);
  Widget get emptySizedHeightBox4x => const SpaceSizedHeightBox(height: 0.04);
  Widget get emptySizedHeightBox5x => const SpaceSizedHeightBox(height: 0.05);
  Widget get emptySizedHeightBox6x => const SpaceSizedHeightBox(height: 0.06);
  Widget get emptySizedHeightBox7x => const SpaceSizedHeightBox(height: 0.07);
  Widget get emptySizedHeightBox8x => const SpaceSizedHeightBox(height: 0.08);
  Widget get emptySizedHeightBox9x => const SpaceSizedHeightBox(height: 0.09);
  Widget get emptySizedHeightBox10x => const SpaceSizedHeightBox(height: 0.1);
  Widget get emptySizedHeightBox11x => const SpaceSizedHeightBox(height: 0.11);
  Widget get emptySizedHeightBox12x => const SpaceSizedHeightBox(height: 0.12);
  Widget get emptySizedHeightBox13x => const SpaceSizedHeightBox(height: 0.13);
  Widget get emptySizedHeightBox14x => const SpaceSizedHeightBox(height: 0.14);
  Widget get emptySizedHeightBox15x => const SpaceSizedHeightBox(height: 0.15);
}
