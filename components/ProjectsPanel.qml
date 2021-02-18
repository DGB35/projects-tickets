import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

import "../imports" as ComponentsConstants

import com.dgb.authentificator 1.0

Panel
{
    ListModel
    {
        id: projectsModel

    }

    Connections {
        target: Authentificator
        function onProjectsDataRecieveSuccess() {
            loadProjects(Authentificator.getProjectsData())
        }
    }

    function loadProjects(data)
    {
        var result = JSON.parse(data)
        for (var i in result["projects"]) {
            projectsModel.append({
                                     "icon" : result["projects"][i].icon,
                                     "name" : result["projects"][i].name,
                                     "id": result["projects"][i].id
                                 });
        }
    }

    Component {
        id: projectsDelegate
        Project
        {
            MouseArea
            {
                id: area
                focus: true
                anchors.fill: parent
                onClicked: {
                    if(view.currentIndex != model.index)
                        Authentificator.requestTiketsData(model.id)
                    view.currentIndex = model.index
                    console.log(view.currentIndex)

                }
            }
        }
    }

    ListView {
        id: view
        anchors.fill: parent

        interactive: false
        clip: true
        currentIndex: -1
        highlightMoveDuration: 0
        highlight: Rectangle
        {

            anchors { left:parent.left; right: parent.right }
            height: 60
            color: "#2b5278"
        }

        model: projectsModel
        delegate: projectsDelegate

    }
}


