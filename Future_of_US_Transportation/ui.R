#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

shinyUI(dashboardPage(
    dashboardHeader(title = NULL,
                    titleWidth = NULL,
                    disable = FALSE),
    
    dashboardSidebar(
        disable = FALSE,
        
        sidebarMenu(
            id = "tabs",
            menuItem("Home", tabName = "landing-zone", icon = icon("home")),
            menuItem("Sales", tabName = "sales-zone", icon = icon("chart-line")),
            menuItem("Charging Infrastructure", tabName = "charging-zone", icon = icon("charging-station")),
            menuItem("Autonomous Mobility", tabName = "autonomous-zone", icon = icon("wifi")),
            menuItem("Conclusion", tabName = "ending-zone", icon = icon("edit")),
            menuItem("Data", tabName = "raw-data", icon = icon("database"))
        )
    ),
    
    dashboardBody(
        tags$head(
            tags$style(HTML('

                /* logo */
                .skin-blue .main-header .logo {
                 background-color: #27363b;
                 color: #27363b
                }

                /* logo when hovered */
                .skin-blue .main-header .logo:hover {
                 background-color: #27363b;
                }                
                
                /* sidebar */
                .skin-blue .main-sidebar {
                 background-color: #27363b;
                }

                /* active selected tab in the sidebarmenu */
                .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                 background-color: #395863;
                 color: #d3d3d3;font-size: 15px
                }  
                
                /* other links in the sidebarmenu */
                .skin-blue .main-sidebar .sidebar .sidebar-menu a{
                 background-color: #27363b;
                 color: #d3d3d3;font-size: 15px
                }

                /* other links in the sidebarmenu when hovered */
                .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
                 background-color: #395863;
                 color: #d3d3d3;font-size: 15px
                }
                
                /* active link */
                .skin-blue .sidebar-menu > li.active > a,
                .skin-blue .sidebar-menu > li:hover > a {
                 border-left-color: #10B058;
                }
                
                /* toggle button color  */
                .skin-blue .main-header .navbar .sidebar-toggle{
                 background-color: #344b52;color:#344b52;
                }

                /* toggle button when hovered  */
                .skin-blue .main-header .navbar .sidebar-toggle:hover{
                 background-color: #344b52;color:#344b52;
                }                

                /* navbar (rest of the header) */
		        .skin-blue .main-header .navbar {
		         background-color: #344b52;
                }                
                
                /* body */
                .content-wrapper, .right-side {
                 background-color: #344b52;
                }
                
                /* data table customization */            
                table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover {
                 background-color: #79d4a2 !important;
                }
                            
                .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,.dataTables_wrapper .dataTables_paginate .paginate_button, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled {
                 color: #0f0f0f;
                }
                
                table.dataTable tr:nth-child(even) {background-color: #aed6c0;}
                table.dataTable tr:nth-child(odd) {background-color: #dfe6dc;}
                table.dataTable th {background-color: white;}
                            
                /* tab panel customization */
                .nav-tabs {
                 background-color: #344b52;
                }
                            
                .tabbable > .nav > li > a{
                 color: #d3d3d3;
                }
                            
                .tabbable > .nav > li[class=active] > a{
                 color: black;
                }
                
                .tabbable > .nav > li > a:hover{
                 color: black;
                }'
            ))),
        
        tabItems(
            tabItem(tabName = "landing-zone",
                    fluidRow(column(5, offset = 1, align = 'left',
                                    h4(tags$b("Autonomous and Electric"), 
                                       style = "color: #10B058; font-size: 60px; line-height: 80%"),
                                    h4(tags$b("Is this the"), 
                                       style = "color: #bbc4c3; font-size: 45px; line-height: 80%"),
                                    h4(tags$b("Future of Transportation"), 
                                       style = "color: #bbc4c3; font-size: 45px; line-height: 80%"),
                                    h4(tags$b("in the United States ?"), 
                                       style = "color: #bbc4c3; font-size: 45px; line-height: 80%"),
                                    br(),
                                    div(h4("United States was", tags$b("Ranked #3", style = "color: #11baed; font-size: 35px"), "amongst 
                                        the 20 countries that were studied for autonomous vehicle readiness. The US leads the world 
                                        in AV innovation readiness, with 163 companies headquatered in and around the Silicon Valley. 
                                        Adoption of national standards around operation of autonomous vehicles and active policy 
                                        formulation can help this to be better exploited.", style = "color: #bbc4c3"), style = "width: 70%"),
                                    splitLayout(cellWidths = c("25%", "25%", "25%", "25%"),
                                                cellArgs = list(style = "padding: 0px"),
                                                h4(tags$b("Ranked #1"),style = "color: #11baed; font-size: 25px"),
                                                h4(tags$b("Ranked #7"),style = "color: #11baed; font-size: 25px"),
                                                h4(tags$b("Ranked #10"),style = "color: #11baed; font-size: 25px"),
                                                h4(tags$b("Ranked #4"),style = "color: #11baed; font-size: 25px")),
                                    splitLayout(cellWidths = c("25%", "25%", "25%", "25%"),
                                                cellArgs = list(style = "padding: 0px"),
                                                h4(tags$p("United States"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("Netherlands"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("Singapore"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("Singapore"),style = "color: #bbc4c3; font-size: 15px")),
                                    splitLayout(cellWidths = c("25%", "25%", "25%", "25%"),
                                                cellArgs = list(style = "padding: 0px"),
                                                h4(tags$p("Sweden"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("Singapore"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("New Zealand"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("Netherlands"),style = "color: #bbc4c3; font-size: 15px")),
                                    splitLayout(cellWidths = c("25%", "25%", "25%", "25%"),
                                                cellArgs = list(style = "padding: 0px"),
                                                h4(tags$p("Germany"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("Japan"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("Netherlands"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("United Kigdom"),style = "color: #bbc4c3; font-size: 15px")),
                                    splitLayout(cellWidths = c("25%", "25%", "25%", "25%"),
                                                cellArgs = list(style = "padding: 0px"),
                                                h4(tags$p("Netherlands"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("South Korea"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("United Kingdom"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("United States"),style = "color: #bbc4c3; font-size: 15px")),
                                    splitLayout(cellWidths = c("25%", "25%", "25%", "25%"),
                                                cellArgs = list(style = "padding: 0px"),
                                                h4(tags$p("United Kingdom"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("United Arab Emirates"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("Germany"),style = "color: #bbc4c3; font-size: 15px"),
                                                h4(tags$p("New Zealand"),style = "color: #bbc4c3; font-size: 15px")),
                                    splitLayout(cellWidths = c("25%", "25%", "25%", "25%"),
                                                cellArgs = list(style = "padding: 20px"),
                                                style = "height:50px;width:100%",
                                                    img(style="width: 30%", src = "img1.png"),
                                                style = "height:50px;width:100%",
                                                    img(style="width: 30%", src = "img2.png"),
                                                style = "height:50px;width:100%",
                                                    img(style="width: 30%", src = "img3.png"),
                                                style = "height:50px;width:100%",
                                                    img(style="width: 30%", src = "img4.png")),
                                    br(),
                                    splitLayout(cellWidths = c("25%", "25%", "25%", "25%"),
                                                cellArgs = list(style = "padding: 0px"),
                                                tags$p("Technology & Innovation",style = "color: #bbc4c3; font-size: 15px; width: 80px; word-wrap: break-all; white-space: normal; text-align: center; line-height: 100%"),
                                                tags$p("Infrastructure",style = "color: #bbc4c3; font-size: 15px; width: 80px; word-wrap: break-all; white-space: normal; text-align: center; line-height: 100%"),
                                                tags$p("Policy & Legislation",style = "color: #bbc4c3; font-size: 15px;  width: 80px; word-wrap: break-all; white-space: normal; text-align: center; line-height: 100%"),
                                                tags$p("Consumer Acceptance",style = "color: #bbc4c3; font-size: 15px;  width: 80px; word-wrap: break-all; white-space: normal; text-align: center; line-height: 100%")),
                                    h4(tags$b("Autonomous Vehicle Readiness Index"),style = "color: #bbc4c3; font-size: 30px; line-height: 80%"),
                                    h4(tags$p("As per the AVRI study published by KPMG International"),style = "color: #bbc4c3; font-size: 15px; line-height: 20%")),
                             
                             column(6, align = 'left',
                                    br(),
                                    br(),
                                    br(),
                                    br(),
                                    splitLayout(cellWidths = c("18%", "18%", "18%", "18%", "18%"),
                                                cellArgs = list(style = "white-space: normal; padding: 0px"),
                                                box(width = 30, title = '2018', solidHeader = TRUE, status = 'success',
                                                    p(tags$b("1 million")),
                                                    p("1 millionth plug-in electric car sold in the U.S. In December,
                                                       Tesla Model 3 becomes the first plug-in to exceed 100, 000  sales 
                                                       in a single year", style = "color: #6F7270; font-size: 12px; line-height: 110%")), 
                                                box(width = 30, title = '2020', solidHeader = TRUE, status = 'success',
                                                    p(tags$b("1.5 million")),
                                                    p("EV sales in United States near 1.5 million. Tesla Model 3 replaces Nissan Leaf 
                                                      as the world's best selling plug-in electric car in history. Tesla, inc. becomes 
                                                      the first automotive manufacturer to produce 1 million electric cars", style = "color: #6F7270; font-size: 12px; line-height: 110%")),
                                                box(width = 30, title = '2025', solidHeader = TRUE, status = 'success',
                                                    p(tags$b("1.4 million")),
                                                    p("Annual EV sales in the United States are estimated to be 1.4 million in 2025", style = "color: #6F7270; font-size: 12px; line-height: 110%")),
                                                box(width = 30, title = '2030', solidHeader = TRUE, status = 'success',
                                                    p(tags$b("18.7 million")),
                                                    p("As per EEI, the number of electric vehicles is projected to reach 18.7 million 
                                                      by 2030, about 7 percent of the 259 million vehicles expected to be on road", style = "color: #6F7270; font-size: 12px; line-height: 110%")),
                                                box(width = 30, title = '2030', solidHeader = TRUE, status = 'success',
                                                    p(tags$b("9.6 million")),
                                                    p("About 9.6 million charging ports will be required to support 18.7 million EVs in 2030", style = "color: #6F7270; font-size: 12px; line-height: 110%"))),
                                    br(),
                                    br(),
                                    br(),
                                    splitLayout(cellWidths = c("50%", "25%"),
                                                cellArgs = list(style = "white-space: normal; padding: 0px"),
                                                h4(tags$b("Tesla", style = "color: #d44137; font-size: 30px"), "has become", 
                                                   p("the world's most valuable"),
                                                   p("automaker", style = "line-height: 60%"),
                                                   style = "color: #bbc4c3; font-size: 25px"),
                                                h4("\"", tags$b("Nikola", style = "color: #11baed; font-size: 20px; font-style: italic"), "- a company focussed on electric trucks - has yet to produce a vehicle, 
                                                        but already has a market cap comparable to Ford \"", style = "color: #bbc4c3; font-size: 15px; font-style: italic")),
                                    splitLayout(cellWidths = c("40%", "60%"),
                                                cellArgs = list(style = "white-space: normal; padding: 0px"),
                                                h4("Tesla's valuation shot up by over 375% over the past one year reaching $183B on 06/15/2020", 
                                                   style = "color: #bbc4c3; font-size: 15px")),
                                    splitLayout(cellWidths = c("30%", "70%"),
                                                cellArgs = list(style = "white-space: normal; padding: 0px"),
                                                div(h4("TESLA (TSLA) - $183B", style = "color: #bbc4c3; font-size: 15px"),
                                                    h4("TOYOTA (TSLA) - $176B", style = "color: #bbc4c3; font-size: 15px"),
                                                    h4("VOLKSWAGEN (VWAGY) - $84B", style = "color: #bbc4c3; font-size: 15px"),
                                                    h4("HONDA (HMC) - $45B", style = "color: #bbc4c3; font-size: 15px"),
                                                    h4("DAIMLER (DDAIF) - $44B", style = "color: #bbc4c3; font-size: 15px"),
                                                    h4("FERRARI (RACE) - $42B", style = "color: #bbc4c3; font-size: 15px"),
                                                    h4("FORD (F) - $26B", style = "color: #bbc4c3; font-size: 15px"),
                                                    h4("NIKOLA (NKLA) - $25B", style = "color: #bbc4c3; font-size: 15px")),
                                                img(style="width: 100%", src = "img.png"))
                             ))
            ),
            
            tabItem(tabName = "sales-zone",
                    fluidRow(column(12, align = 'center',
                                    h4(tags$em("\"The need for reducing"), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    h4(tags$em("dependency on fossil fuel has led to an increased"), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    h4(tags$em("advocacy for adoption of electric and autonomous vehicles,"), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    h4(tags$em("over the past decade. We take a look into whther this has"), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    h4(tags$em("translated to increased sales for EVs in the US market and"), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    h4(tags$em("related distribition across states and demographies\""), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    br(),
                                    br())
                    ),
                    
                    fluidRow(column(5, offset =1, align = 'left',
                                    plotlyOutput("ev_sales_chart")),
                             column(6, align = 'left',
                                    plotlyOutput("us_sales_pie"))),
                    
                    fluidRow(column(5, offset = 1, align = 'left',
                                    div(h4("More than", tags$b("50%", style = "color: #11baed; font-size: 25px"), "of the total EV sales is accounted for by Tesla", 
                                           style = "color: #bbc4c3; width = 70%")),
                                    div(h4("Ford's annual sales in the U.S. is", tags$b("12", style = "color: #11baed; font-size: 25px"), "times that of Tesla", 
                                           style = "color: #bbc4c3;  width = 70%")),
                                    div(h4("California contributes almost", tags$b("50%", style = "color: #11baed; font-size: 25px"), "of the total electric 
                                           vehicle sales in the U.S. New York, Washington, Florida and Texas are the only other states with sales percentage greater than 3%", 
                                           style = "color: #bbc4c3;  width = 70%")),
                                    div(h4("Although the numbers are relatively low, but states along the", tags$b("East Coast", style = "color: #11baed; font-size: 25px"), 
                                           "have recorded greater year-on-year growth compared to rest of the country", style = "color: #bbc4c3;  width = 70%"))),
                             column(6, align = 'left',
                                    plotlyOutput("evtype_sales_pie"))),
                    
                    fluidRow(column(5, offset = 1, align = 'left',
                                    radioButtons("ev_salesbystate_selector", HTML("<font color= #bbc4c3>Select year:</font>"),
                                                 choiceNames = list(
                                                     HTML("<font color= #bbc4c3>2017</font>"), 
                                                     HTML("<font color= #bbc4c3>2018</font>")),
                                                 choiceValues = c("2017", "2018"), 
                                                 selected = "2018", inline = TRUE),
                                    plotlyOutput("ev_salesbystate_chart")),
                             column(6, align = 'left',
                                    br(),
                                    br(),
                                    br(),
                                    plotlyOutput("ev_salesyoy_chart"))
                    ),
                    
                    fluidRow(column(5, offset = 1, align = 'left',
                                    div(h4("Higher adoption of electric vehicles by states, seem to have a direct impact on the", 
                                           tags$b("Green Score", style = "color: #11baed; font-size: 25px"), ",indicating lower contribution to carbon emissions", 
                                           style = "color: #bbc4c3"), style = "width = 70%"),
                                    br(),
                                    div(h4("California has additional rebate of", 
                                           tags$b("$1000 - $2000", style = "color: #11baed; font-size: 25px"), 
                                           "on electric and hybrid vehicles in addition to federal tax credit ranging from", 
                                           tags$b("$3500 - $7500", style = "color: #11baed; font-size: 25px"), ", applicble for the first 200000 EVs/PHEVs sold by a manufacturer" , 
                                           style = "color: #bbc4c3"), style = "width = 70%")),
                            column(6, align = 'left',
                                   radioButtons("ev_salesfactors_selector", HTML("<font color= #bbc4c3>Select a factor to analyze impact on sales:</font>"),
                                                choiceNames = list(
                                                     HTML("<font color= #bbc4c3>Gas Price</font>"), 
                                                     HTML("<font color= #bbc4c3>Percentage of Light Tricks Purchased</font>"),
                                                     HTML("<font color= #bbc4c3>Household Median Income</font>"),
                                                     HTML("<font color= #bbc4c3>Green Score</font>")),
                                                choiceValues = c("Gas Price", "Percentage of Light Tricks Purchased", "Household Median Income", "Green Score"), 
                                                selected = "Gas Price", inline = TRUE),
                                   plotlyOutput("ev_salesfactors_chart"))
                    ),
                    
                    fluidRow(column(5, offset = 1, align = 'left',
                                    plotlyOutput("ev_taxcredit_chart")),
                             column(6, align = 'left',
                                    plotlyOutput("ev_taxcreditpo_chart"))
                    )
            ),
            
            tabItem(tabName = "charging-zone",
                    fluidRow(column(12, align = 'center',
                                    h4(tags$em("\"With an estimated 19.7 million EVs on road by 2030,"), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    h4(tags$em("how far is the United States from an adequate charging infrastructure\""), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    br(),
                                    br())
                    ),
                    
                    fluidRow(
                        column(5, offset = 1,
                               radioButtons("chrg_state_selector", HTML("<font color= #bbc4c3>Select charge type:</font>"),
                                            choiceNames = list(
                                                HTML("<font color= #bbc4c3>Charging Locations</font>"), 
                                                HTML("<font color= #bbc4c3>Outlets per Location</font>")),
                                            choiceValues = c("Charging Locations", "Outlets per Location"), 
                                            selected = "Charging Locations", inline = TRUE),
                               plotlyOutput("chrg_state_chart"),
                               div(style = "padding: 0px 0px; margin-top:-55px",plotlyOutput("ev_to_outlet_chart"))),
                        column(6,
                               br(),
                               br(),
                               br(),
                               h4("California",
                                  p("accounts for almost"),
                                  p("40%", style = "color: #11baed; font-size: 35px; line-height: 100%; font-weight: bold"), "of the total available",
                                  p("EV charging facilities in the United States"), style = "color: #bbc4c3; font-size: 20px; line-height: 100%"),
                               h4(tags$b("2.58", style = "color: #11baed; font-size: 25px"), "Charging outlets per location is still very low", 
                                  style = "color: #bbc4c3; font-size: 20px"),
                               h4(tags$b("11.15", style = "color: #11baed; font-size: 25px"), "Median value of EVs on road to charging outlets throughout the country", 
                                  style = "color: #bbc4c3; font-size: 20px"),
                               br(),
                               br(),
                               br(),
                               radioButtons("chrg_network_selector", HTML("<font color= #bbc4c3>Select charge type:</font>"),
                                            choiceNames = list(
                                                HTML("<font color= #bbc4c3>Level 2 Charging</font>"), 
                                                tags$span(style = "color: #bbc4c3", "DC Fast Charging")),
                                            choiceValues = c("Level 2 Charging", "DC Fast Charging"), 
                                            selected = "Level 2 Charging", inline = TRUE),
                               plotlyOutput("chrg_network_chart"))
                    )
            ),
            
            tabItem(tabName = "autonomous-zone",
                    fluidRow(column(12, align = 'center', 
                                    h4(tags$em("\"The adoption of autonomous vehicles is projected to reduce private car ownership in the U.S"), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    h4(tags$em("to 43% by 2030. But how far are we from this transformative development in mobility;"), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    h4(tags$em("will self-driving cars be a reality in the near future?\""), 
                                       style = "color: #10B058; font-size: 35px; line-height: 80%"),
                                    br(),
                                    br())
                    ),
                    
                    fluidRow(column(5, offset = 1, align = 'left',
                                    splitLayout(cellWidths = c("15%", "15%", "15%", "15%", "15%", "15%"),
                                                cellArgs = list(style = "white-space: normal; padding: 0px"),
                                                box(width = 15, height = 150, align = 'center', solidHeader = FALSE,
                                                    p("Level 0", style = "color: #11baed; font-weight: bold; line-height: 20%"),
                                                    p("No Automation", style = "font-weight: bold;font-size: 10px"),
                                                    p("The driver performs all operating tasks like steering, braking, accelerating, etc.", style = "font-size: 10px")),
                                                box(width = 15, height = 150, align = 'center', solidHeader = FALSE,
                                                    p("Level 1", style = "color: #11baed; font-weight: bold; line-height: 20%"),
                                                    p("Driver Assisstance", style = "font-weight: bold;font-size: 10px"),
                                                    p("Handles one task at a time, like automatic braking or lane assist", style = "font-size: 10px")),
                                                box(width = 15, height = 150, align = 'center', solidHeader = FALSE,
                                                    p("Level 2", style = "color: #11baed; font-weight: bold; line-height: 20%"),
                                                    p("Partial Automation", style = "font-weight: bold;font-size: 10px"),
                                                    p("Cars with atleast two automated functions", style = "font-size: 10px")),
                                                box(width = 15, height = 150, align = 'center', solidHeader = FALSE,
                                                    p("Level 3", style = "color: #11baed; font-weight: bold; line-height: 20%"),
                                                    p("Limited Automation", style = "font-weight: bold;font-size: 10px"),
                                                    p("Capable of handling dynamic driving tasks but still require driver intervention", style = "font-size: 10px")),
                                                box(width = 15, height = 150, align = 'center', solidHeader = FALSE,
                                                    p("Level 4", style = "color: #11baed; font-weight: bold; line-height: 20%"),
                                                    p("High Automation", style = "font-weight: bold;font-size: 10px"),
                                                    p("Officially driverless in certain conditions", style = "font-size: 10px")),
                                                box(width = 15, height = 150, align = 'center', solidHeader = FALSE,
                                                    p("Level 5", style = "color: #11baed; font-weight: bold; line-height: 20%"),
                                                    p("Complete Automation", style = "font-weight: bold;font-size: 10px"),
                                                    p("Operate entirely on their own without any driver presence", style = "font-size: 10px")))),
                             column(5, offset = 1, 
                                    fluidRow(column(12, align = 'center',
                                            box(width = 9, background = 'olive', height = 40, 
                                                tags$div(HTML('<i class="fas fa-info-circle" style = "color:#bbc4c3;"></i> &nbsp;&nbsp;Challenges to reach higher levels of driving autonomy'), style = "color: #bbc4c3; font-size: 15px")))),
                                    fluidRow(column(11, offset = 1, align = 'left',
                                                    tags$div(HTML('Data Storage &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Data Transportation'), style = "color: #bbc4c3; font-size: 15px"),
                                                    tags$div(HTML('Expense of Sensors &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Acquisition of corner case data'), style = "color: #bbc4c3; font-size: 15px"),
                                                    tags$div(HTML('Training Data Acquisition &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Verifying Deep Neural Networks'), style = "color: #bbc4c3; font-size: 15px"))))                   
                    ),

                    fluidRow(column(7, offset = 1, align = 'left',
                                    br(),
                                    br(),
                                    plotlyOutput("autonomous_chart")),
                             column(4, align = 'center',
                                    br(),
                                    br(),
                                    plotlyOutput("advanced_chart"))
                             )
            ),
            
            tabItem(tabName = "ending-zone",
                    fluidRow(column(10, offset = 1, align = 'left',
                                    h4("Although autonomous and electric vehicles are still early in their development
                                       and adoption, they are poised to trigger the transportation industry's largest
                                       shakeup in",
                                       p("over a century. Their success is key to meeting global goals on climate 
                                       change"),
                                       p("A study by Global X and McKinsey highlight the current state of electric and autonomous vehicles in the U.S."),
                                       style = "color: #bbc4c3; font-size: 20px"),
                                    br())),
                    
                    fluidRow(column(5, offset = 1, align = 'left',
                                    plotlyOutput("ev_ice_chart")),
                             column(6, align = 'left',
                                    plotlyOutput("ev_battery_chart"))),
                    fluidRow(column(4, offset = 1, align = 'left',
                                    h4("As battery costs continue to rapidly decline, there is reason to be optimistic about lower EV costs, which currently
                                       remain on the higher side as compared to ICE vehicles with comparable range. As EVs become cheaper to buy and operate,
                                       consumers will be drawn towards these vehicles. Government incentives and regulations are already trying to bridge this gap",
                                       style = "color: #bbc4c3; font-size: 20px"),
                                    br(),
                                    div(h4("Autonomous driving capability is largely confined to basic Level 2 features, with only a handful of cars having advanced
                                       Level 2 autonomy. The new", tags$b("Audi A8", style = "color: #11baed; font-size: 25px"), "launched in early 2020, has become the first automobile with Level 3 autonomous features.However, 
                                       Level 3 features only made it to models in Europe. It was blocked in the U.S. version of the car, 
                                       citing a lack of clear federal/state legislation around autonomous vehicles", style = "color: #bbc4c3; font-size: 20px"), style = "width: 70%")),
                             column(6, offset = 1, align = 'left',
                                    plotlyOutput("ev_range_chart")))
            ),

            tabItem(tabName = "raw-data",
                    tabsetPanel(type = "tabs",
                                tabPanel("Readiness Index",
                                         fluidRow(box(DT::dataTableOutput('avri_data'),width = 12))       
                                ),
                                tabPanel("EV Models",
                                         fluidRow(box(DT::dataTableOutput('ev_models_data'),width = 12))       
                                ),
                                tabPanel("EV Sales 2018",
                                         fluidRow(box(DT::dataTableOutput('ev_sales_2018'),width = 12))       
                                ), 
                                tabPanel("EV Sales 2019",
                                         fluidRow(box(DT::dataTableOutput('ev_sales_2019'),width = 12))       
                                ), 
                                tabPanel("EV Tax Credit",
                                         fluidRow(box(DT::dataTableOutput('tax_credit_data'),width = 12))       
                                ),
                                tabPanel("EV Tax Credit Phase Out",
                                         fluidRow(box(DT::dataTableOutput('tax_cpo_data'),width = 12))       
                                ),
                                tabPanel("EV Upcoming Models",
                                         fluidRow(box(DT::dataTableOutput('upcoming_models_data'),width = 12))       
                                ),
                                tabPanel("EV Market Share",
                                         fluidRow(box(DT::dataTableOutput('market_share_data'),width = 12))       
                                ),
                                tabPanel("EV Market Share Factors",
                                         fluidRow(box(DT::dataTableOutput('market_share_factors_data'),width = 12))       
                                ),
                                tabPanel("Charging Network",
                                         fluidRow(box(DT::dataTableOutput('chrg_network_data'),width = 12))       
                                ),
                                tabPanel("Charging Station by State",
                                         fluidRow(box(DT::dataTableOutput('chrg_station_data'),width = 12))       
                                ),
                                tabPanel("Autonomous Features by Model",
                                         fluidRow(box(DT::dataTableOutput('autonomous_features_data'),width = 12))       
                                )                                
                    )
            ))
    )
))