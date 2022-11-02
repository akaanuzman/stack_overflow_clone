import 'package:flutter/material.dart';

import '../../base/base_singleton.dart';


class MyColors with BaseSingleton {
  static MyColors? _instance;
  static MyColors get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = MyColors.init();
      return _instance!;
    }
  }

  MyColors.init();


  /// Your Colors
  Color get primaryBoxShadowColor => const Color(0x1a208dfe);

  /// Flutter Colors [You can use all flutter colors basicly].
  // White
  Color get white => Colors.white;
  Color get white10 => Colors.white10;
  Color get white12 => Colors.white12;
  Color get white24 => Colors.white24;
  Color get white30 => Colors.white30;
  Color get white38 => Colors.white38;
  Color get white54 => Colors.white54;
  Color get white60 => Colors.white60;
  Color get white70 => Colors.white70;

  // Black
  Color get black => Colors.black;
  Color get black12 => Colors.black12;
  Color get black26 => Colors.black26;
  Color get black38 => Colors.black38;
  Color get black45 => Colors.black45;
  Color get black54 => Colors.black54;
  Color get black87 => Colors.black87;

  // Amber & Amber Accent
  Color get amber => Colors.amber;
  Color get amber05 => Colors.amber.shade50;
  Color get amber1 => Colors.amber.shade100;
  Color get amber2 => Colors.amber.shade200;
  Color get amber3 => Colors.amber.shade300;
  Color get amber4 => Colors.amber.shade400;
  Color get amber5 => Colors.amber.shade500;
  Color get amber6 => Colors.amber.shade600;
  Color get amber7 => Colors.amber.shade700;
  Color get amber8 => Colors.amber.shade800;
  Color get amber9 => Colors.amber.shade900;
  Color get amberAccent => Colors.amberAccent;
  Color get amberAccent1 => Colors.amberAccent.shade100;
  Color get amberAccent2 => Colors.amberAccent.shade200;
  Color get amberAccent4 => Colors.amberAccent.shade400;
  Color get amberAccent7 => Colors.amberAccent.shade700;

  // Blue & Blue Accent
  Color get blue => Colors.blue;
  Color get blue05 => Colors.blue.shade50;
  Color get blue1 => Colors.blue.shade100;
  Color get blue2 => Colors.blue.shade200;
  Color get blue3 => Colors.blue.shade300;
  Color get blue4 => Colors.blue.shade400;
  Color get blue5 => Colors.blue.shade500;
  Color get blue6 => Colors.blue.shade600;
  Color get blue7 => Colors.blue.shade700;
  Color get blue8 => Colors.blue.shade800;
  Color get blue9 => Colors.blue.shade900;
  Color get blueAccent => Colors.blueAccent;
  Color get blueAccent1 => Colors.blueAccent.shade100;
  Color get blueAccent2 => Colors.blueAccent.shade200;
  Color get blueAccent4 => Colors.blueAccent.shade400;
  Color get blueAccent7 => Colors.blueAccent.shade700;

  // Blue Grey
  Color get blueGrey => Colors.blueGrey;
  Color get blueGrey05 => Colors.blueGrey.shade50;
  Color get blueGrey1 => Colors.blueGrey.shade100;
  Color get blueGrey2 => Colors.blueGrey.shade200;
  Color get blueGrey3 => Colors.blueGrey.shade300;
  Color get blueGrey4 => Colors.blueGrey.shade400;
  Color get blueGrey5 => Colors.blueGrey.shade500;
  Color get blueGrey6 => Colors.blueGrey.shade600;
  Color get blueGrey7 => Colors.blueGrey.shade700;
  Color get blueGrey8 => Colors.blueGrey.shade800;
  Color get blueGrey9 => Colors.blueGrey.shade900;

  // Brown
  Color get brown => Colors.brown;
  Color get brown05 => Colors.brown.shade50;
  Color get brown1 => Colors.brown.shade100;
  Color get brown2 => Colors.brown.shade200;
  Color get brown3 => Colors.brown.shade300;
  Color get brown4 => Colors.brown.shade400;
  Color get brown5 => Colors.brown.shade500;
  Color get brown6 => Colors.brown.shade600;
  Color get brown7 => Colors.brown.shade700;
  Color get brown8 => Colors.brown.shade800;
  Color get brown9 => Colors.brown.shade900;

  // Cyan && Cyan Accent
  Color get cyan => Colors.cyan;
  Color get cyan05 => Colors.cyan.shade50;
  Color get cyan1 => Colors.cyan.shade100;
  Color get cyan2 => Colors.cyan.shade200;
  Color get cyan3 => Colors.cyan.shade300;
  Color get cyan4 => Colors.cyan.shade400;
  Color get cyan5 => Colors.cyan.shade500;
  Color get cyan6 => Colors.cyan.shade600;
  Color get cyan7 => Colors.cyan.shade700;
  Color get cyan8 => Colors.cyan.shade800;
  Color get cyan9 => Colors.cyan.shade900;
  Color get cyanAccent => Colors.cyanAccent;
  Color get cyanAccent1 => Colors.cyanAccent.shade100;
  Color get cyanAccent2 => Colors.cyanAccent.shade200;
  Color get cyanAccent4 => Colors.cyanAccent.shade400;
  Color get cyanAccent7 => Colors.cyanAccent.shade700;

  // Deep Orange & Deep Orange Accent
  Color get deepOrange => Colors.deepOrange;
  Color get deepOrange05 => Colors.deepOrange.shade50;
  Color get deepOrange1 => Colors.deepOrange.shade100;
  Color get deepOrange2 => Colors.deepOrange.shade200;
  Color get deepOrange3 => Colors.deepOrange.shade300;
  Color get deepOrange4 => Colors.deepOrange.shade400;
  Color get deepOrange5 => Colors.deepOrange.shade500;
  Color get deepOrange6 => Colors.deepOrange.shade600;
  Color get deepOrange7 => Colors.deepOrange.shade700;
  Color get deepOrange8 => Colors.deepOrange.shade800;
  Color get deepOrange9 => Colors.deepOrange.shade900;
  Color get deepOrangeAccent => Colors.deepOrangeAccent;
  Color get deepOrangeAccent1 => Colors.deepOrangeAccent.shade100;
  Color get deepOrangeAccent2 => Colors.deepOrangeAccent.shade200;
  Color get deepOrangeAccent4 => Colors.deepOrangeAccent.shade400;
  Color get deepOrangeAccent7 => Colors.deepOrangeAccent.shade700;

  // Deep Purple & Deep Purple Accent
  Color get deepPurple => Colors.deepPurple;
  Color get deepPurple05 => Colors.deepPurple.shade50;
  Color get deepPurple1 => Colors.deepPurple.shade100;
  Color get deepPurple2 => Colors.deepPurple.shade200;
  Color get deepPurple3 => Colors.deepPurple.shade300;
  Color get deepPurple4 => Colors.deepPurple.shade400;
  Color get deepPurple5 => Colors.deepPurple.shade500;
  Color get deepPurple6 => Colors.deepPurple.shade600;
  Color get deepPurple7 => Colors.deepPurple.shade700;
  Color get deepPurple8 => Colors.deepPurple.shade800;
  Color get deepPurple9 => Colors.deepPurple.shade900;
  Color get deepPurpleAccent => Colors.deepPurpleAccent;
  Color get deepPurpleAccent1 => Colors.deepPurpleAccent.shade100;
  Color get deepPurpleAccent2 => Colors.deepPurpleAccent.shade200;
  Color get deepPurpleAccent4 => Colors.deepPurpleAccent.shade400;
  Color get deepPurpleAccent7 => Colors.deepPurpleAccent.shade700;

  // Green && Green Accent
  Color get green => Colors.green;
  Color get green05 => Colors.green.shade50;
  Color get green1 => Colors.green.shade100;
  Color get green2 => Colors.green.shade200;
  Color get green3 => Colors.green.shade300;
  Color get green4 => Colors.green.shade400;
  Color get green5 => Colors.green.shade500;
  Color get green6 => Colors.green.shade600;
  Color get green7 => Colors.green.shade700;
  Color get green8 => Colors.green.shade800;
  Color get green9 => Colors.green.shade900;
  Color get greenAccent => Colors.greenAccent;
  Color get greenAccent1 => Colors.greenAccent.shade100;
  Color get greenAccent2 => Colors.greenAccent.shade200;
  Color get greenAccent4 => Colors.greenAccent.shade400;
  Color get greenAccent7 => Colors.greenAccent.shade700;

  // Grey
  Color get grey => Colors.grey;
  Color get grey05 => Colors.grey.shade50;
  Color get grey1 => Colors.grey.shade100;
  Color get grey2 => Colors.grey.shade200;
  Color get grey3 => Colors.grey.shade300;
  Color get grey4 => Colors.grey.shade400;
  Color get grey5 => Colors.grey.shade500;
  Color get grey6 => Colors.grey.shade600;
  Color get grey7 => Colors.grey.shade700;
  Color get grey8 => Colors.grey.shade800;
  Color get grey9 => Colors.grey.shade900;

  // Indigo && Indigo Accent
  Color get indigo => Colors.indigo;
  Color get indigo05 => Colors.indigo.shade50;
  Color get indigo1 => Colors.indigo.shade100;
  Color get indigo2 => Colors.indigo.shade200;
  Color get indigo3 => Colors.indigo.shade300;
  Color get indigo4 => Colors.indigo.shade400;
  Color get indigo5 => Colors.indigo.shade500;
  Color get indigo6 => Colors.indigo.shade600;
  Color get indigo7 => Colors.indigo.shade700;
  Color get indigo8 => Colors.indigo.shade800;
  Color get indigo9 => Colors.indigo.shade900;
  Color get indigoAccent => Colors.indigoAccent;
  Color get indigoAccent1 => Colors.indigoAccent.shade100;
  Color get indigoAccent2 => Colors.indigoAccent.shade200;
  Color get indigoAccent4 => Colors.indigoAccent.shade400;
  Color get indigoAccent7 => Colors.indigoAccent.shade700;

  // Light Blue & Light Blue Accent
  Color get lightBlue => Colors.lightBlue;
  Color get lightBlue05 => Colors.lightBlue.shade50;
  Color get lightBlue1 => Colors.lightBlue.shade100;
  Color get lightBlue2 => Colors.lightBlue.shade200;
  Color get lightBlue3 => Colors.lightBlue.shade300;
  Color get lightBlue4 => Colors.lightBlue.shade400;
  Color get lightBlue5 => Colors.lightBlue.shade500;
  Color get lightBlue6 => Colors.lightBlue.shade600;
  Color get lightBlue7 => Colors.lightBlue.shade700;
  Color get lightBlue8 => Colors.lightBlue.shade800;
  Color get lightBlue9 => Colors.lightBlue.shade900;
  Color get lightBlueAccent => Colors.lightBlueAccent;
  Color get lightBlueAccent1 => Colors.lightBlueAccent.shade100;
  Color get lightBlueAccent2 => Colors.lightBlueAccent.shade200;
  Color get lightBlueAccent4 => Colors.lightBlueAccent.shade400;
  Color get lightBlueAccent7 => Colors.lightBlueAccent.shade700;

  // List Green & Light Green Accent
  Color get lightGreen => Colors.lightGreen;
  Color get lightGreen05 => Colors.lightGreen.shade50;
  Color get lightGreen1 => Colors.lightGreen.shade100;
  Color get lightGreen2 => Colors.lightGreen.shade200;
  Color get lightGreen3 => Colors.lightGreen.shade300;
  Color get lightGreen4 => Colors.lightGreen.shade400;
  Color get lightGreen5 => Colors.lightGreen.shade500;
  Color get lightGreen6 => Colors.lightGreen.shade600;
  Color get lightGreen7 => Colors.lightGreen.shade700;
  Color get lightGreen8 => Colors.lightGreen.shade800;
  Color get lightGreen9 => Colors.lightGreen.shade900;
  Color get lightGreenAccent => Colors.lightGreenAccent;
  Color get lightGreenAccent1 => Colors.lightGreenAccent.shade100;
  Color get lightGreenAccent2 => Colors.lightGreenAccent.shade200;
  Color get lightGreenAccent4 => Colors.lightGreenAccent.shade400;
  Color get lightGreenAccent7 => Colors.lightGreenAccent.shade700;

  // Lime & Lime Accent
  Color get lime => Colors.lime;
  Color get lime05 => Colors.lime.shade50;
  Color get lime1 => Colors.lime.shade100;
  Color get lime2 => Colors.lime.shade200;
  Color get lime3 => Colors.lime.shade300;
  Color get lime4 => Colors.lime.shade400;
  Color get lime5 => Colors.lime.shade500;
  Color get lime6 => Colors.lime.shade600;
  Color get lime7 => Colors.lime.shade700;
  Color get lime8 => Colors.lime.shade800;
  Color get lime9 => Colors.lime.shade900;
  Color get limeAccent => Colors.limeAccent;
  Color get limeAccent1 => Colors.limeAccent.shade100;
  Color get limeAccent2 => Colors.limeAccent.shade200;
  Color get limeAccent4 => Colors.limeAccent.shade400;
  Color get limeAccent7 => Colors.limeAccent.shade700;

  // Orange && Orange Accent
  Color get orange => Colors.orange;
  Color get orange05 => Colors.orange.shade50;
  Color get orange1 => Colors.orange.shade100;
  Color get orange2 => Colors.orange.shade200;
  Color get orange3 => Colors.orange.shade300;
  Color get orange4 => Colors.orange.shade400;
  Color get orange5 => Colors.orange.shade500;
  Color get orange6 => Colors.orange.shade600;
  Color get orange7 => Colors.orange.shade700;
  Color get orange8 => Colors.orange.shade800;
  Color get orange9 => Colors.orange.shade900;
  Color get orangeAccent => Colors.orangeAccent;
  Color get orangeAccent1 => Colors.orangeAccent.shade100;
  Color get orangeAccent2 => Colors.orangeAccent.shade200;
  Color get orangeAccent4 => Colors.orangeAccent.shade400;
  Color get orangeAccent7 => Colors.orangeAccent.shade700;

  // Pink && Pink Accent
  Color get pink => Colors.pink;
  Color get pink05 => Colors.pink.shade50;
  Color get pink1 => Colors.pink.shade100;
  Color get pink2 => Colors.pink.shade200;
  Color get pink3 => Colors.pink.shade300;
  Color get pink4 => Colors.pink.shade400;
  Color get pink5 => Colors.pink.shade500;
  Color get pink6 => Colors.pink.shade600;
  Color get pink7 => Colors.pink.shade700;
  Color get pink8 => Colors.pink.shade800;
  Color get pink9 => Colors.pink.shade900;
  Color get pinkAccent => Colors.pinkAccent;
  Color get pinkAccent1 => Colors.pinkAccent.shade100;
  Color get pinkAccent2 => Colors.pinkAccent.shade200;
  Color get pinkAccent4 => Colors.pinkAccent.shade400;
  Color get pinkAccent7 => Colors.pinkAccent.shade700;

  // Purple && Purple Accent
  Color get purple => Colors.purple;
  Color get purple05 => Colors.purple.shade50;
  Color get purple1 => Colors.purple.shade100;
  Color get purple2 => Colors.purple.shade200;
  Color get purple3 => Colors.purple.shade300;
  Color get purple4 => Colors.purple.shade400;
  Color get purple5 => Colors.purple.shade500;
  Color get purple6 => Colors.purple.shade600;
  Color get purple7 => Colors.purple.shade700;
  Color get purple8 => Colors.purple.shade800;
  Color get purple9 => Colors.purple.shade900;
  Color get purpleAccent => Colors.purpleAccent;
  Color get purpleAccent1 => Colors.purpleAccent.shade100;
  Color get purpleAccent2 => Colors.purpleAccent.shade200;
  Color get purpleAccent4 => Colors.purpleAccent.shade400;
  Color get purpleAccent7 => Colors.purpleAccent.shade700;

  // Red && Red Accent
  Color get red => Colors.red;
  Color get red05 => Colors.red.shade50;
  Color get red1 => Colors.red.shade100;
  Color get red2 => Colors.red.shade200;
  Color get red3 => Colors.red.shade300;
  Color get red4 => Colors.red.shade400;
  Color get red5 => Colors.red.shade500;
  Color get red6 => Colors.red.shade600;
  Color get red7 => Colors.red.shade700;
  Color get red8 => Colors.red.shade800;
  Color get red9 => Colors.red.shade900;
  Color get redAccent => Colors.redAccent;
  Color get redAccent1 => Colors.redAccent.shade100;
  Color get redAccent2 => Colors.redAccent.shade200;
  Color get redAccent4 => Colors.redAccent.shade400;
  Color get redAccent7 => Colors.redAccent.shade700;

  // Teal && Teal Accent
  Color get teal => Colors.teal;
  Color get teal05 => Colors.teal.shade50;
  Color get teal1 => Colors.teal.shade100;
  Color get teal2 => Colors.teal.shade200;
  Color get teal3 => Colors.teal.shade300;
  Color get teal4 => Colors.teal.shade400;
  Color get teal5 => Colors.teal.shade500;
  Color get teal6 => Colors.teal.shade600;
  Color get teal7 => Colors.teal.shade700;
  Color get teal8 => Colors.teal.shade800;
  Color get teal9 => Colors.teal.shade900;
  Color get tealAccent => Colors.tealAccent;
  Color get tealAccent1 => Colors.tealAccent.shade100;
  Color get tealAccent2 => Colors.tealAccent.shade200;
  Color get tealAccent4 => Colors.tealAccent.shade400;
  Color get tealAccent7 => Colors.tealAccent.shade700;

  // Yellow && Yellow Accent
  Color get yellow => Colors.yellow;
  Color get yellow05 => Colors.yellow.shade50;
  Color get yellow1 => Colors.yellow.shade100;
  Color get yellow2 => Colors.yellow.shade200;
  Color get yellow3 => Colors.yellow.shade300;
  Color get yellow4 => Colors.yellow.shade400;
  Color get yellow5 => Colors.yellow.shade500;
  Color get yellow6 => Colors.yellow.shade600;
  Color get yellow7 => Colors.yellow.shade700;
  Color get yellow8 => Colors.yellow.shade800;
  Color get yellow9 => Colors.yellow.shade900;
  Color get yellowAccent => Colors.yellowAccent;
  Color get yellowAccent1 => Colors.yellowAccent.shade100;
  Color get yellowAccent2 => Colors.yellowAccent.shade200;
  Color get yellowAccent4 => Colors.yellowAccent.shade400;
  Color get yellowAccent7 => Colors.yellowAccent.shade700;

  // Transparent
  Color get transparent => Colors.transparent;

}
