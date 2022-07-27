import 'package:flutter/material.dart';

import 'package:flutter_switch/flutter_switch.dart';

class FormExtras extends StatefulWidget {

 
   
  const FormExtras({Key? key }) : super(key: key);

  @override
  State<FormExtras> createState() => _FormExtrasState();
}

class _FormExtrasState extends State<FormExtras> {
  @override
  Widget build(BuildContext context) {

    bool status = false;
    bool status2 = false;
    bool visibilityObs = false;

    void _changed(bool visibility, String field) {
    setState(() {
      if (field == "obs"){
        visibilityObs = visibility;
      }
    });
  }
    
    return Column(
      children: [
        Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 103, bottom: 20, top: 20),
                    child: Text(
                      "Agregar un vinculo de video",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  SizedBox(width: 150,),


                  Container(
                    child: FlutterSwitch(
                      width: 40.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 18.0,
                      value: status,
                      borderRadius: 15.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ),         
                ],
              ),

              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 70, bottom: 20, top: 20),
                    child: Text(
                      "Agregar variaciones al producto",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  SizedBox(width: 154,),

                  Container(
                    child: FlutterSwitch(
                      width: 40.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 18.0,
                      value: status2,
                      borderRadius: 15.0,
                      showOnOff: false,
                      onToggle: (val2) {
                        setState(() {
                          status2 = val2;
                        });
                      },
                    ),
                  ),         
                ],
              ),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                  InkWell(
                    onTap: () {
                      visibilityObs ? null : _changed(true, "obs");
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 22, right: 130),
                            child: Text(
                              "Descripción",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: visibilityObs ? Colors.grey[400] : Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          SizedBox(width: 145,),
                          Container(
                            margin: const EdgeInsets.only(right: 25),
                            child: Text(
                              "(Opcional)",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: visibilityObs ? Colors.grey[200] : Colors.grey[200],
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: visibilityObs ? Colors.grey[400] : Colors.grey[600]),
                        ],
                      ),
                    )
                  ),
                  SizedBox(width: 24.0),
                ],
              ),
              
                
              Container(
                margin: EdgeInsets.only(left: 22.0, right: 25.0, bottom: 20),
                  child: Column(
                  children: <Widget>[
                    visibilityObs ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                      Expanded(
                          flex: 11,
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              isDense: true
                            ),
                          ),
                        ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            color: Colors.grey[400],
                            icon: const Icon(Icons.cancel, size: 22.0,),
                            onPressed: () {
                              _changed(false, "obs");
                            },
                          ),
                        ),
                      ],
                    ) : Container(),
                  ],
                )
              ),
      ],

    );
  }
}