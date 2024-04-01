import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrivacyPoliticsScreen extends StatelessWidget {
  const PrivacyPoliticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          children: [
            Space(
              height: 2.h,
            ),
            CustomAppBar(
              label: LocaleKeys.privacy_policy.tr(),
            ),
            Space(
              height: 3.h,
            ),
            Column(
              children: [
                politicsCard(
                    label:
                        ' بدخولك موقعنا أو التطبيق الخاص بنا وإنشاء حساب يضمن ذلك الموافقة على كافة القواعد الشروط والضمانات والتوجيهات الخاصة بموقعنا وشروط اإلستخدام والدفع والمعامالت المالية وتعتبر شروطا ملزمة بمجرد الموافقة لذلك يرجي قراءتها بعناية .'),
                Space(
                  height: 1.h,
                ),
                politicsCard(
                    label:
                        ' ال يصرح للمستخدمين لمن هم أقل من 18 سنة بإستخدام خدماتنا بهذا الموقع وفى حال إنتحال الصفة او استخدام بيانات غير حقيقية فإن لنا الحق فى حظر دخول المستخدم وحسابه .'),
                Space(
                  height: 1.h,
                ),
                politicsCard(
                    label:
                        ' موقعنا عبارة عن منصة يسمح لك باالستثمار مباشرة في عقار يقدمه طرف ثالث من خالل المنصة .وذلك باعتبارنا متجر عقاري ،نحن ال نمتلك أو نبيع العقارات وال الفرص االستثمارية المعروضة على موقعنا يمكنك امتالك ح ّصة من العقارات ابتدا ًء من 1000 لاير سعودي فقط .'),
                Space(
                  height: 1.h,
                ),
                politicsCard(
                    label:
                        ' سلس العقارية هي منصة وتطبيق إلكتروني يعمل على كافة التطبيقات اإللكترونية وبرامج التصفح وأنظمة الهاتف الجوال المعتمدة عالميا , يعتبر منصة تفاعلية لإلستثمار العقاري واإلستثمار العقاري الجماعي.وذلك باعتبارنا متجر عقاري .'),
                Space(
                  height: 1.h,
                ),
                politicsCard(
                    label:
                        ' منصة سلس العقارية متوفرة للعمل بالمملكة العربية السعودية وبالشرق االوسط وكافة إنحاء العالم ولإلنضمام إلينا والحصول على فرصتك لإلستثمار '),
                Space(
                  height: 1.h,
                ),
                politicsCard(
                    label:
                        ' منصتنا ال تمتلك أو تبيع العقارات أو الفرص االستثمارية المعروضة على موقعنا نحن نقوم بدور الوسيط بعرض العقارات على المنصة وتوفيرها لك كمستثمر بأدنى قيمة إستثمارية هى 1000 لاير سعودي فقط )حوالى 265 دوال ًرا أمريكيًا(. لتحقيق عوائد متوقعة خالل خمس سنوات من إستثمارك معنا .'),
                Space(
                  height: 1.h,
                ),
                politicsCard(
                    label:
                        ' ال يوجد حد أقصي لعدد العقارات التى يمكن أن يستثمر فيها شخص واحد داخل المنصة بشرط مراعاة قواعد الحد األادنى واألقصي لمبالغ اإلستثمار والحد األقصي لنسبة األسهم'),
                Space(
                  height: 1.h,
                ),
                politicsCard(
                    label:
                        ' نحن ندير جميع استثماراتك من بداية إستثمارك حتى إنتهاؤه ببيع العقار والتخارج .'),
                Space(
                  height: 1.h,
                ),
                politicsCard(
                    label:
                        ' تقتصر إمكانية االستثمار في عقار معين على المبلغ اإلجمالي المستهدف لتمويل ذلك العقار لذلك يمكنك شراء أسهم لى عقار لديك فيه أسهم مسبقا '),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget politicsCard({required String label}) {
    return Text(
      label,
      style: AppTheme.mainTextStyle(
        fontSize: 10.sp,
        color: AppTheme.neutral500,
      ),
    );
  }
}
