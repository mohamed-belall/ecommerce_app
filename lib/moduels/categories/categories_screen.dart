import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:shop_app/models/categories_models.dart';import 'package:shop_app/shared/cubit/cubit.dart';import 'package:shop_app/shared/cubit/state.dart';class CategoriesScreen extends StatelessWidget {  const CategoriesScreen({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return BlocConsumer<ShopCubit, ShopStates>(      listener: (context, state) {},      builder: (context, state) {        var cubit = ShopCubit.get(context);        return Scaffold(          body: ListView.separated(            physics: BouncingScrollPhysics(),            itemBuilder: (context, index) =>                catItemBuilder(cubit.categoriesModel!.data!.data[index]),            separatorBuilder: (context, index) => Container(              width: double.infinity,              height: 1,              color: Colors.grey[300],            ),            itemCount: cubit.categoriesModel!.data!.data.length,          ),        );      },    );  }  Widget catItemBuilder(DataModel model) => Padding(        padding: const EdgeInsets.all(10.0),        child: Container(          padding: EdgeInsets.all(10.0),          decoration: BoxDecoration(            color: Colors.grey[300],            borderRadius: BorderRadius.circular(              20.0,            ),          ),          child: Row(            children: [              Image(                width: 100.0,                height: 100.0,                fit: BoxFit.cover,                image: NetworkImage(                  model.image.toString(),                ),              ),              SizedBox(                width: 20.0,              ),              Text(                model.name.toString(),                style: TextStyle(                  fontSize: 20.0,                  fontWeight: FontWeight.w800,                ),              ),              Spacer(),              Icon(                Icons.arrow_forward_ios,                size: 30.0,              ),            ],          ),        ),      );}