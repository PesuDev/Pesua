import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Container shimmerUi() {
 return Container(
   child: SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
      width: double.infinity,
            height: 200,
            color: Colors.white,
          ),
        ),

      ),
 );
  }
Container shimmerUiForProfile() {
 return Container(
   child: SizedBox(
        width: double.infinity,

        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,width: 50,
                child: CircleAvatar(

                ),
              ),

              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
      width: 40,
                    height: 10,
                    color: Colors.white,
                  ),
                  Container(
                    width: 60,
                    height: 10,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
 );
  }
Container shimmerUiForAnnouncement() {
 return Container(
   child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
      width: double.infinity,
            height: 50,
            color: Colors.white,
          ),
        ),

      ),
 );
  }
