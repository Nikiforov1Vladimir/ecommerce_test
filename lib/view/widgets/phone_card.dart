import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PhoneCard extends StatefulWidget {
  const PhoneCard({Key? key}) : super(key: key);

  @override
  State<PhoneCard> createState() => _PhoneCardState();
}

class _PhoneCardState extends State<PhoneCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [

          //PhoneCard
          Container(
            clipBehavior: Clip.hardEdge,
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width * 0.47,
            decoration: ContainerDecoration(),
            child: Stack(
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image(
                        image: AssetImage('assets/images/test_phone_image.jpeg'),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              //Cost
                              Text("1,047",style: Theme.of(context).textTheme.headline2),

                              //Title
                              const AutoSizeText(
                                'Samsung Galaxy S20 Ultra',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 10
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                  ],
                ),

                Align(
                  alignment: const Alignment(1.3, -0.9),
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.grey,
                    elevation: 0,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.favorite_border),
                  )
                )
              ],
            ),
          ),

          //Mark Button
        ],
    );
  }
}

BoxDecoration ContainerDecoration(){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white
  );
}