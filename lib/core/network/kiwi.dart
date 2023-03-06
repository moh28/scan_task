import 'package:kiwi/kiwi.dart';
import 'package:scan_task/screens/q_r/scan/bloc/bloc.dart';

import '../../screens/auth/log_in/bloc/bloc.dart';
import '../../screens/q_r/result/bloc/bloc.dart';

Future<void> initKiwi() async {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => LogInBloc());
  container.registerFactory((container) => ScanBloc());
  container.registerFactory((container) => ScanResultBloc());
}
