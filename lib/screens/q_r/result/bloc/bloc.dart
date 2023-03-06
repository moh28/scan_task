import 'package:bloc/bloc.dart';
import 'package:scan_task/core/network/cache_helper.dart';
import 'package:scan_task/screens/q_r/result/bloc/model.dart';
import 'package:scan_task/screens/q_r/result/bloc/states.dart';
import 'package:scan_task/screens/q_r/scan/bloc/states.dart';

import '../../../../core/network/server_gate.dart';
import 'events.dart';

class ScanResultBloc extends Bloc<ScanResultEvents, ScanResultStates> {
  ScanResultBloc() : super((ScanResultInitialState())) {
    on<ScanResultGetEvent>(_getScan);
  }
  Future<void> _getScan(
      ScanResultGetEvent event, Emitter<ScanResultStates> emit) async {
    emit(ScanResultLoadingState());

    final response = await ServerGate.getData(url: 'history',);
    print('#######################${response.data}');
    if(response.data["status"] == 1){
      final data=ScanModel.fromJson(response.data);
      emit(ScanResultSuccessState(scanModel: data));
    }else{
      emit(ScanResultErrorState(response.data['message']??""));
    }

  }

}
