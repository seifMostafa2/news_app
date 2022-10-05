import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_news_app/layout/cubit/cubit.dart';
import 'package:full_news_app/layout/cubit/states.dart';
import 'package:full_news_app/shared/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsState  >(

      listener: (context, state) {   },
      builder: (context, state) {

        var list = NewsCubit.get(context).business;
        
        return articleBuilder (list , context);
      },
    );
}
}
