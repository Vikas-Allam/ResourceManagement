//import QtQuick 2.15
//import QtQuick.Window 2.15
//import QtQuick.Controls 6.3
//import QtQuick.Layouts 6.3
import QtQuick.Controls 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
   color:"skyblue"




/*-------------------------------------------------------------- checkbox Popup-------------------------------------------------------------------------*/
    Popup{
        id:checkpopup
        x: 100
        y: 100
        width: 200
        height: 200
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        background: Rectangle {

            opacity: 0.3
            border.color: "black"
            border.width: 3
            radius: 2
            color: "blue"
        }
        Text
        {
            id:userlabel
            text:qsTr("ENTER DATABASE ENTRY")
            color:"black"

            x:0
            y:0
            font.pointSize: 12
            font.bold:true

            clip: true
        }
        TextField
       {
           id:buttontext

             clip: true
             anchors.centerIn: parent
             placeholderText: qsTr("User Input")

       }
        Button{
            id:checkbutton
            text: "ok"
            x:80
            y:150
             onClicked:{
              checkpopup.close()
            }

    }
    }
/*-------------------------------------------------------------- Warning Popup-------------------------------------------------------------------------*/
     Popup
     {
    id:popup
    x: 100
    y: 100
    width: 200
    height: 200
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background: Rectangle {

        opacity: 0.5
        border.color: "black"
        border.width: 1
        radius: 2
        color: "white"
    }
    Text
    {
        id:poplabel
        text:qsTr("Error!:already exist")
        color:"red"
        font.pointSize: 15
        font.bold: true
        anchors.centerIn: parent
        clip: true
    }

    Button{
        id:popbutton
        text: "ok"
        x:80
        y:150
        background: Rectangle {
            implicitWidth: 80
            implicitHeight: 40
            opacity: 0.5
            border.color: "black"
            border.width: 1
            radius: 2
            color: "red"
        }
         onClicked:{
          popup.close()
        }

}
}
/*-------------------------------------------------------------- ListView Popup-------------------------------------------------------------------------*/


     Popup{
         id:popup2
         x: 0
         y: 0
         width: parent.width
         height: parent.height
         modal: true
         focus: true
         closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
         background: Rectangle {

             opacity: 0.7
             border.color: "black"
             border.width: 3
             radius: 2
             color: "Yellow"
}
ScrollView{

        width: 200
        height: 200



        ListView{
            anchors.fill: parent

            id:list
            model: ListModel{
           }
            spacing: 5


                    delegate: Text {
                            id:b2
                            text: val
}
        }

         Button{
             id:popbutton2
             text: "ok"
             x:240
             y:420
             background: Rectangle {
                 implicitWidth: 80
                 implicitHeight: 40
                 opacity: 1
                 border.color: "black"
                 border.width: 1
                 radius: 2
                 color: "teal"
             }
              onClicked:{
                  var cnt3=test.text
                  for(let i=0;i<cnt3;i++)
                  list.model.remove(0)
               popup2.close()
             }


     }
     }
     }
 /*-------------------------------------------------------------------LabelPopup---------------------------------------------------------------------------------------------------------------------------------*/
     Popup{
         id:labelpopup
         x: 100
         y: 100
         width: 200
         height: 200
         modal: true
         focus: true
         closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
         background: Rectangle {

             opacity: 0.3
             border.color: "black"
             border.width: 3
             radius: 2
             color: "blue"
         }
         ScrollView{

                 width: 200
                 height: 200



                 ListView{
                     anchors.fill: parent

                     id:list2
                     model: ListModel{
                    }
                     spacing: 5


                             delegate: Text {
                                     id:b3
                                     text: val2
         }
                 }
         Button{
             id:labelbutton
             text: "ok"
             x:80
             y:150
             background: Rectangle {
                 implicitWidth: 80
                 implicitHeight: 40
                 opacity: 0.5
                 border.color: "black"
                 border.width: 1
                 radius: 2
                 color: "red"
             }
              onClicked:{
                  var cnt2=test.text
                  for(let i=0;i<cnt2;i++)
                  list2.model.remove(0)
               labelpopup.close()
             }

     }
     }

}




     /*---------------------------------------------------------------StartOfInputs----------------------------------------------------------------*/
     Button {
        id: button
        x: 240
        y: 420
        text: qsTr("Save")

        background: Rectangle {
            implicitWidth: 80
            implicitHeight: 40
            opacity: 0.5
            border.color: "black"
            border.width: 1
            radius: 2
            color: "pink"
    }
        onClicked:{

if(input.anyuserExists(oid.text,name.text,desig.text,dob.text,cobo.currentText,jd.text,contact.text,skills.text,add.text)=== 1)
                    {
                      popup.open()
                   }
         else
            {
 input.addPerson(oid.text,name.text,desig.text,dob.text,cobo.currentText,jd.text,contact.text,skills.text,add.text)
                }

        }
    }

    Label {
        id: head
        x: 157
        y: 30
        width: 312
        height: 38
        color: "#161e7c"
        text: qsTr("RESOURCE  MANAGEMENT")
        font.pointSize: 18
        font.bold: true
        clip: false
    }



    Column {
        id: columnLayout1
        x: 318
        y: 91
        width: 120
        height: 0


        TextField {

            id: oid
         visible: true
            clip: true
            placeholderText: qsTr("")

        }


        TextField {
            id: name
            clip: true

            placeholderText: qsTr("")

        }

        TextField {
            id: desig
            clip: true
            placeholderText: qsTr("")
        }

        TextField {
            id: dob
            text: ""
            clip: true
            placeholderText: qsTr("")

        }
        ComboBox {
            id: cobo
            clip: true
            model:['select','c','c++','Phython',' ']

        }

        TextField {
            id: jd
            clip: true
            placeholderText: qsTr("")

        }

        TextField {
            id: contact
            clip: true
            placeholderText: qsTr("")
            validator: IntValidator {bottom: 1; top: 1000000000}
            focus: true

        }




        TextField {
            id: skills
            clip: true
            placeholderText: qsTr("")
        }

        TextField {
            id: add
            clip: true
            placeholderText: qsTr("")
        }




    }

    Column {
        id: column
        x: 172
        y: 91
        width: 107
        height: 257
        spacing: 13

        Label {
            id: label
            text: qsTr("Emp_id :")
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    let cnt=0;
                    var d1=[]
                    d1=input.emp()
                    for(let j=0;j<d1.length;j++)
                    {
               //   console.log(d1[j]+ "\t")
                             cnt++;
                 test.text=cnt
            list2.model.insert(0,{val2: d1[j]});

                }
                     labelpopup.open()
            }
        }
}
        Label {
            id: label1
            y: 30
            text: qsTr("Name :")
            clip: true
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    let cnt=0
                    var d2=[]
                    d2=input.name()
                    for(let j=0;j<d2.length;j++)
                    {
                  console.log(d2[j]+ "\t")

                        cnt++;
            test.text=cnt
            list2.model.insert(0,{val2: d2[j]});

                }
                     labelpopup.open()
            }
        }
        }

        Label {
            id: label2
            text: qsTr("Designation :")
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    let cnt=0
                    var d3=[]
                    d3=input.designation()
                    for(let j=0;j<d3.length;j++)
                    {
                  console.log(d3[j]+ "\t")

                        cnt++;
            test.text=cnt
            list2.model.insert(0,{val2: d3[j]});

                }
                     labelpopup.open()
            }
        }
        }

        Label {
            id: label3
            text: qsTr("Date Of Birth :")
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    let cnt=0
                    var d4=[]
                    d4=input.date()
                    for(let j=0;j<d4.length;j++)
                    {
                  console.log(d4[j]+ "\t")
                        cnt++;
            test.text=cnt

            list2.model.insert(0,{val2: d4[j]});

                }
                     labelpopup.open()
            }
        }
        }

        Label {
            id: label4
            text: qsTr("Department :")
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    let cnt=0
                    var d5=[]
                    d5=input.dept()
                    for(let j=0;j<d5.length;j++)
                    {
                  console.log(d5[j]+ "\t")
                        cnt++;
            test.text=cnt

            list2.model.insert(0,{val2: d5[j]});

                }
                     labelpopup.open()
            }
        }
        }

        Label {
            id: label5
            text: qsTr("Joining Date :")
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    let cnt=0
                    var d6=[]
                    d6=input.jd()
                    for(let j=0;j<d6.length;j++)
                    {
                  console.log(d6[j]+ "\t")
                        cnt++;
            test.text=cnt

            list2.model.insert(0,{val2: d6[j]});

                }
                     labelpopup.open()
            }
        }
        }

        Label {
            id: label6
            text: qsTr("Mobile No :")
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    let cnt=0
                    var d7=[]
                    d7=input.cn()
                    for(let j=0;j<d7.length;j++)
                    {
                  console.log(d7[j]+ "\t")
                        cnt++;
            test.text=cnt

            list2.model.insert(0,{val2: d7[j]});

                }
                     labelpopup.open()
            }
        }
        }

        Label {
            id: label7
            text: qsTr("Skills :")
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    let cnt=0
                    var d8=[]
                    d8=input.skills()
                    for(let j=0;j<d8.length;j++)
                    {
                  console.log(d8[j]+ "\t")
                        cnt++;
            test.text=cnt

            list2.model.insert(0,{val2: d8[j]});

                }
                     labelpopup.open()
            }
        }
        }

        Label {
            id: label8
            text: qsTr("Address :")
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    let cnt=0
                    var d9=[]
                    d9=input.add()
                    for(let j=0;j<d9.length;j++)
                    {
                  console.log(d9[j]+ "\t")
                        cnt++;
            test.text=cnt

            list2.model.insert(0,{val2: d9[j]});

                }
                     labelpopup.open()
            }
        }
        }
    }



    Button {
        id: button1
        x: 384
        y: 420
        text: qsTr("Delete All")
        background: Rectangle {
            implicitWidth: 80
            implicitHeight: 40
            opacity: 1
            border.color: "black"
            border.width: 1
            radius: 2
            color: "pink"
        }
        onClicked: {
            input.removeAllPersons()
        }
    }
    CheckBox{
        id:check
        x:200
        y:400
onClicked:
{
   checkpopup.open()
}


}
    Button
    {
        id:button5
        text: "show"
 x:100
 y:420
 background: Rectangle {
     implicitWidth: 80
     implicitHeight: 40
     opacity: 1
     border.color: "black"
     border.width: 1
     radius: 2
     color: "pink"
}
    onClicked:

    {
         let cnt=0;
        var in1=[]
        var in2=[]
        var in3=[]
        var in4=[]
        var in5=[]
        var in6=[]
        var in7=[]
        var in8=[]
        var in9=[]
        in1=input.emp()
        in2=input.name()
        in3=input.designation()
        in4=input.date()
        in5=input.dept()
        in6=input.jd()
        in7=input.cn()
        in8=input.skills()
        in9=input.add()
        for(let j=0;j<in1.length;j++)
        {
      console.log(in1[j]+ "\t")


//list.model.insert(0,{val: in1[j]+"\t"+in2[j]+"\t"+in3[j]+"\t"+in4[j]+"\t"+in5[j]+"\t"+in6[j]+"\t"+in7[j]+"\t"+in8[j]+"\t"+in9[j]})
              list.model.append({val: in1[j]+"\t"+in2[j]+"\t"+in3[j]+"\t"+in4[j]+"\t"+in5[j]+"\t"+in6[j]+"\t"+in7[j]+"\t"+in8[j]+"\t"+in9[j]})
    cnt++;
            test.text=cnt;
         }

       popup2.open()

    }

}
   Label{
       id:test
   }
}







