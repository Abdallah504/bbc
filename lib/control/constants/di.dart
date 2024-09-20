
import 'package:bbc/control/data/online/dio-helper.dart';
import 'package:bbc/control/data/online/repo.dart';
import 'package:get_it/get_it.dart';

import '../logic/counting_cubit.dart';

GetIt di = GetIt.instance..allowReassignment=true;

Future init() async{
  di.registerFactory<DioHelper>(() => DioImplementation());
  di.registerFactory<Reporository>(() => RepoImplementation(di<DioHelper>()));
  di.registerFactory<CountingCubit>(() => CountingCubit(di<Reporository>()));

}