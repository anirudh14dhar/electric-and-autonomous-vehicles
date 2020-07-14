#
# This is the global declarative section of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Load packages
library(shiny)
library(shinydashboard)
library(tidyverse)
library(DT)
library(plotly)
library(lubridate)
library(stringr)
suppressPackageStartupMessages(library(googleVis))

# Load data to data frames
data.avri <- read.csv("AVRI.csv", header = TRUE, stringsAsFactors = FALSE)
data.ev.models <- read.csv("evadoptionModels.csv", header = TRUE, stringsAsFactors = FALSE)
data.ev.sales.2018 <- read.csv("evadoptionSales.csv", header = TRUE, stringsAsFactors = FALSE)
data.ev.sales.2019 <- read.csv("insideev.csv", header = TRUE, stringsAsFactors = FALSE)
data.tax.credit <- read.csv("evadoptionTaxCredit.csv", header = TRUE, stringsAsFactors = FALSE)
data.tax.cpo <- read.csv("evadoptionTCPhaseOut.csv", header = TRUE, stringsAsFactors = FALSE)
data.upcoming.models <- read.csv("evadoptionUpcomingModels.csv", header = TRUE, stringsAsFactors = FALSE)
data.market.share <- read.csv("evadoptionMarketSharebyState.csv", header = TRUE, stringsAsFactors = FALSE)
data.ms.factors <- read.csv("evadoptionFactorsbyState.csv", header = TRUE, stringsAsFactors = FALSE)
data.chrg.network <- read.csv("evadoptionChrgNetwork.csv", header = TRUE, stringsAsFactors = FALSE)
data.chrg.station <- read.csv("evadoptionCSbyState.csv", header = TRUE, stringsAsFactors = FALSE)
data.autonomous.features <- read.csv("carsautonomousFeatures.csv", header = TRUE, stringsAsFactors = FALSE)
