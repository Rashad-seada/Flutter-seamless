import 'package:Mawthoq/features/selling/views/selling_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'investor_profile_state.dart';

class InvestorProfileCubit extends Cubit<InvestorProfileState> {
  InvestorProfileCubit() : super(InvestorProfileInitial());

  onStartSellingTap(BuildContext context){
    _navigateToSellingScreen(context);
  }

  _navigateToSellingScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> SellingScreen()));
  }

}
