import 'package:bbc/control/data/online/dio-helper.dart';
import 'package:bbc/control/data/online/end-points.dart';
import 'package:dio/dio.dart';

abstract class Reporository{
  final DioHelper? dioHelper;

  Reporository(this.dioHelper);
  Future<Response?>getNewsData();
}

class RepoImplementation extends Reporository{
  RepoImplementation(super.dioHelper);

  @override
  Future<Response?> getNewsData() async{
    return await dioHelper?.getData(url: '$newsBBcList=$apiKey');
  }

}