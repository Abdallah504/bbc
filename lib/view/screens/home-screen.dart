
import 'package:bbc/control/logic/counting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountingCubit,CountingState>(
        builder: (context, state){
          final appCubit = context.read<CountingCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('BBC' , style:  TextStyle(color: Colors.red,fontSize: 16),),
                  Text('News' , style:  TextStyle(color: Colors.white,fontSize: 16),),
                ],
              ),
            ),
            body: state is DataReach?SingleChildScrollView(
              child:Column(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:  appCubit.bbcModel!.articles!.length,
                        itemBuilder: (context ,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            width: 150,
                            child: Image.network(appCubit.bbcModel!.articles![index].urlToImage.toString()),
                          ),
                        );
                        }),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount:  appCubit.bbcModel!.articles!.length,
                      itemBuilder: (context , index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.network(appCubit.bbcModel!.articles![index].urlToImage.toString()),
                            title:Text(appCubit.bbcModel!.articles![index].title.toString(),style: TextStyle(color: Colors.black),) ,
                            subtitle: Text(appCubit.bbcModel!.articles![index].description.toString(),style: TextStyle(color: Colors.black),),
                          ),
                        );
                      })
                ],
              ),
            ):Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          );
        }, listener: (context, state){});
  }
}
