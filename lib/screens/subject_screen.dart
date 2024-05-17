import 'package:flutter/material.dart';
import 'package:internship_task/models/subject_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internship_task/constants.dart';
import 'package:internship_task/screens/teacher_screen.dart';

import '../reusable/components.dart';
import '../widgets/custom_shape.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({Key? key}) : super(key: key);

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  List<SubjectModel> subjectModel = SubjectModel.subjectList;
  Set<int> selectedIndices = Set<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// custom shape
          const CustomShape(widget: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome ',style: TextStyle(color: Colors.white,fontSize: 18),),
                  Text('Mohamed Ragab',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
              Text('Please choose Your subjects',style: TextStyle(color: Colors.white,fontSize: 15),),
            ],
          ),),
          const SizedBox(height: 15,),
          /// card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 150,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppConstants.subjectRadius),
                  color: HexColor("#f3f3f3"),
                ),
                child: Column(
                  children: [
                    /// choice
                    const Text(
                      'Please select subjects',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10,),
                    /// grid
                    Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.1 / 1),
                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndices.contains(index);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedIndices.remove(index);
                                } else {
                                  selectedIndices.add(index);
                                }
                              });
                            },
                            child: Stack(
                              children: [
                                Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppConstants.subjectRadius),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Stack(
                                      // alignment: Alignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                            right: 4,
                                            top: 4,
                                          ),
                                          child: Image(
                                            image:
                                                AssetImage(subjectModel[index].image),
                                            height: 140,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      AppConstants
                                                          .subjectRadius),
                                                  bottomRight: Radius.circular(
                                                      AppConstants
                                                          .subjectRadius),
                                                ),
                                                color: HexColor("#f3f3f3"),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                subjectModel[index].name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ))
                                      ],
                                    )),
                                isSelected
                                    ? Container(
                                        height: 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppConstants.subjectRadius),
                                          // border: Border.all(color: Colors.grey),
                                          color: HexColor('#acccb3')
                                              .withOpacity(0.6),
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 80,
                                        ),
                                      )
                                    : const SizedBox(
                                        width: 0,
                                        height: 0,
                                      ),
                              ],
                            ),
                          );
                        },
                        itemCount: subjectModel.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /// button
          Padding(
            padding: const EdgeInsets.all(18),
            child: defaultButton(
                backgroundColor: HexColor("#2a7acf"),
                widget: const Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPress: () {
                  if (selectedIndices.isNotEmpty) {
                    navigateTo(context, const TeacherScreen());
                  }else{
                    unselectedMessage(context,'Please choose subject');

                  }
                }),
          ),
        ],
      ),
    );
  }
}
