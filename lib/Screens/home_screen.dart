import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const String id = 'homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Color.fromRGBO(255, 190, 109, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  "Find your",
                  style: GoogleFonts.nunito(
                    fontSize: 28,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  "consultation",
                  style: GoogleFonts.nunito(
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                ),),
              Container(
                margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                width: 600,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 10),
                      blurRadius: 15,
                      spreadRadius: 0,
                    ),],),
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 22,
                        )),
                    Expanded(
                        flex:5,
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            maxLines: 1,
                            autofocus: false,
                            style: TextStyle(color: Colors.black,
                                fontSize: 17),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search..',
                            ),
                          ),
                        ),
                    ),
                  ],),
              ),
              Container(
                margin: EdgeInsets.only(right: 20,left: 20,top:20),
                child: Text('Categories',
                style:TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 20,
                //color: Colors.red,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(255, 190, 109, 1),
                      ),
                      child: Text('  Adults  ',
                      style: GoogleFonts.nunito(
                        color: Colors.grey[200],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(255, 190, 109, 1),
                      ),
                      child: Text('   Children   ',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[200],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(255, 190, 109, 1),
                      ),
                      child: Text('   Women   ',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[200],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(255, 190, 109, 1),
                      ),
                      child: Text('   Men   ',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[200],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),


                  ],
                ),
              ),
              Container(
                height: 250,
                //width: 200,
                margin: EdgeInsets.only(top: 20,left: 20),
                child:  ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    doctorCategories("Cough and Cold","10 Doctors","images/cough.png"),
                    doctorCategories("Diabetes Specialist","8 Doctors","images/heart.png"),
                    doctorCategories("Heart Specialist","5 Doctors","images/heart.png"),
                    doctorCategories("Orthopaedic Expert","7 Doctors","images/ortho.png")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget doctorCategories(String expertise , String docquantity , String image){
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 140,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 190, 109, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:EdgeInsets.only(
                right: 10,
                left: 10,
                top:18
            ) ,
            alignment: AlignmentDirectional.topStart,
            child: Text(expertise,style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              color: Colors.white,
            ),),
          ),
          SizedBox(height: 5,),
          Container(
            margin:EdgeInsets.only(
                right: 45,
              //  left: 10,
                top:10) ,
            padding: EdgeInsets.all(1),
            //decoration: BoxDecoration(
              //color: Color.fromRGBO(255, 190, 109, 1).withOpacity(0.05),),
            child: Text(docquantity,style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),),
          ),
          SizedBox(height: 20,),
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image)),
          ),],
      ),
    );

  }
}
