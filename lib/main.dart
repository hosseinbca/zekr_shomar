//import 'dart:html';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

var Means = [
  "ای پروردگار جهانیان",
  "ای صاحب جلال و بزرگواری",
  "ای برآورنده حاجت ها",
  "ای مهربان ترین مهربانان",
  "ای زنده، ای پاینده",
  "نیست خدایی جز الله فرمانروای حق و آشکار",
  "خدایا بر محمد و آل محمد درود فرست و در فرج ایشان (حضرت مهدی) تعجیل فرما",
];

var Zekrs = [
  "یا رَبِّ  الْعالَمِین",
  "یا ذَالجَلالِ  وَ  اْلاِکْرام",
  "یا قاضیَ  الحاجات",
  "یا أَرْحَمَ  الرَّاحِمِین",
  "یا حَیُّ  یا قَیّوم",
  "لا إِلهَ إِلَّا اللَّهُ  المَلِک الحقّ المُبین",
  "الّلهُمَّ  صَلِّ  عَلَی مُحَمَّدٍ  وَ آلِ  مُحَمَّدٍ و عجل فرجهم",
];
var Days = [
  "شنبه",
  "یکشنبه",
  "دوشنبه",
  "سه شنبه",
  "چهارشنبه",
  "پنجشنبه",
  "جمعه"
];
int CurrentDay = 0;
var ZekrString = Zekrs[CurrentDay];
var MeanString = Means[CurrentDay];
var DaysCounter = [0, 0, 0, 0, 0, 0, 0];
bool AmarButtonPressed = false;
var AmarButtonTitle = "نمایش هفته";
var CurrentDayString = Days[CurrentDay];
var NextDayString = Days[CurrentDay + 1];
var PreviousDayString = Days[6];

Color BackgroundColor = Color.fromRGBO(20, 41, 50, 1);
Color FieldZekrColor = Color.fromRGBO(244, 162, 38, 1);
Color ZekrStringColor = Color.fromRGBO(20, 41, 50, 1);
Color MeanStringColor = Color.fromRGBO(60, 70, 90, 1);

Color DaysButtonColor = Color.fromRGBO(20, 41, 50, 1);
Color DaysTitleColor = Color.fromRGBO(60, 70, 90, 1);
Color AmarButtonColor = Color.fromRGBO(20, 41, 50, 1);
Color AmarTitleColor = Color.fromRGBO(20, 41, 50, 1);

Color AmarZekrColor = Color.fromRGBO(60, 70, 90, 1);
Color AmarCountColor = Color.fromRGBO(20, 41, 50, 1);
Color ResetAllButtonColor = Color.fromRGBO(250, 0, 0, 1);
Color ResetAllTitleColor = Color.fromRGBO(250, 0, 0, 1);

Color increaseDecreaseButtonColor = Color.fromRGBO(244, 162, 38, 1);
Color CounterColor = Color.fromRGBO(244, 162, 38, 1);

Color AppbarColor = Color.fromRGBO(244, 162, 38, 1);
Color AppbarTiteColor = Color.fromRGBO(20, 41, 50, 1);

class RowInAmar extends StatelessWidget {
  String zekr , day ;
  int count ;
  RowInAmar(this.zekr, this.day, this.count) {}
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "${this.count}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: AmarZekrColor),
                  )),
              Expanded(
                flex: 3,
                child: Text(
                  "${this.zekr}  (${this.day})",
                  style: TextStyle(
                    fontSize: 13,
                    color: AmarCountColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  resetall() {
    setState(() {
      DaysCounter = [0, 0, 0, 0, 0, 0, 0];
      updatestrings(CurrentDay);
    });
  }

  reset() {
    setState(() {
      if (DaysCounter[CurrentDay] > 0) {
        DaysCounter[CurrentDay] = 0;
      }
    });
  }

  decrease() {
    setState(() {
      if (DaysCounter[CurrentDay] > 0) {
        DaysCounter[CurrentDay]--;
      }
    });
  }

  increase() {
    setState(() {
      DaysCounter[CurrentDay]++;
    });
  }

  nextday() {
    setState(() {
      if (CurrentDay == 6) {
        CurrentDay = 0;
        CurrentDayString = Days[CurrentDay];
        AmarButtonTitle = Days[CurrentDay];
        PreviousDayString = Days[6];
        NextDayString = Days[1];
      } else {
        CurrentDay++;
      }
      updatestrings(CurrentDay);
    });
  }

  previousday() {
    setState(() {
      if (CurrentDay == 0) {
        CurrentDay = 6;
      } else {
        CurrentDay--;
      }
      updatestrings(CurrentDay);
    });
  }

  updatestrings(cd) {
    CurrentDayString = Days[cd];
    ZekrString = Zekrs[cd];
    MeanString = Means[cd];
    if (cd == 6) {
      NextDayString = Days[0];
      PreviousDayString = Days[5];
    } else if (cd == 0) {
      NextDayString = Days[1];
      PreviousDayString = Days[6];
    } else {
      NextDayString = Days[cd + 1];
      PreviousDayString = Days[cd - 1];
    }
    if (AmarButtonPressed == true) {
      AmarButtonTitle = "بازگشت";
    } else if (AmarButtonPressed == false) {
      AmarButtonTitle = "نمایش هفته";
    }
  }

  amarbuttonpress() {
    setState(() {
      AmarButtonPressed = !AmarButtonPressed;
      updatestrings(CurrentDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    Container ZekrField = new Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            ZekrString,
            textAlign: TextAlign.center,
            style: TextStyle(color: ZekrStringColor, fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
            left: 20,
            right: 20,
          ),
          child: Text(
            MeanString,
            textAlign: TextAlign.center,
            style: TextStyle(color: MeanStringColor),
          ),
        ),
      ],
    ));

    Container AmarField = new Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RowInAmar(Zekrs[0], Days[0], DaysCounter[0]),
            RowInAmar(Zekrs[1], Days[1], DaysCounter[1]),
            RowInAmar(Zekrs[2], Days[2], DaysCounter[2]),
            RowInAmar(Zekrs[3], Days[3], DaysCounter[3]),
            RowInAmar(Zekrs[4], Days[4], DaysCounter[4]),
            RowInAmar(Zekrs[5], Days[5], DaysCounter[5]),
            RowInAmar(Zekrs[6], Days[6], DaysCounter[6]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      IconButton(
                          color: ResetAllButtonColor,
                          onPressed: () => {resetall()},
                          padding: EdgeInsets.all(0),
                          icon: Icon(Icons.rotate_left, size: 20)),
                      Text(
                        "reset all",
                        style: TextStyle(color: ResetAllTitleColor),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));

    contenttoshow() {
      if (AmarButtonPressed == true) {
        return AmarField;
      } else {
        return ZekrField;
      }
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppbarColor,
              title: Text(
                "${CurrentDayString}",
                style: TextStyle(fontSize: 24, color: AppbarTiteColor),
              ),
            ),
            backgroundColor: BackgroundColor,
            body: Container(
              child: Column(
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        decoration: BoxDecoration(
                            color: FieldZekrColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Column(children: [
                          Expanded(
                              flex: 5,
                              child: Center(
                                  child: (() {
                                return contenttoshow();
                              }()))),
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () => {previousday()},
                                            icon: Icon(
                                              Icons.navigate_before,
                                              size: 40,
                                            ),
                                            color: DaysButtonColor,
                                          ),
                                          Text(
                                            "${PreviousDayString}",
                                            style: TextStyle(
                                                color: DaysTitleColor),
                                          )
                                        ],
                                      ))),
                                  Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              color: AmarButtonColor,
                                              padding: EdgeInsets.all(0),
                                              onPressed: () =>
                                                  {amarbuttonpress()},
                                              icon: Icon(
                                                  Icons.assessment_outlined)),
                                          Text(
                                            "${AmarButtonTitle}",
                                            style: TextStyle(
                                                color: AmarTitleColor),
                                          )
                                        ],
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            color: DaysButtonColor,
                                            padding: EdgeInsets.all(0),
                                            onPressed: () => {nextday()},
                                            icon: Icon(
                                              Icons.navigate_next,
                                              size: 40,
                                            ),
                                          ),
                                          Text(
                                            "${NextDayString}",
                                            style: TextStyle(
                                                color: DaysTitleColor),
                                          )
                                        ],
                                      ))),
                                ],
                              ))
                        ]),
                      )),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  onLongPress: () => {reset()},
                                  child: IconButton(
                                      color: increaseDecreaseButtonColor,
                                      splashRadius: 30,
                                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                                      iconSize: 60,
                                      onPressed: () => {decrease()},
                                      icon: Icon(Icons.remove_circle)))),
                          Expanded(
                            flex: 1,
                            child: Center(
                                child: Container(
                                    child: Text(
                              "${DaysCounter[CurrentDay]}",
                              style:
                                  TextStyle(fontSize: 32, color: CounterColor),
                            ))),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                color: increaseDecreaseButtonColor,
                                padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                                iconSize: 60,
                                onPressed: () => {increase()},
                                icon: Icon(Icons.add_circle)),
                          ),
                        ],
                      ))
                ],
              ),
            )));
  }
}
