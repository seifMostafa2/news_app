import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsState  >(

      listener: (context, state) {   },
      builder: (context, state) {

        var list = NewsCubit.get(context).science;

        return articleBuilder (list , context);
      },
    );
  }
}

