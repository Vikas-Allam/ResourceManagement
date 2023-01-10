import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 6.3
import QtQuick.Layouts 6.3
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
               popup2.close()
             }


     }
     }
     }
 /*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
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
        }

        Label {
            id: label1
            y: 30
            text: qsTr("Name :")
            clip: true
        }

        Label {
            id: label2
            text: qsTr("Designation :")
        }

        Label {
            id: label3
            text: qsTr("Date Of Birth :")
        }

        Label {
            id: label4
            text: qsTr("Department :")
        }

        Label {
            id: label5
            text: qsTr("Joining Date :")
        }

        Label {
            id: label6
            text: qsTr("Mobile No :")
        }

        Label {
            id: label7
            text: qsTr("Skills :")
        }

        Label {
            id: label8
            text: qsTr("Address :")
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



              list.model.append({val: in1[j]+"\t"+in2[j]+"\t"+in3[j]+"\t"+in4[j]+"\t"+in5[j]+"\t"+in6[j]+"\t"+in7[j]+"\t"+in8[j]+"\t"+in9[j]})

         }

       popup2.open()

    }

}
}






