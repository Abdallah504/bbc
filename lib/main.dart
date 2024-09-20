import 'package:bbc/control/constants/di.dart';
import 'package:bbc/control/data/online/dio-helper.dart';
import 'package:bbc/control/data/online/repo.dart';
import 'package:bbc/view/screens/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'control/logic/counting_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>di<CountingCubit>()..getBbcNews() )
        ],
        child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomeScreen(),
    ));
  }
}

