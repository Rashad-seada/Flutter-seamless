import 'package:Mawthoq/core/di/app_module.dart';
import 'package:Mawthoq/core/infrastructure/services/image_picker_service.dart';
import 'package:Mawthoq/features/account/domain/usecases/get_account_use_case.dart';
import 'package:Mawthoq/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:Mawthoq/features/verification/domain/usecases/verification_step_1.dart';
import 'package:Mawthoq/features/verification/views/screens/07_upload_id1.dart';
import 'package:Mawthoq/features/verification/views/screens/account_confirm_screen.dart';
import 'package:Mawthoq/features/verification/views/screens/terms&conditions_screen.dart';
import 'package:Mawthoq/features/verification/views/screens/your_address_screen.dart';
import 'package:Mawthoq/features/verification/views/screens/your_job_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/views/widgets/custom_flush_bar.dart';
import '../../data/utils/employment_status.dart';
import '../../domain/usecases/verification_step_2.dart';
import '../../domain/usecases/verification_step_3.dart';
import '../../domain/usecases/verification_step_4.dart';
import '../../domain/usecases/verification_step_5.dart';
import '../../domain/usecases/verification_step_6.dart';
import '../../domain/usecases/verification_step_7.dart';
import '../screens/06_verfication_steps_screen.dart';
import '../screens/08_upload_id2.dart';
import '../screens/investment_plan_screen.dart';
import '../utils/drop_down_item_model.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  final GlobalKey<FormState> yourJobFromKey = GlobalKey<FormState>();
  final GlobalKey<FormState> yourLocationFormKey = GlobalKey<FormState>();


  int investmentPlan = 5000;

  DropDownItemModel? employmentStatus ;
  DropDownItemModel? incomeSource ;
  DropDownItemModel? country ;

  int onboardingStep = 1;

  final List<DropDownItemModel> employmentStatusList = [
    DropDownItemModel("Employee",EmploymentStatus.employee),
    DropDownItemModel("Business owner",EmploymentStatus.businessOwner),
    DropDownItemModel("Freelancer",EmploymentStatus.freelancer),
  ];

  final List<DropDownItemModel> incomeSourceList = [
    DropDownItemModel("Work",IncomeSource.work),
    DropDownItemModel("Family",IncomeSource.family),
  ];


  final List<DropDownItemModel> countryList = [
    DropDownItemModel("Saudi arabia",Countries.saudia),
    DropDownItemModel("Qatar",Countries.qatar),
  ];

  TextEditingController employmentCompanyController = TextEditingController();
  TextEditingController employmentOwnerController = TextEditingController();
  TextEditingController employmentAddressController = TextEditingController();
  TextEditingController employmentTitleController = TextEditingController();
  TextEditingController employmentDomainController = TextEditingController();
  TextEditingController freelancerUrlController = TextEditingController();

  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();


  XFile? back;
  XFile? front;
  XFile? image;

  onSliderChange(double newValue) {
    emit(VerificationSliderChange());
    investmentPlan = newValue.toInt();
    emit(VerificationInitial());
  }

  step1(BuildContext context){
    emit(VerificationIsLoading());
    getIt<VerificationStep1UseCase>().call().then(
          (value) => value.fold(
                  (error) {
                    showFlushBar(
                        context,
                        title: "Error ${error.failureCode}",
                        message : error.message
                    );
                    emit(VerificationInitial());

                  },
                  (success) {
                    emit(VerificationSuccess());
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> InvestmentPlanScreen()));

                  }
          )
    );
  }

  step2(BuildContext context){
    emit(VerificationIsLoading());
    getIt<VerificationStep2UseCase>().call(initialInvestment: investmentPlan.toDouble()).then(
            (value) => value.fold(
                (error) {
                  showFlushBar(
                      context,
                      title: "Error ${error.failureCode}",
                      message : error.message
                  );
                  emit(VerificationInitial());

                },
                (success) {
                  emit(VerificationSuccess());
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> YourJobScreen()));

            }
        )
    );
  }

  step3(BuildContext context){

    if(employmentStatus == null){
      showFlushBar(
          context,
          title: "Validation error",
          message : "You must select an employment status"
      );
      return;
    }

    if(incomeSource == null){
      showFlushBar(
          context,
          title: "Validation error",
          message : "You must select an income source"
      );
      return;
    }

    if(yourJobFromKey.currentState!.validate()){

      emit(VerificationIsLoading());
      getIt<VerificationStep3UseCase>().call(
        employmentStatus: employmentStatus?.value ?? '',
        incomeSource: incomeSource?.value ?? '',

        employmentCompany : employmentCompanyController.text,
        employmentOwner : employmentOwnerController.text,
        employmentAddress : employmentAddressController.text,
        employmentTitle : employmentTitleController.text,
        employmentDomain : employmentDomainController.text,
        freelancerUrl : freelancerUrlController.text,

      ).then(
              (value) => value.fold(
                  (error) {
                showFlushBar(
                    context,
                    title: "Error ${error.failureCode}",
                    message : error.message
                );
                emit(VerificationInitial());

              },
                  (success) {
                emit(VerificationSuccess());
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> TermsAndConditionsScreen()));

              }
          )
      );
    }

  }

  step4(BuildContext context){
    emit(VerificationIsLoading());
    getIt<VerificationStep4UseCase>().call().then(
            (value) => value.fold(
                (error) {
                  showFlushBar(
                      context,
                      title: "Error ${error.failureCode}",
                      message : error.message
                  );
                  emit(VerificationInitial());

                },
                (success) {
                  emit(VerificationSuccess());
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> YourAddressScreen()));

            }
        )
    );
  }

  step5(BuildContext context){

    if(country == null){
      showFlushBar(
          context,
          title: "Validation error",
          message : "You must select your country"
      );
      return;
    }

    if(yourLocationFormKey.currentState!.validate()){

    emit(VerificationIsLoading());
    getIt<VerificationStep5UseCase>().call(
        country: country?.value ?? "",
        city: cityController.text,
        area: areaController.text,
        streetAddress: streetAddressController.text
    ).then(
            (value) => value.fold(
                (error) {
                  showFlushBar(
                      context,
                      title: "Error ${error.failureCode}",
                      message : error.message
                  );
                  emit(VerificationInitial());

                },
                (success) {
                  emit(VerificationSuccess());
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> UploadId1Screen()));

            }
        )
    );}
  }

  step6(BuildContext context){
    emit(VerificationIsLoading());
    getIt<VerificationStep6UseCase>().call().then(
            (value) => value.fold(
                (error) {
                  showFlushBar(
                      context,
                      title: "Error ${error.failureCode}",
                      message : error.message
                  );
                  emit(VerificationInitial());

                },
                (success) {
                  emit(VerificationSuccess());
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> UploadId2Screen()));

            }
        )
    );
  }

  step7(BuildContext context){

    if(front == null || back == null || image == null){
      showFlushBar(
          context,
          title: "Validation error",
          message : "You must provide use with all the required documents"
      );
      return;
    }

    emit(VerificationIsLoading());
    getIt<VerificationStep7UseCase>().call(
        front: front!,
        back: back!,
        image: image!
    ).then(
            (value) => value.fold(
                (error) {
                  showFlushBar(
                      context,
                      title: "Error ${error.failureCode}",
                      message : error.message
                  );
                  emit(VerificationInitial());
                },
                (success) {
                  emit(VerificationSuccess());
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> AccountConfirmScreen()));

            }
        )
    );
  }

  getUser(BuildContext context){
    emit(VerificationIsPageLoading());
    getIt<GetAccountUseCase>().call().then(
            (value) => value.fold(
                (error) {
              emit(VerificationError(error));

            },
                (success) {

                  switch(success.user?.onboardingStep){
                    case 1 :
                      //Navigator.push(context,MaterialPageRoute(builder: (_)=> VerficationScreen()));
                      break;
                    case 2 :
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> InvestmentPlanScreen()));
                      break;

                    case 3 :
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> YourJobScreen()));
                      break;

                    case 4 :
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> TermsAndConditionsScreen()));
                      break;

                    case 5 :
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> YourAddressScreen()));
                      break;

                    case 6 :
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> UploadId1Screen()));
                      break;

                    case 7 :
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> UploadId2Screen()));
                      break;

                    case 8 :
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> AccountConfirmScreen()));
                      break;

                  }



              emit(VerificationSuccess());

            }
        )
    );
  }

  onAccountVerificationCardTap(BuildContext context) {
    navigateToVerificationStepsScreen(context);
  }

  navigateToVerificationStepsScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => VerficationScreen()));
  }

  onStep2Tap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => InvestmentPlanScreen()));
  }

  onStep3Tap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => YourAddressScreen()));
  }

  void onEmploymentStatusChange(DropDownItemModel? value) {
    emit(VerificationDropDownChange());
    print(value?.value);

    employmentStatus = value;
    emit(VerificationInitial());
  }

  onIncomeSourceChange(DropDownItemModel? value) {
    emit(VerificationDropDownChange());
    print(value?.value);

    incomeSource = value;
    emit(VerificationInitial());
  }

  onCountryChange(DropDownItemModel? value) {
    emit(VerificationDropDownChange());
    print(value?.value);

    country = value;
    emit(VerificationInitial());
  }

  onImageTap() async {
    emit(VerificationDropDownChange());
    image = await getIt<ImagePickerService>().pickImageFromGallery();
    emit(VerificationImagePicked());
  }

  onBackImageTap() async {
    emit(VerificationDropDownChange());
    back = await getIt<ImagePickerService>().pickImageFromGallery();
    emit(VerificationImagePicked());
  }

  onFrontImageTap() async {
    emit(VerificationDropDownChange());
    front = await getIt<ImagePickerService>().pickImageFromGallery();
    emit(VerificationImagePicked());
  }

  String? validateTextField(String text) {
    if(text.isEmpty) {
      return "This field is required";
    }
  }

}
