import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:flutter/material.dart';

class FilterDropdowmElement extends StatefulWidget {

  final String title;

  FilterDropdowmElement({Key? key, required this.title}) : super(key: key);

  @override
  State<FilterDropdowmElement> createState() => _FilterDropdowmElementState();
}

class _FilterDropdowmElementState extends State<FilterDropdowmElement> {
  String dropDownValue = 'Samsung';

  List<String> dropDownList = ['Samsung','Iphone','Sony'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(widget.title,style: Theme.of(context).textTheme.headline2),

        addVerticalSpace(MediaQuery.of(context).size.height * 0.01),

        Container(

          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black26,
              width: 1
            )
          ),          
          
          child: DropdownButton(
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            iconSize: 30,
            underline: const SizedBox(),
            isExpanded: true,
            value: dropDownValue,
            items: dropDownList.map((String item) {
              return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(color: Colors.black,fontSize: 18
                    )
                  ),
              );
            }).toList(),
            onChanged: (String? value){
              setState(() {
                dropDownValue = value!;
              });
            }
          ),
        ),
        addVerticalSpace(MediaQuery.of(context).size.height * 0.02),

      ],
    );
  }
}
