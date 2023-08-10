
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_zindagi/bloc/internet_bloc/internet_event.dart';
import 'package:nowaste_zindagi/bloc/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>{

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetBloc():super(InternetInitialState()){
    on<InternetLostEvent>((event, emit)=> emit( InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    connectivitySubscription =  _connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.wifi || event == ConnectivityResult.mobile){
        add(InternetGainedEvent());
      }else{
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}