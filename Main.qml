import QtQuick
import QtQuick.Controls

Window {
    visible: true
        width: 400
        height: 200
        title: "Regular Expression Validator"

        Rectangle {
            width: parent.width
            height: parent.height
            color: "#f0f0f0"

            TextInput {
                id: inputField
                width: parent.width - 40
                height: 40
                anchors.centerIn: parent
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter

                property string placeholderText: "Enter phone number"
                Text {
                            text: inputField.placeholderText
                            color: "#aaa"
                            font.pixelSize: 24
                            visible: !inputField.text
                        }

                font.pixelSize: 24
                onTextChanged: {
                                var matchResult = inputField.text.match(/^\+\d{11}$/)
                                if (matchResult !== null) {
                                    message.text = "Correct"
                                    message.color = "green"
                                } else {
                                    message.text = "Incorrect"
                                    message.color = "red"
                                }
                            }
            }

            Text {
                id: message
                width: parent.width
                anchors.top: inputField.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "black"
                font.pixelSize: 24
                text: ""
                horizontalAlignment: Text.AlignHCenter
            }
        }
}
