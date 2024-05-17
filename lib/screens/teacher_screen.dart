import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internship_task/constants.dart';
import 'package:internship_task/models/teachers_model.dart';
import 'package:internship_task/reusable/components.dart';

import '../widgets/custom_shape.dart';
import 'invoices_screen.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  var searchController=TextEditingController();
  Set<int> selectedIndices = Set<int>();

  List<TeacherModel> teacherModel=TeacherModel.teacherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomShape(widget: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Very good...',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
              Text('Please choose Your preferred teachers',style: TextStyle(color: Colors.white,fontSize: 18),),
            ],
          ),),
          const SizedBox(height: 15,),
          /// form field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConstants.subjectRadius)
                ),
                prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                hintText: 'Search Your preferred teachers',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return ' Search must not be empty ';
                }
                return null;
              },
            ),
          ),
         /// grid
         Expanded(
             child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: GridView.builder(
               physics: const BouncingScrollPhysics(),
               gridDelegate:
               const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 0,
                   childAspectRatio: 1 / 1.3
               ),
               itemBuilder: (context,index){
                 bool isSelected = selectedIndices.contains(index);
                 int i = index+1;
                 return  GestureDetector(
                   onTap: () {
                     setState(() {
                       if (isSelected) {
                         selectedIndices.remove(index);
                       } else {
                         selectedIndices.add(index);
                       }
                     });
                   },
                   child:  Stack(
                     alignment: Alignment.center,
                     children: [
                       Container(
                         padding: const EdgeInsets.all(5),
                         width: 190,
                         height: 210,
                         decoration: isSelected ? BoxDecoration(
                           borderRadius: BorderRadius.circular(AppConstants.subjectRadius),
                           border: Border.all(color: Colors.green,width: 3),
                           color: HexColor("#f3f3f3"),
                         ):BoxDecoration(
                           borderRadius: BorderRadius.circular(AppConstants.subjectRadius),
                           color: HexColor("#f3f3f3"),
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               width: 80.0, // adjust as needed
                               height: 80.0, // adjust as needed
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 image: DecorationImage(
                                     image: AssetImage(teacherModel[index].image),
                                     fit: BoxFit.cover
                                 ),
                               ),
                             ),
                             Text(teacherModel[index].name,
                               overflow: TextOverflow.ellipsis,
                               style: const TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w400
                               ),),
                             Text(teacherModel[index].price,style: TextStyle(
                               fontSize: 15,
                               fontWeight: FontWeight.w400,
                               color: HexColor("#017219"),
                             ),),
                             Text(teacherModel[index].subjectName,style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.grey[700]
                             ),),
                             isSelected? defaultButton(
                                 backgroundColor: Colors.green,
                                 onPress: (){setState(() {
                                   if (isSelected) {
                                     selectedIndices.remove(index);
                                   } else {
                                     selectedIndices.add(index);
                                   }
                                 });},
                                 width: 130,
                                 height: 35,
                                 widget: const Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.check,color: Colors.white,),
                                     SizedBox(width: 5,),
                                     Text(
                                       'Booked',
                                       style: TextStyle(
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 )
                             ):defaultButton(
                                 backgroundColor: Colors.blue,
                                 onPress: (){setState(() {
                                   if (isSelected) {
                                     selectedIndices.remove(index);
                                   } else {
                                     selectedIndices.add(index);
                                   }
                                 });},
                                 width: 130,
                                 height: 35,
                                 widget: const Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.library_books_rounded,color: Colors.white,),
                                     SizedBox(width: 5,),
                                     Text(
                                       'Book',
                                       style: TextStyle(
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 )
                             ),
                           ],
                         ),
                       ),
                        if(isSelected)...{
                          Positioned(
                              top: 0,
                              right: 12,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.green,
                                child: Text('$i',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ))
                        }

                     ],
                   )
                 );
               },
             itemCount: teacherModel.length,
           ),
         )
         ),
          /// buttons
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defaultButton(
                    backgroundColor: Colors.grey,
                    onPress: (){
                      Navigator.pop(context);
                    },
                    width: 180,
                  height: 50,
                    widget:  const Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          ),
                    ),
                ),
                const SizedBox(width: 10,),
                defaultButton(
                  backgroundColor: Colors.blue,
                  onPress: (){
                    if (selectedIndices.isNotEmpty) {
                      navigateTo(context, const InvoicesScreen());
                    }else{ unselectedMessage(context,'Please choose Teacher');}
                  },
                  width: 180,
                  height: 50,
                  widget:  const Text(
                    'Confirm',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



