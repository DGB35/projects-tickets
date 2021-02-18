import QtQuick 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "imports" as ComponentsConstants
import "components" as Components

SplitView
{
     id: splitView

     Components.ProjectsPanel
     {
        id: projectsPanel
        SplitView.preferredWidth: 300
        SplitView.minimumWidth: 200
        SplitView.maximumWidth: 400
        color: ComponentsConstants.Constants.projectsPanelColor
     }

     Components.TicketsPanel
     {
        id: ticketsPanel
        SplitView.preferredWidth: 500
        SplitView.minimumWidth: 400
        color: ComponentsConstants.Constants.ticketsPanelColor
     }

     Components.Panel
     {
        id: panel
        SplitView.minimumWidth: 200
        color: ComponentsConstants.Constants.projectsPanelColor
     }
}
