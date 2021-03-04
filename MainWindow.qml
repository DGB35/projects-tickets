import QtQuick 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "imports" as ComponentsConstants
import "components" as Components
import "components/panels" as Panels
import "components/controls" as Controls

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

    Controls.CustomSplitView
    {
         id: splitView
         anchors.topMargin: header.height
         anchors.fill: parent

         Panels.ProjectsPanel
         {
            id: projectsPanel
            SplitView.preferredWidth: 300
            SplitView.minimumWidth: 75
            SplitView.maximumWidth: 350

         }

         Panels.TicketsPanel
         {
            id: ticketsPanel
            SplitView.minimumWidth: 200
         }
    }
}
