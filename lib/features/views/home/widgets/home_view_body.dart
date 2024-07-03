import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../controllers/home_cubit.dart';
import '../../../controllers/home_states.dart';
import 'custom_sliver_grid.dart';
import 'custom_sliver_list.dart';
import 'search_textfield.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});
  final TextEditingController teSearchController1 = TextEditingController();
  final TextEditingController teSearchController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
                SliverToBoxAdapter(
                  child: SearchTextField(
                    teController: teSearchController1,
                    onChanged: () {
                      cubit.getSearch1(category: teSearchController1.text);
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
                SliverToBoxAdapter(
                  child: SearchTextField(
                    teController: teSearchController2,
                    onChanged: () {
                      cubit.getSearch2(category: teSearchController2.text);
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
                CustomSliverGrid(
                  items: cubit.search1,
                  isLoding: state is Search1LoadingState,
                ),
                CustomSliverList(
                  items: cubit.search2,
                  isLoding: state is Search2LoadingState,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
