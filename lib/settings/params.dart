import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryColor = Color(0xFF053354);
Color secondaryColor2 = Color(0xFFF2C94C);
Color secondaryColor = Color(0xEEEDCCA9);
Color primaryColorShade = Color(0xbb144060);
Color accentColor = Color(0xFFF1811E);
Color accentColor2 = Color(0xFF6FCF97);
Color accentColor3 = Color(0xFFF2C94C);

ThemeData myThemed = ThemeData(
    accentColor: secondaryTextColor,
    accentColorBrightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: Colors.teal[900],
      elevation: 0,
      textTheme: TextTheme(
     
      ),
    ),
    buttonColor: Colors.yellow[900],
    primarySwatch: Colors.white,
    fontFamily: 'Roboto');

Color secondaryTextColor = Colors.teal[300];
final TextStyle maintext = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.w400,
  fontSize: 24,
);

final TextStyle subtext = TextStyle(
  color: accentColor,
  fontSize: 14,
);
final TextStyle subtextx = TextStyle(
  color: accentColor2,
  fontSize: 14,
);
final TextStyle subtextxx = TextStyle(
  color: accentColor,
  fontSize: 14,
);
final TextStyle subtext1 = TextStyle(
  color: secondaryColor,
  fontSize: 16,
  fontWeight: FontWeight.w300
);
final TextStyle subtext1x = TextStyle(
  color: accentColor2,
  fontSize: 16,
  fontWeight: FontWeight.w300
);
final TextStyle hinttext = TextStyle(
  color: secondaryColor,
  fontWeight: FontWeight.w100,
  fontSize: 16,
);
final TextStyle hinttextOr = TextStyle(
  color: accentColor,
  fontWeight: FontWeight.w200,
  fontSize: 16,
);
final TextStyle hinttext1 = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.w200,
  fontSize: 14,
);
final TextStyle subtext2 = TextStyle(
  color: secondaryColor,
  fontWeight: FontWeight.w300,
  fontSize: 16,
);
final TextStyle subtext2xy = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
final TextStyle subtext2x = TextStyle(
  color: accentColor2,
  fontWeight: FontWeight.w300,
  fontSize: 16,
);
final TextStyle subtext3 = TextStyle(
  color: secondaryColor,
  fontWeight: FontWeight.w400,
  fontFamily: 'RobotoCondensed',
  fontSize: 18,
);
final TextStyle subtext3y = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.w400,
  fontFamily: 'RobotoCondensed',
  fontSize: 18,
);
final TextStyle subtext3xy = TextStyle(
  color: secondaryColor2,
  fontWeight: FontWeight.w400,
  fontFamily: 'RobotoCondensed',
  fontSize: 18,
);
final TextStyle subtext3xx = TextStyle(
  color: accentColor,
  fontWeight: FontWeight.w400,
  fontFamily: 'RobotoCondensed',
  fontSize: 18,
);
final TextStyle subtext3x = TextStyle(
  color: accentColor2,
  fontWeight: FontWeight.w400,
  fontFamily: 'RobotoCondensed',
  fontSize: 18,
);
final TextStyle subtext4 = TextStyle(
  color: secondaryColor,
  fontWeight: FontWeight.w800,
  fontFamily: 'RobotoCondensedLight',
  fontSize: 20,
);
final TextStyle subtext4x = TextStyle(
  color: accentColor2,
  fontWeight: FontWeight.w800,
  fontFamily: 'RobotoCondensedLight',
  fontSize: 20,
);
final TextStyle subtext5x = TextStyle(
  color: accentColor2,
  fontWeight: FontWeight.w800,
  fontFamily: 'RobotoCondensedLight',
  fontSize: 24,
);
final TextStyle maintext1 = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.w400,
  fontSize: 16,
);
final TextStyle maintext2 = TextStyle(
  color: accentColor,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);
final TextStyle maintext3 = TextStyle(
  color: secondaryColor,
  fontWeight: FontWeight.w400,
  fontFamily: 'Roboto',
  fontSize: 20,
);
final TextStyle maintext3b = TextStyle(
  color: secondaryColor,
  fontWeight: FontWeight.w500,
  fontFamily: 'Roboto',
  fontSize: 26,
);
final TextStyle maintext4 = TextStyle(
  color: secondaryColor,
  fontFamily: 'RobotoSlab',
  fontSize: 34,
);
final TextStyle maintext4x = TextStyle(
  color: secondaryColor2,
  fontFamily: 'RobotoSlab',
  fontSize: 34,
);
final TextStyle maintext5 = TextStyle(
  color: accentColor3,
  fontWeight: FontWeight.bold,
  fontFamily: 'RobotoSlab',
  fontSize: 40,
);
final TextStyle maintext5x = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'RobotoSlab',
  fontSize: 36,
);
final TextStyle maintext4b = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'RobotoSlab',
  fontSize: 26,
);
 var shape= RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: primaryColor));

List pieColors = [
  Colors.indigo[400],
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
];
var icon1 = Icons.sentiment_very_dissatisfied;
var icon2 = Icons.sentiment_dissatisfied;
var icon3 = Icons.sentiment_neutral;
var icon4 = Icons.sentiment_satisfied;
var icon5 = Icons.sentiment_very_satisfied;

Map avatars= {
'GK':Icon(Icons.person,color: Colors.yellow,),
'DF':Icon(Icons.person,color: Colors.blue,),
'DM':Icon(Icons.person,color: Colors.blue,),
'CM':Icon(Icons.person,color: Colors.green,),
'AMF':Icon(Icons.person,color: Colors.green,),
'RMF':Icon(Icons.person,color: Colors.yellow,),
'LMF':Icon(Icons.person,color: Colors.yellow,),
'SS':Icon(Icons.person,color: Colors.yellow,),
'LWF':Icon(Icons.person,color: Colors.yellow,),
'RWF':Icon(Icons.person,color: Colors.yellow,),
'CF':Icon(Icons.person,color: Colors.yellow,),
};



List<Map> moods = [
  {
    'name': 'allDown',
    'allDownValue': 0,
    'iconPath': 'assets/images/alldown.png',
  },
  {
    'name': 'allDown',
    'allDownValue': 0,
    'iconPath': 'assets/images/alldown.png',
  },
  {
    'name': 'weak',
    'weakValue': 2,
    'iconPath': 'assets/images/low.png',
  },
  {
    'name': 'normal',
    'normalValue': 3,
    'iconPath': 'assets/images/normal.png',
  },
  {
    'name': 'good',
    'goodValue': 4,
    'iconPath': 'assets/images/good.png',
  },
  {
    'name': 'excillent',
    'excillentValue': 5,
    'iconPath': 'assets/images/excellent.png',
  }
];
/*List<Map> moodColors = [
  {
    'count59Color': charts.ColorUtil.fromDartColor(Colors.indigo[400]),
    'morningMoodColor': charts.ColorUtil.fromDartColor(Colors.blue[400]),
    'afternoonMoodColor': charts.ColorUtil.fromDartColor(Colors.amber[400]),
    'eveningMoodColor': charts.ColorUtil.fromDartColor(Colors.green[400]),
    'nightMoodColor': charts.ColorUtil.fromDartColor(Colors.deepOrange[400]),
    'stressLevelColor': charts.ColorUtil.fromDartColor(Colors.red[400]),
    'anxietyLevelColor': charts.ColorUtil.fromDartColor(Colors.pink[400]),
    'obsessionLevelColor': charts.ColorUtil.fromDartColor(Colors.lime[400]),
    'sleepLevelColor': charts.ColorUtil.fromDartColor(Colors.brown[400]),
    'dayOVScoreColor': charts.ColorUtil.fromDartColor(Colors.blueAccent[400]),
    'dateColor': charts.ColorUtil.fromDartColor(Colors.redAccent[400]),
    'dayMoodColor': charts.ColorUtil.fromDartColor(Colors.tealAccent[400]),
    'count59NColor': (Colors.indigo[400]),
    'morningMoodNColor': (Colors.blue[400]),
    'afternoonMoodNColor': (Colors.amber[400]),
    'eveningMoodNColor': (Colors.green[400]),
    'nightMoodNColor': (Colors.deepOrange[400]),
    'stressLevelNColor': (Colors.red[400]),
    'anxietyLevelNColor': (Colors.pink[400]),
    'obsessionLevelNColor': (Colors.lime[400]),
    'sleepLevelNColor': (Colors.brown[400]),
    'dayOVScoreNColor': (Colors.blueAccent[400]),
    'dateNColor': (Colors.redAccent[400]),
    'dayMoodNColor': (Colors.tealAccent[400]),
  }
];*/

    String about ='كل من شاهد مباراة لفريق تسكموضين (مثلا) ولو لبرهة، سيندهش ويذهل بالتنظيم الجيد والمهنية العالية في احترام الأدوار والتخصصات. كل يؤدي دوره، وكان أحدا يمتل عصى موسى. وسرعان ما يقودك الإعجاب ويحولك الى مشجع وتنحاز عاطفتك اتجاههم وتنسيك انتمائك، انه سحر التنظيم والانضباط. كل من يعرف فريقنا او شاهده في الميدان تخنقه الحسرة وتمزقه غيرة البلاد لا لأن فريقا انهزم، ولكن لأن هزائمه يصعب استساغها ولأنها تفتقر لبعض المنطق. فالطاقات والمؤهلات الشابة والفتية، التي يزخر بها الفريق كما وكيفا، لا تبرر هزائمه. فتقول في نفسك، ما لذي ينقصنا؟ انه التنظيم ولانضباط.  فكيف لفريق يشارك في بطولة بذلك الحجم، ولم يقم ولو بحصة تدريبية واحدة. (من قطبان العيد الى رقعة الملعب..)  وكيف للاعب سرعان ما ينسى دوره وينصب نفسه تارة مدربا وتارة عميدا للفريق وتارة حكما وتارة .... متهورا....    وكيف لمشجع ينصب نفسه مدربا وموجها وتارة حكما.........كل هذا دون تخصص ولا كفاءة ولا تكليف، ويحسب نفسه بذلك يساعد الفريق بداعي الغيرة على البلاد. بل بذلك يساهم في تعميق الجرح ويساهم تسويق صورة البلد الغير منظم والفريق الغير منضبط والتسيير العشوائي.... فالفريق الذي يفتقر للانضباط والتنظيم فهو منهزم حتى قبل بداية المباراة، فهو منهزم ضد نفسه، ثم في المباراة يلعب مع الخصم ضد نفسه. فكيف لفريق يلعب ضد فريقين ان ينتصر. 22 لاعبا ضد 11. هذا ما يقع لفريقنا. كفى، كفى.. هكذا قلنا في اجتماع اخر مباراة. عقدنا العزم على ان ننتصر على أنفسنا والا نركز على الأهداف التي نستقبلها. فلتنهزم شباكنا وننتصر نحن. كل من تمعن في تلك المباراة سيدرك هذا جيدا. قدمنا نسخة تستحق التنويه. بعدها عقدنا اجتماعا تقييميا للمباراة. ووضعنا اللبنة الأولى لتصور فريق احترافي منظم ومنضبط. بعدها عقدنا سلسلة من الاجتماعات، قمنا فيها بتأسيس: المكتب المسير، الطاقم الإداري. اللجنة التأديبية والانضباط وهيئة المشجعين. بعدها قمنا بصياغة القوانين التنظيمية. وتمت المصادقة عليها. وسيتم انشاء الله موافاتكم بكل مستجد.  \n نرجى التوفيق من العلي القدير. ونرجو المساندة من كل فرد وعنصر لإنجاح هذا المشروع ';
    

  String regulations ='';