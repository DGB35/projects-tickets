import QtQuick 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "imports" as ComponentsConstants
import "components" as Components

Rectangle
{
    Components.Header
    {
         id: header
         anchors.top: parent.anchors.top
         title: "All projects"
         height: parent.height * ComponentsConstants.Constants.headerHeigth
         width: parent.width
    }

    Components.CustomSplitView
    {
         id: splitView
         anchors.topMargin: header.height
         anchors.fill: parent

         Components.ProjectsPanel
         {
            id: projectsPanel
            SplitView.preferredWidth: 300
            SplitView.minimumWidth: 75
            SplitView.maximumWidth: 350

         }

         Components.TicketsPanel
         {
            id: ticketsPanel
            SplitView.minimumWidth: 200
         }
    }
}
