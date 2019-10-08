import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoProfile extends StatefulWidget {
  @override
  _CupertinoProfileState createState() => _CupertinoProfileState();
}

class _CupertinoProfileState extends State<CupertinoProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                                'https://blogs.psychcentral.com/life-goals/files/2018/09/mens-dress-guide-768x513.jpg'),
                          ),
                        ),
                        Text(
                          'Johnson James',
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .navActionTextStyle
                              .apply(
                                  color: CupertinoColors.activeBlue,
                                  fontSizeDelta: 22),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoButton(
                          child: Text('Home'),
                          onPressed: () {},
                          color: CupertinoColors.activeBlue,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(CupertinoIcons.location,
                                color: CupertinoColors.activeBlue),
                            Text(
                              'Accra,Haatso',
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .navActionTextStyle
                                  .apply(
                                    color: CupertinoColors.activeBlue,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(CupertinoIcons.mail,
                                color: CupertinoColors.activeBlue),
                            Text(
                              'dynamo.joey@gmailgmail.com',
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .navActionTextStyle
                                  .apply(
                                    color: CupertinoColors.activeBlue,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(CupertinoIcons.phone,
                                color: CupertinoColors.activeBlue),
                            Text(
                              '+23326274457',
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .navActionTextStyle
                                  .apply(
                                    color: CupertinoColors.activeBlue,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(CupertinoIcons.flag,
                                color: CupertinoColors.activeBlue),
                            Text(
                              'near Mabey',
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .navActionTextStyle
                                  .apply(
                                    color: CupertinoColors.activeBlue,
                                  ),
                            ),
                          ],
                        ),

                        //Chip(label: Text('Home'),)
                      ],
                    ),
                  ),
      
    );
  }
}