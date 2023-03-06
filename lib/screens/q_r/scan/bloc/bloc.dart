import 'package:bloc/bloc.dart';
import 'package:scan_task/core/network/cache_helper.dart';
import 'package:scan_task/screens/q_r/scan/bloc/states.dart';

import '../../../../core/network/server_gate.dart';
import 'events.dart';

class ScanBloc extends Bloc<ScanEvents, ScanStates> {
  ScanBloc() : super((ScanInitialState())) {
    on<ScanPostEvent>(_postScan);
  }
  Future<void> _postScan(
      ScanPostEvent event, Emitter<ScanStates> emit) async {
    emit(ScanLoadingState());

      final response = await ServerGate.postData(url: 'scan', data:  event.body,);
      print('#######################${response.data}');
      if(response.data["status"] == 1){
        emit(ScanSuccessState());
      }else{
        emit(ScanErrorState(response.data['message']??""));
      }

    }

  }
