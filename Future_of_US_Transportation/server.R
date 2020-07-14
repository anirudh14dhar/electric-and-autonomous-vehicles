#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$avri_data <- DT::renderDataTable({
        data <- data.avri 
        datatable(data, rownames=FALSE) 
    })
    
    output$ev_models_data <- DT::renderDataTable({
        data <- data.ev.models 
        datatable(data, rownames=FALSE) 
    })
    
    output$ev_sales_2018 <- DT::renderDataTable({
        data <- data.ev.sales.2018 
        datatable(data, rownames=FALSE) 
    })
    
    output$ev_sales_2019 <- DT::renderDataTable({
        data <- data.ev.sales.2019 
        datatable(data, rownames=FALSE) 
    })
    
    output$tax_credit_data <- DT::renderDataTable({
        data <- data.tax.credit 
        datatable(data, rownames=FALSE) 
    })
    
    output$tax_cpo_data <- DT::renderDataTable({
        data <- data.tax.cpo 
        datatable(data, rownames=FALSE) 
    })
    
    output$upcoming_models_data <- DT::renderDataTable({
        data <- data.upcoming.models 
        datatable(data, rownames=FALSE) 
    })
    
    output$market_share_data <- DT::renderDataTable({
        data <- data.market.share 
        datatable(data, rownames=FALSE) 
    })
    
    output$market_share_factors_data <- DT::renderDataTable({
        data <- data.ms.factors 
        datatable(data, rownames=FALSE) 
    })
    
    output$chrg_network_data <- DT::renderDataTable({
        data <- data.chrg.network 
        datatable(data, rownames=FALSE) 
    })
    
    output$chrg_station_data <- DT::renderDataTable({
        data <- data.chrg.station 
        datatable(data, rownames=FALSE) 
    })
    
   output$autonomous_features_data <- DT::renderDataTable({
       data <- data.autonomous.features 
       datatable(data, rownames=FALSE) 
   })
   
   output$chrg_network_chart <- renderPlotly({
       if(input$chrg_network_selector == 'Level 2 Charging'){
           data <- data.chrg.network %>% filter(network != 'Total or Mean') %>% select(network, level2_conn, level2_locations, conn_per_loc)
           xval <- data$network
           yval1 <- data$level2_conn
           yval2 <- data$level2_locations
       } else {
           data <- data.chrg.network %>% filter(network != 'Total or Mean') %>% select(network, dcfc_chrg_stations , dcfc_loc)
           data <- data  %>% replace(.=="NaN", 0)
           xval <- data$network
           yval1 <- data$dcfc_chrg_stations
           yval2 <- data$dcfc_loc
       }
       
       P <- plot_ly(data, x = ~xval, width = 600, height = 300)
       P <- P %>% add_trace(y = ~yval1, type = 'bar', name = 'Connections')
       P <- P %>% add_trace(y = ~yval2, name = 'Locations')
       P <- P %>% layout(
           title = 'Charging Network by Service Provider',
           xaxis = list(title = 'Service Provider'), 
           yaxis = list(title = 'Count', range = c(0,30000)),
           barmode = 'group',
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))
   })
   
   output$chrg_state_chart <- renderPlotly({
       if(input$chrg_state_selector == 'Charging Locations'){
           data <- data.chrg.station %>% filter(state != 'Median')
           xval <- data$state
           yval <- data$chrg_locations
           ylabel = "Count"
           yrange = c(0, 6000)
       } else {
           data <- data.chrg.station %>% filter(state != 'Median')
           xval <- data$state
           yval <- data$outlets_per_loc 
           ylabel = "Ratio"
           yrange = c(0, 5)
       }
       
       P <- plot_ly(data, x = ~xval, width = 600, height = 300)
       P <- P %>% add_trace(y = ~yval, type = 'bar')
       P <- P %>% layout(
           title = 'Charging Stations by State',
           xaxis = list(title = 'State', tickangle = -45), 
           yaxis = list(title = ylabel, range = yrange),
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))
   })
   
   output$ev_to_outlet_chart <- renderPlotly({
       data <- data.chrg.station %>% filter(state != 'Median')
       xval <- data$state
       yval <- data$evs_to_chrg_outlets
       ylabel = "Ratio"
       yrange = c(0, 30)

       P <- plot_ly(data, x = ~xval, width = 600, height = 300)
       P <- P %>% add_trace(y = ~yval, type = 'bar')
       P <- P %>% layout(
           title = 'EVs to Charging Outlets',
           xaxis = list(title = 'State', tickangle = -45), 
           yaxis = list(title = ylabel, range = yrange),
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))       
       
   })
   
   output$autonomous_chart <- renderPlotly({
       data <- data.autonomous.features %>% group_by(feature) %>% summarise(Count = n()) %>% filter(feature != "")
       
       P <- data %>% plot_ly(width = 1100, height = 400)
       P <- P %>% add_trace(x = ~Count, y = ~feature, type = 'bar')
       P <- P %>% layout(
           title = 'Autonomous Features in Vehicles',
           xaxis = list(title = 'Count', tickfont = list(size = 10)), 
           yaxis = list(title = "", tickfont = list(size = 10)),
           autosize = F, 
           margin = list(l = 600, r = 70, b = 70, t = 70, pad = 0))
   })
   
   output$advanced_chart <- renderPlotly({
       data <- data.autonomous.features %>% filter(feature == 'Adaptive cruise control and lane-centering steering; both down to a stop and hands-free steering at lower speeds' | feature == 'Adaptive cruise control down to a stop and hands-free steering') %>% select(brand, model) %>% group_by(brand) %>% summarise(Count = n())
       
       P <- data %>% plot_ly(width = 300, height = 400)
       P <- P %>% add_trace(x = ~brand, y = ~Count, type = 'bar')
       P <- P %>% layout(
           title = 'Advanced Features (Level 2+)',
           xaxis = list(title = 'Brand', tickfont = list(size = 10)), 
           yaxis = list(title = "Count", tickfont = list(size = 10)),
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))
   })
   
   output$ev_sales_chart <- renderPlotly({
       temp <- data.ev.sales.2019 %>% subset(., X2019.U.S..EV.SALES %in% c('2019 U.S. Sales Totals','2018 U.S. Sales Totals','2019 Worldwide Sales','2018 Worldwide Sales'), select = c(TOTAL))
       TOTALUSSALES2019 = temp[1,1]
       TOTALUSSALES2018 = temp[2,1]
       TOTALWWSALES2019 = temp[3,1]
       TOTALWWSALES2018 = temp[4,1]
       `%notin%` <- Negate(`%in%`)
       
       sales.2018 <- data.ev.sales.2018 %>% select(brand, evsales, uspevs)
       sales.2018$year <- lapply(sales.2018$brand, function(x) "2018") 
       sales.2018 <- data.frame(sales.2018) %>% arrange(., desc(evsales)) %>% head(10)
       sales.2019 <- data.ev.sales.2019 %>% filter(X2019.U.S..EV.SALES %notin% c('2019 U.S. Sales Totals','2018 U.S. Sales Totals','2019 Worldwide Sales','2018 Worldwide Sales')) %>% select(X2019.U.S..EV.SALES, TOTAL)
       sales.2019$brand <- gsub("([A-Za-z]+).*", "\\1", sales.2019$X2019.U.S..EV.SALES)
       sales.2019 <- sales.2019 %>% select(brand, evsales = TOTAL)
       sales.2019 <- sales.2019 %>% group_by(brand) %>% summarise(evsales = sum(evsales), year = "2019", uspevs = round((evsales/TOTALUSSALES2019)*100, 2)) %>% arrange(., desc(evsales)) %>% head(10)
       
       data <- rbind(sales.2018, sales.2019)
       yval_2018 <- subset(data, year == '2018', select = c(brand, evsales))
       yval_2019 <- subset(data, year == '2019', select = c(brand, evsales))
       data <- full_join(yval_2018,yval_2019, by = 'brand')
       
       P <- plot_ly(data, x = ~brand, y = ~evsales.x, type = 'bar', name = '2018', width = 600, height = 300)
       P <- P %>% add_trace(y = ~evsales.y, name = '2019')
       P <- P %>% layout(yaxis = list(title = 'Sales'), barmode = 'group')
       P <- P %>% layout(
           title = 'U.S. EV Sales 2018/19',
           xaxis = list(title = 'Brand', tickfont = list(size = 10)), 
           yaxis = list(title = "Sales", tickfont = list(size = 10)),
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))       
   })
   
   output$us_sales_pie <- renderPlotly({
       data <- data.ev.sales.2018 %>% select(brand, ptusvs) %>% arrange(., desc(ptusvs)) %>% head(15)
       
       P <- plot_ly(data, labels = ~brand, values = ~ptusvs, type = 'pie', width = 600, height = 300)
       P <- P %>% layout(title = 'U.S. Vehicle Sales by Brand',
                         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                         autosize = F, 
                         margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))
   })
   
   output$evtype_sales_pie <- renderPlotly({
       data <- data.ev.sales.2019 %>% dplyr::filter(., grepl('PHEV', X2019.U.S..EV.SALES)) %>% select(X2019.U.S..EV.SALES, TOTAL)
       PHEV <- sum(data$TOTAL)
       data <- data.ev.sales.2019 %>% dplyr::filter(., grepl('BEV', X2019.U.S..EV.SALES)) %>% select(X2019.U.S..EV.SALES, TOTAL)
       BEV <- sum(data$TOTAL)
       data <- data.ev.sales.2019 %>% dplyr::filter(., !grepl('PHEV|BEV', X2019.U.S..EV.SALES)) %>% filter(row_number() < n() - 3) %>% select(X2019.U.S..EV.SALES, TOTAL)
       EV <- sum(data$TOTAL)
       label <- c('Electric Vehicle', 'Plug-in Hybrid Vehicle', 'Fuel-Cell Electric Vehicle')
       values <- c(EV, PHEV, BEV)

       P <- plot_ly(data, labels = ~label, values = ~values, type = 'pie', width = 600, height = 300)
       P <- P %>% layout(title = 'U.S. EV Sales by Type',
                         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                         autosize = F, 
                         margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))       
   })
   
   output$ev_salesbystate_chart <- renderPlotly({
      `%notin%` <- Negate(`%in%`)
      if(input$ev_salesbystate_selector == '2017'){
          data <- data.market.share %>% filter(state %notin% c('Total', 'Mean' , 'Median')) %>% select(state, evsales_2017)
          yval <- data$evsales_2017
      } else {
          data <- data.market.share %>% filter(state %notin% c('Total', 'Mean' , 'Median')) %>% select(state, evsales_2018)
          yval <- data$evsales_2018
      }
      
       P <- plot_ly(data, x = ~state, width = 600, height = 300, type = 'bar')
       P <- P %>% add_trace(y = ~yval, type = 'bar')
       P <- P %>% layout(
           title = 'U.S. EV Sales by State',
           xaxis = list(title = 'State', tickangle = -45), 
           yaxis = list(title = 'Sales', range = c(500, 160000, 100)),
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))    
   })
   
   output$ev_salesyoy_chart <- renderPlotly({
       data <- data.market.share %>% select(state, yoy_sales_increase, yoy_share_increase)
       
       P <- plot_ly(data, x = ~state, y = ~yoy_sales_increase, text = ~state, size = ~yoy_sales_increase, width = 600, height = 300, type = 'bar')
       P <- P %>% layout(
           title = '2017-18 YOY EV Sales Increase by State',
           xaxis = list(title = 'State'), 
           yaxis = list(title = 'Percentage'),
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))      
   })

   output$ev_salesfactors_chart <- renderPlotly({
       data <- data.ms.factors %>% select(state, evsales_share, cfa_code, ev_taxcredit, gas_price_per_gallon, median_household_income, percent_light_trucks, green_score)
       
       if(input$ev_salesfactors_selector == 'Gas Price') {
           yval <- data$gas_price_per_gallon
           ylabel <- "Price"
       } else if(input$ev_salesfactors_selector == 'Percentage of Light Tricks Purchased') {
           yval <- data$percent_light_trucks
           ylabel <- "Sales Percent"
       } else if(input$ev_salesfactors_selector == 'Household Median Income') {
           yval <- data$median_household_income
           ylabel <- "Median Income"
       } else {
           yval <- data$green_score
           ylabel <- "Score"
       }
       
       pal <- c("blue", "red")
       P <- plot_ly(data, x = ~evsales_share, y = ~yval, color = ~cfa_code, colors = pal, size = ~evsales_share, width = 600, height = 300, type = 'scatter', mode = 'markers')
       P <- P %>% layout(
           title = 'Which Factors are impacting EV Sales',
           xaxis = list(title = 'EV Sales Percent'), 
           yaxis = list(title = ylabel),
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))       
   })
   
   output$ev_taxcredit_chart <- renderPlotly({
       data <- data.ms.factors %>% select(state, evsales_share, cfa_code, ev_taxcredit)
       
       P <- plot_ly(data, x = ~state, y = ~evsales_share, color = ~ev_taxcredit, width = 600, height = 300, type = 'bar')
       P <- P %>% layout(
           title = 'Impact of Rebate/Tax Credit on EV Sales',
           xaxis = list(title = 'State'), 
           yaxis = list(title = 'EV Sales Percent'),
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))       
   })
   
   output$ev_taxcreditpo_chart <- renderPlotly({
       data <- data.tax.cpo %>% select(brand, to200k, avg_sal_19) 
       data$to200k <- ifelse(data$to200k < 0, 0, data$to200k)
       
       P <- plot_ly(data, x = ~to200k, y = ~avg_sal_19, text = ~brand, size = ~to200k, width = 600, height = 300, type = 'scatter', mode = 'markers')
       P <- P %>% layout(
           title = 'Tax Credit Phaseout by Brand',
           xaxis = list(title = 'To 200k Sales'), 
           yaxis = list(title = 'Avg Monthly Sales'),
           autosize = F, 
           margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))       
   })
   
   output$ev_ice_chart <- renderPlotly({
     data <- data.frame(c('FUEL COST PER 100 GALLONS($)', 'ANNUAL MAINTENANCE COSTS($)', 'CO2 EMISSIONS GRAMS(CO2e/MILE)'), c(238, 430, 120), c(110, 530, 380))
     colnames(data) <- c('type','ev', 'ice')
     data$type <- sapply(data$type, FUN = function(x) {paste(strwrap(x, width = 14), collapse = "<br>")})
     
     P <- plot_ly(data, x = ~type, y = ~ev, width = 600, height = 300, type = 'bar', name = 'Electric Vehicles')
     P <- P %>% add_trace(x = ~type, y = ~ice, name = 'Internal Combustion Engines')
     P <- P %>% layout(
       barmode = 'group',
       title = 'Electric Vehicles vs Internal Combustion Engines',
       xaxis = list(title = ""), 
       yaxis = list(title = ""),
       legend = list(x = 0, y = 8, orientation = 'h'),
       autosize = F, 
       margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))       
   })
   
   output$ev_battery_chart <- renderPlotly({
     data <- data.frame(c(2010, 2011, 2012, 2013, 2014, 2015, 2016), c(1000, 800, 640, 600, 560, 230, 210))
     colnames(data) <- c('YEAR','COST')
     
     P <- plot_ly(data, x = ~YEAR, y = ~COST, type = 'scatter', mode = 'lines+markers', width = 600, height = 300,
             line = list(color = 'black', width = 2), marker = list(color = 'black'), name = '$COST/kwh') 
     P <- P %>% add_trace(y = c(0, 0, 0, 0, 0, 0, 0), line = list(color = '#de7247', width = 2), marker = list(color = '#de7247'), name = '$ COST PARITY WITH ICE')
     P <- P %>% layout(
       title = 'Battery Costs ($Cost/Kilowatt-Hour)',
       xaxis = list(title = "", showgrid = FALSE, showline = FALSE, zeroline = FALSE), 
       yaxis = list(title = "", showgrid = FALSE, showline = FALSE, zeroline = FALSE),
       legend = list(x = 0, y = 8, orientation = 'h'),
       autosize = F, 
       margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))
   })  
   
   output$ev_range_chart <- renderPlotly({
     data <- data.ev.models %>% select(model, range, msrp)
     
     P <- plot_ly(data, x = ~msrp, y = ~range, text = ~model, size = ~range, width = 600, height = 300, type = 'scatter', mode = 'markers')
     P <- P %>% layout(
       title = 'EV Range vs MSRP',
       xaxis = list(title = 'Cost($)'), 
       yaxis = list(title = 'Range (miles)'),
       autosize = F, 
       margin = list(l = 70, r = 70, b = 70, t = 70, pad = 0))     
   })   
   
})
