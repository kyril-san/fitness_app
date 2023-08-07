// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_app/Themedata/theme.dart';
import 'package:fitness_app/height_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int _currentvalue = 28;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<Themeprov>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          Switch.adaptive(
              value: themeprovider.isdarkmode,
              onChanged: (val) {
                final provider = Provider.of<Themeprov>(context, listen: false);
                provider.togglemode(val);
              })
        ]),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'What is your Weight?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16.h),
              Text(
                'Weight in Kg. Don\'t worry, you can always \nchange it later',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Icon(
                Icons.arrow_drop_down_rounded,
                size: 50,
                color: const Color.fromARGB(255, 147, 70, 159),
              ),
              Padding(
                padding: EdgeInsets.only(left: 43.w, right: 43.w),
                child: NumberPicker(
                  axis: Axis.horizontal,
                  itemCount: 5,
                  minValue: 0,
                  itemWidth: 64.w,
                  // itemHeight: 67.h,
                  maxValue: 100,
                  selectedTextStyle: TextStyle(
                      fontSize: 38.sp,
                      color: Color.fromARGB(255, 147, 70, 159)),
                  textStyle:
                      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w100),
                  value: _currentvalue,
                  onChanged: (value) {
                    setState(() {
                      _currentvalue = value;
                    });
                  },
                ),
              ),
              Icon(
                Icons.arrow_drop_up_rounded,
                size: 50,
                color: const Color.fromARGB(255, 147, 70, 159),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReuseableButton(
                    title: 'Back',
                    type: '',
                    ontap: () {},
                  ),
                  SizedBox(width: 16.w),
                  ReuseableButton(
                    title: 'Continue',
                    type: 'Continue',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HeightScreen()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseableButton extends StatelessWidget {
  const ReuseableButton({
    super.key,
    required this.title,
    required this.type,
    required this.ontap,
  });
  final String title, type;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50.h,
        width: 150.w,
        decoration: BoxDecoration(
            color: type == 'Continue'
                ? Color.fromARGB(255, 147, 70, 159)
                : Color.fromARGB(255, 228, 207, 232),
            borderRadius: BorderRadius.circular(40.r)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: type == 'Continue'
                  ? Colors.white
                  : Color.fromARGB(255, 147, 70, 159),
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
