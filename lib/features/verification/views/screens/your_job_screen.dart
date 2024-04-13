import 'package:Mawthoq/features/verification/views/components/verfication_steps_button.dart';
import 'package:Mawthoq/features/verification/views/screens/terms&conditions_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_drop_down.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../account/views/components/custom_app_bar.dart';
import '../../data/utils/employment_status.dart';
import '../blocs/verification_cubit.dart';

class YourJobScreen extends StatelessWidget {
  void navigateToTermsAndConditionsScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => TermsAndConditionsScreen()));
  }

  const YourJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        shrinkWrap: true,
        children: [
          Space(
            height: 2.h,
          ),
          CustomAppBar(label: ""),
          Space(
            height: 3.h,
          ),
          Text(
            LocaleKeys.your_job_text,
            style: AppTheme.mainTextStyle(
                fontSize: 18.sp,
                color: AppTheme.secondary900,
                fontWeight: FontWeight.w600),
          ).tr(),
          Space(
            height: 1.h,
          ),
          Text(
            LocaleKeys.your_job_sub_text,
            style: AppTheme.mainTextStyle(
              fontSize: 11.sp,
              color: AppTheme.neutral500,
            ),
          ).tr(),
          Space(
            height: 2.h,
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.w),
            margin: EdgeInsets.only(bottom: 3.h),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.5.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white),
            child: BlocBuilder<VerificationCubit,VerificationState>(
              builder: (context, state) {
                return Form(
                  key: context.read<VerificationCubit>().yourJobFromKey,
                  child: Column(
                            children: [

                              CustomDropDown(
                                width : 86.w,
                                menuItems: context.read<VerificationCubit>().employmentStatusList,
                                selectedItem: context.read<VerificationCubit>().employmentStatus,
                                onChanged : (value) => context.read<VerificationCubit>().onEmploymentStatusChange(value),
                                hint: LocaleKeys.employed_status.tr(),
                              ),

                              Space(
                                height: 2.h,
                              ),

                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)
                              CustomTextField(
                                controller: context.read<VerificationCubit>().employmentCompanyController,
                                validator: (_)=> context.read<VerificationCubit>().validateTextField(_!),
                                fillColor: Colors.transparent,
                                label: LocaleKeys.name_of_work_place.tr(),
                              ),

                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)
                                Space(
                                height: 2.h,
                              ),

                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)
                                CustomTextField(
                                  controller: context.read<VerificationCubit>().employmentOwnerController,
                                  validator: (_)=> context.read<VerificationCubit>().validateTextField(_!),
                                fillColor: Colors.transparent,
                                label: LocaleKeys.name_of_work_owner.tr(),
                              ),
                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)
                                Space(
                                height: 2.h,
                              ),
                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)
                                CustomTextField(
                                  controller: context.read<VerificationCubit>().employmentAddressController,
                                  validator: (_)=> context.read<VerificationCubit>().validateTextField(_!),
                                fillColor: Colors.transparent,
                                label: LocaleKeys.address_of_work.tr(),
                              ),
                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)

                                Space(
                                height: 2.h,
                              ),
                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)
                                CustomTextField(
                                  controller: context.read<VerificationCubit>().employmentTitleController,
                                  validator: (_)=> context.read<VerificationCubit>().validateTextField(_!),
                                fillColor: Colors.transparent,
                                label: LocaleKeys.your_job_title.tr(),
                              ),
                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)

                                Space(
                                height: 2.h,
                              ),
                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)
                                CustomTextField(
                                  controller: context.read<VerificationCubit>().employmentDomainController,
                                  validator: (_)=> context.read<VerificationCubit>().validateTextField(_!),
                                fillColor: Colors.transparent,
                                label: LocaleKeys.your_job_field.tr(),
                              ),
                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.employee)
                                Space(
                                height: 2.h,
                              ),

                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.freelancer)
                                CustomTextField(
                                  controller: context.read<VerificationCubit>().freelancerUrlController,
                                  validator: (_)=> context.read<VerificationCubit>().validateTextField(_!),
                                  fillColor: Colors.transparent,
                                  label: LocaleKeys.your_freelance_url.tr(),
                                ),
                              if(context.read<VerificationCubit>().employmentStatus?.value == EmploymentStatus.freelancer)
                                Space(
                                  height: 2.h,
                                ),


                              CustomDropDown(
                                width : 86.w,
                                menuItems: context.read<VerificationCubit>().incomeSourceList,
                                selectedItem: context.read<VerificationCubit>().incomeSource,
                                onChanged : (value) => context.read<VerificationCubit>().onIncomeSourceChange(value),
                                hint: LocaleKeys.your_main_income.tr(),
                              ),


                            ],
                          ),
                );
              },
            ),
          ),

          BlocConsumer<VerificationCubit,VerificationState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MainButton(
                color: AppTheme.primary900,
                width: 86.w,
                height: 6.h,
                label: (state is VerificationIsLoading)? CustomProgressIndicator(
                  color: AppTheme.neutral100,
                ) : Text(
                  LocaleKeys.next,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.secondary900, fontSize: 12.sp),
                ).tr(),
                onTap: ()=> context.read<VerificationCubit>().step3(context),
              );
            },
          ),

          Space(
            height: 10.h,
          ),

        ],
      ),
    ));
  }
}
