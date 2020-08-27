import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

//Color primaryColor = Color(0xFF3B4A30);
Color primaryColor = Color(0xFF1C2929);
Color secondaryColor = Color(0xFF85A2A2);
LinearGradient gradientColor2 = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.blue, Colors.red]);
Color accentColor = Color(0xFF00E472);
Color fontColor = Color(0xFFCEE9BA);
Color whitefontColor = Color(0xFFFFFFFF);
Color orange = Colors.orange;

List<Map<String, dynamic>> squadformation = [
  //4.3.3
  {
    'GKb': Get.height / 50,
    'GKl': Get.width / 2.4,
    'CB4b': Get.height / 7,
    'CB4l': Get.width / 3.5,
    'CB5b': Get.height / 7,
    'CB5l': Get.width / 3.5,
    'LBb': Get.height / 7,
    'LBl': Get.width / 20,
    'RBb': Get.height / 7,
    'RBl': Get.width / 20,
    'CMFb': Get.height / 2.8,
    'CMFl': Get.width / 2.4,
    'DMFb': 200.0,
    'DMFl': 157.0,
    'AMFb': 160.0,
    'AMFl': 157.0,
    'RMFb': Get.height / 2.8,
    'RMFl': Get.width / 20,
    'LMFb': Get.height / 2.8,
    'LMFl': Get.width / 20,
    'SSb': 180.0,
    'SSl': 157.0,
    'LWFb': Get.height / 1.8,
    'LWFl': Get.width / 20,
    'RWFb': Get.height / 1.8,
    'RWFl': Get.width / 20,
    'CFb': Get.height / 1.8,
    'CFl': Get.width / 2.4,
  },
  //4.4.2
  {
    //GoalKeeper
    'GKb': 10.0,
    'GKl': 155.0,
    // Defese
    'CB4b': 120.0,
    'CB4l': 20.0,
// Defese
    'CB5b': 120.0,
    'CB5l': 110.0,
// Defese
    'LBb': 120.0,
    'LBl': 20.0,
// Defese
    'RBb': 120.0,
    'RBl': 20.0,
    // Centre MidFielders
    'CMFb': 260.0,
    'CMFl': 80.0,
    // Defesive Midfielder
    'DMFb': 220.0,
    'DMFl': 130.0,
    // Advansive Midfielder
    'AMFb': 160.0,
    'AMFl': 157.0,
    // Right Midfielder
    'RMFb': 260.0,
    'RMFl': 20.0,
    // Left Midfielder
    'LMFb': 220.0,
    'LMFl': 120.0,
// Second Striker
    'SSb': 180.0,
    'SSl': 157.0,
    // Left Wing Forward
    'LWFb': 220.0,
    'LWFl': 20.0,
    // Right Wing Forward
    'RWFb': 80.0,
    'RWFl': 80.0,
    // Central Forward
    'CFb': 80.0,
    'CFl': 80.0,
  },
  //4.2.3.1
  {
    //GoalKeeper
    'GKb': 10.0,
    'GKl': 155.0,
    // Defese
    'CB4b': 100.0,
    'CB4l': 20.0,
// Defese
    'CB5b': 100.0,
    'CB5l': 100.0,
// Defese
    'LBb': 100.0,
    'LBl': 20.0,
// Defese
    'RBb': 100.0,
    'RBl': 20.0,
    // Centre MidFielders
    'CMFb': 200.0,
    'CMFl': 100.0,
    // Defese
    'DMFb': 200.0,
    'DMFl': 200.0,
    // Defese
    'AMFb': 160.0,
    'AMFl': 157.0,
    // Defese
    'RMFb': 300.0,
    'RMFl': 157.0,
    // Defese
    'LMFb': 200.0,
    'LMFl': 100.0,
// Defese
    'SSb': 180.0,
    'SSl': 157.0,
    // Defese
    'LWFb': 200.0,
    'LWFl': 20.0,
    // Defese
    'RWFb': 200.0,
    'RWFl': 20.0,
    // Defese
    'CFb': 60.0,
    'CFl': 157.0,
  }
];
List<Map<String, dynamic>> squadformastion = [
  //4.3.3
  {
    'GKb': 8.0,
    'GKl': 155.0,
    'CB4b': 120.0,
    'CB4l': 20.0,
    'CB5b': 120.0,
    'CB5l': 110.0,
    'LBb': 120.0,
    'LBl': 20.0,
    'RBb': 120.0,
    'RBl': 20.0,
    'CMFb': 260.0,
    'CMFl': 155.0,
    'DMFb': 200.0,
    'DMFl': 157.0,
    'AMFb': 160.0,
    'AMFl': 157.0,
    'RMFb': 260.0,
    'RMFl': 20.0,
    'LMFb': 260.0,
    'LMFl': 20.0,
    'SSb': 180.0,
    'SSl': 157.0,
    'LWFb': 120.0,
    'LWFl': 20.0,
    'RWFb': 120.0,
    'RWFl': 20.0,
    'CFb': 60.0,
    'CFl': 157.0,
  },
  //4.4.2
  {
    //GoalKeeper
    'GKb': 10.0,
    'GKl': 155.0,
    // Defese
    'CB4b': 120.0,
    'CB4l': 20.0,
// Defese
    'CB5b': 120.0,
    'CB5l': 110.0,
// Defese
    'LBb': 120.0,
    'LBl': 20.0,
// Defese
    'RBb': 120.0,
    'RBl': 20.0,
    // Centre MidFielders
    'CMFb': 260.0,
    'CMFl': 80.0,
    // Defesive Midfielder
    'DMFb': 220.0,
    'DMFl': 130.0,
    // Advansive Midfielder
    'AMFb': 160.0,
    'AMFl': 157.0,
    // Right Midfielder
    'RMFb': 260.0,
    'RMFl': 20.0,
    // Left Midfielder
    'LMFb': 220.0,
    'LMFl': 120.0,
// Second Striker
    'SSb': 180.0,
    'SSl': 157.0,
    // Left Wing Forward
    'LWFb': 220.0,
    'LWFl': 20.0,
    // Right Wing Forward
    'RWFb': 80.0,
    'RWFl': 80.0,
    // Central Forward
    'CFb': 80.0,
    'CFl': 80.0,
  },
  //4.2.3.1
  {
    //GoalKeeper
    'GKb': 10.0,
    'GKl': 155.0,
    // Defese
    'CB4b': 100.0,
    'CB4l': 20.0,
// Defese
    'CB5b': 100.0,
    'CB5l': 100.0,
// Defese
    'LBb': 100.0,
    'LBl': 20.0,
// Defese
    'RBb': 100.0,
    'RBl': 20.0,
    // Centre MidFielders
    'CMFb': 200.0,
    'CMFl': 100.0,
    // Defese
    'DMFb': 200.0,
    'DMFl': 200.0,
    // Defese
    'AMFb': 160.0,
    'AMFl': 157.0,
    // Defese
    'RMFb': 300.0,
    'RMFl': 157.0,
    // Defese
    'LMFb': 200.0,
    'LMFl': 100.0,
// Defese
    'SSb': 180.0,
    'SSl': 157.0,
    // Defese
    'LWFb': 200.0,
    'LWFl': 20.0,
    // Defese
    'RWFb': 200.0,
    'RWFl': 20.0,
    // Defese
    'CFb': 60.0,
    'CFl': 157.0,
  }
];
Map<String, dynamic> positions = {
  'GK': 'a',
  'CB': 'd',
  'CB5': 'e',
  'LB': 'c',
  'RB': 'b',
  'CMF': 'h',
  'DMF': 'f',
  'AMF': 'n',
  'RMF': 'i',
  'LMF': 'g',
  'SS': 'k',
  'LWF': 'j',
  'RWF': 'l',
  'CF': 'm',
};
Map<String, dynamic> toArabic = {
  'GK': 'حارس مرمى',
  'CB': 'مدافع اوسط',
  'LB': 'مدافع ايسر',
  'RB': 'مدافع ايمن',
  'CMF': 'وسط ميدان',
  'DMF': 'وسط ميدان مدافع',
  'AMF': 'وسط متقدم',
  'RMF': 'وسط ايمن',
  'LMF': 'وسط ايسر',
  'SS': 'وراء مهاجم',
  'LWF': 'جناح ايسر',
  'RWF': 'جناح ايمن',
  'CF': 'مهاجم صريح',
};

String about =
    'كل من شاهد مباراة لفريق تسكموضين (مثلا) ولو لبرهة، سيندهش ويذهل بالتنظيم الجيد والمهنية العالية في احترام الأدوار والتخصصات. كل يؤدي دوره، وكان أحدا يمتل عصى موسى. وسرعان ما يقودك الإعجاب ويحولك الى مشجع وتنحاز عاطفتك اتجاههم وتنسيك انتمائك، انه سحر التنظيم والانضباط. كل من يعرف فريقنا او شاهده في الميدان تخنقه الحسرة وتمزقه غيرة البلاد لا لأن فريقا انهزم، ولكن لأن هزائمه يصعب استساغها ولأنها تفتقر لبعض المنطق. فالطاقات والمؤهلات الشابة والفتية، التي يزخر بها الفريق كما وكيفا، لا تبرر هزائمه. فتقول في نفسك، ما لذي ينقصنا؟ انه التنظيم ولانضباط.  فكيف لفريق يشارك في بطولة بذلك الحجم، ولم يقم ولو بحصة تدريبية واحدة. (من قطبان العيد الى رقعة الملعب..)  وكيف للاعب سرعان ما ينسى دوره وينصب نفسه تارة مدربا وتارة عميدا للفريق وتارة حكما وتارة .... متهورا....    وكيف لمشجع ينصب نفسه مدربا وموجها وتارة حكما.........كل هذا دون تخصص ولا كفاءة ولا تكليف، ويحسب نفسه بذلك يساعد الفريق بداعي الغيرة على البلاد. بل بذلك يساهم في تعميق الجرح ويساهم تسويق صورة البلد الغير منظم والفريق الغير منضبط والتسيير العشوائي.... فالفريق الذي يفتقر للانضباط والتنظيم فهو منهزم حتى قبل بداية المباراة، فهو منهزم ضد نفسه، ثم في المباراة يلعب مع الخصم ضد نفسه. فكيف لفريق يلعب ضد فريقين ان ينتصر. 22 لاعبا ضد 11. هذا ما يقع لفريقنا. كفى، كفى.. هكذا قلنا في اجتماع اخر مباراة. عقدنا العزم على ان ننتصر على أنفسنا والا نركز على الأهداف التي نستقبلها. فلتنهزم شباكنا وننتصر نحن. كل من تمعن في تلك المباراة سيدرك هذا جيدا. قدمنا نسخة تستحق التنويه. بعدها عقدنا اجتماعا تقييميا للمباراة. ووضعنا اللبنة الأولى لتصور فريق احترافي منظم ومنضبط. بعدها عقدنا سلسلة من الاجتماعات، قمنا فيها بتأسيس: المكتب المسير، الطاقم الإداري. اللجنة التأديبية والانضباط وهيئة المشجعين. بعدها قمنا بصياغة القوانين التنظيمية. وتمت المصادقة عليها. وسيتم انشاء الله موافاتكم بكل مستجد.  \n نرجى التوفيق من العلي القدير. ونرجو المساندة من كل فرد وعنصر لإنجاح هذا المشروع ';
