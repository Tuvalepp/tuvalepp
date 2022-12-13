import 'package:flutter/material.dart';
import 'package:tuvalepp/components/filtering/bottom_filter.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "Filtertag",
      backgroundColor: pageIndex == 0 ? Colors.white : Colors.transparent,
      elevation: pageIndex == 0 ? 3 : 0,
      child: Icon(
        Icons.filter_list_alt,
        color: Colors.black,
      ),
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return BottomFilter();
            });
      },
    );
  }
}
