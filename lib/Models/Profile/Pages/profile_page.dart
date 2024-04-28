import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/Constants/constans_assets.dart';
bool status=false;
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onDoubleTap: (){

            },
            child: Column(
              children: [
                const SizedBox(height: 30,),
                _header(),
                const SizedBox(height: 30,),
                _body(),
                const SizedBox(height: 20,),
                const Divider(),
                _footer()



              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _header(){
    return  ListTile(leading: Container(
        height: 35,
        width: 30,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset(Images.svgLogo,height: 10,width: 10,)),
      title: const Text('Profile',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
      trailing: SvgPicture.asset(Images.svgMoreCircle,height: 25,width: 10,color: Colors.black,),);
  }
  Widget _body(){
    return Column(
      children: const[
        CircleAvatar(radius: 55,),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Andrew Ainsley',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text('andrew_ainsley@yourdomain.com',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
        ),
      ],
    );
  }
  Widget _reusable_listTile(String ImageUrl,String category){
    return ListTile(leading:SvgPicture.asset(ImageUrl,height: 25,width: 10,color: Colors.black,),
      title: Text(category,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 19),),
      trailing:const Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 20,),);
  }
  Widget _footer(){
    return Column(
      children: [
        _reusable_listTile(Images.svgProfile,'Edit Profile'),
        _reusable_listTile(Images.svgNotification, 'Notification'),
        _reusable_listTile(Images.svgWallet, 'Payment'),
        _reusable_listTile(Images.svgSecurity, 'Security'),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Row(
                children: [
                  SvgPicture.asset(Images.svgLanguage),
                  const Padding(
                    padding:  EdgeInsets.only(left: 28.0),
                    child:  Text('Language',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 19),),
                  )
                ],
              ),
                Row(children: const[ Text('English(US)'), Icon(Icons.arrow_forward_ios_outlined,size: 20,)],)
              ],),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(margin: const EdgeInsets.symmetric(vertical:13),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: SvgPicture.asset(Images.svgModeEye),
                  ),
                  const Padding(
                    padding:  EdgeInsets.only(left: 32.0),
                    child:  Text('Dark Mode',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 19),),
                  )
                ],
              ),
                Row(children: [SizedBox(
                    height:30,
                    width: 30,
                    child:
                    CupertinoSwitch(value: false, onChanged: (value){

                    })
                )],)
              ],),
          ),
        ),
        _reusable_listTile(Images.svgLock, 'Privacy Policy'),
        _reusable_listTile(Images.svgHelp, 'Help Center'),
        _reusable_listTile(Images.svgInvite, 'Invite Friends'),
        _reusable_listTile(Images.svgLogout, 'Logout'),



      ],
    );
  }
}