import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

import "../imports" as ComponentsConstants

import com.dgb.authentificator 1.0
import com.dgb.projectModel 1.0

MenuPanel
{
    id: panel

    ProjectModel
    {
        id: projectsModel
    }

    Component
    {
        id: projectsDelegate
        Project
        {
            id: project
            MouseArea
            {
                id: projectMouseArea
                focus: true
                anchors.fill: parent
                onClicked: {
                    if (view.currentIndex !== model.index)
                        Authentificator.requestTiketsData(model.id)
                    view.currentIndex = model.index
                }
            }
        }
    }

    ListView
    {
        id: view
        anchors.fill: parent

        interactive: false
        clip: true
        currentIndex: -1
        highlightMoveDuration: 0
        highlight: Rectangle
        {
            anchors { left:parent.left; right: parent.right }
            color: ComponentsConstants.Constants.elementSelectedColor
        }

        model: projectsModel
        delegate: projectsDelegate
    }

    states:[
        State
        {
            name: "NormalWidth"
            when: project.width >=250
            PropertyChanges
            {
                target: project

            }
        },
        State
        {
            name: "MinimalWidth"
            when: project.width <= 100
            PropertyChanges {
                target: project
                textVisibility: false
            }
        }
        ]
}


