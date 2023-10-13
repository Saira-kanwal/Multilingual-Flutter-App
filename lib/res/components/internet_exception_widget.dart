
import 'package:flutter/material.dart';
import '../app_colors/app_color.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}



class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
      child: Column(
        children: [
          SizedBox(height: height*0.15,),
          const Icon(Icons.cloud_off , color: AppColors.redColor,size: 50,),
          const Center(
            child: Text('internet_exception',textAlign: TextAlign.center,),
          ),
          SizedBox(height: height*0.15,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child:Text('Retry',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }
}
