import 'dart:convert';

import 'package:bbc/control/data/online/dio-helper.dart';
import 'package:bbc/control/data/online/repo.dart';
import 'package:bbc/model/bbc-model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../data/online/end-points.dart';
part 'counting_state.dart';


class CountingCubit extends Cubit<CountingState> {
  CountingCubit(this.reporository) : super(CountingInitial());
  final Reporository reporository;
  BbcModel? bbcModel;

  String url = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a081436a7034494a92c8920802ecd853';
  Future<void>getNews()async{
    print('fffffffff');
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200 || response !=null){
        final Map<String ,dynamic> jsonData = jsonDecode(response.body);
        bbcModel = BbcModel.fromJson(jsonData);
        emit(DataReach());
      }
    }catch(e){
      print(e);
    }
  }

  Future<void>getBbcNews()async{
    try{
      return  reporository.getNewsData().then((value) {
        if(value!.data !=null){
          bbcModel = BbcModel.fromJson(value.data);
          emit(DataReach());
        }
      });
    }catch(e){
      print('BBC Error =========> $e');
    }

  }
}
