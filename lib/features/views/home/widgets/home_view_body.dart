import 'package:flutter/material.dart';

import 'custom_sliver_grid.dart';
import 'custom_sliver_list.dart';
import 'search_textfield.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});
  final TextEditingController teSearchController1 = TextEditingController();
  final TextEditingController teSearchController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              onChanged: () {},
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          SliverToBoxAdapter(
            child: SearchTextField(
              teController: teSearchController2,
              onChanged: () {},
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          const CustomSliverGrid(),
          const CustomSliverList(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
        ],
      ),
    );
  }
}
