import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/home/blocs/category_bar/category_bar_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Map<String, dynamic>> categoryList = [
  {'icon': Icons.star_rounded, 'label': 'Popular'},
  {'icon': Icons.chair_alt_rounded, 'label': 'Chair'},
  {'icon': Icons.table_bar, 'label': 'Table'},
  {'icon': Icons.chair_rounded, 'label': 'Armchair'},
  {'icon': Icons.bed_rounded, 'label': 'Bed'},
  {'icon': Icons.lightbulb, 'label': 'Lamp'},
];

class CategoryBar extends StatelessWidget {
  const CategoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBarBloc, CategoryBarState>(
      builder: (context, state) {
        return SizedBox(
          height: 85,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5),
                    child: CategoryButton(
                      icon: categoryList[index]['icon'],
                      categoryTitle: categoryList[index]['label'],
                      index: index,
                      selected: state is CategoryBarSelectedState &&
                              state.index == index
                          ? true
                          : false,
                    ));
              }),
        );
      },
    );
  }
}

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final String categoryTitle;
  final int index;

  const CategoryButton(
      {Key? key,
      required this.icon,
      this.selected = false,
      required this.categoryTitle,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: selected ? black : unselectedCategory),
            child: IconButton(
                onPressed: () => BlocProvider.of<CategoryBarBloc>(context)
                    .add(CategoryBarSelectedEvent(index: index)),
                color: selected ? Colors.white : lightestGray,
                iconSize: selected ? 30 : 25,
                icon: Icon(icon))),
        const Gap(5),
        Text(categoryTitle,
            style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400),
                color: selected ? black : lightestGray))
      ],
    );
  }
}
