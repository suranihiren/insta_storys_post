import 'package:flutter/material.dart';
import 'package:uidemo1/global_widget/textfield_global.dart';


Widget appbarThad({context,title,title2,textColor,icon1,iconColor1,icon2, iconColor2}){
  return SizedBox(
    height: 60,
    width: double.infinity,
    child: MediaQuery.removePadding(
      context: context,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // isDrawerOpen.value = true;
                  // scaffoldGlobalKey.currentState!.openDrawer();
                },
                child:SizedBox(
                  width: 60,
                  // color:Colors.red,
                  child: Image.asset("images/logo.jpg"),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textoutfit(color: textColor,text:title,fontSize: 19,fontWeight: FontWeight.w400),
                  textoutfit(color: textColor,text:title2,fontSize: 14,fontWeight: FontWeight.w500),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Get.to(const ShowAllDetailsUser());
                    },
                    child:  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Icon(
                            icon2,
                            color: iconColor2,
                            size: 33,
                          )),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    ),
  );
}
