# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy

class EvadoptionModelItem(scrapy.Item):
    model = scrapy.Field()
    type = scrapy.Field()
    range = scrapy.Field()
    msrp = scrapy.Field()
    cpmr = scrapy.Field()
    bpack = scrapy.Field()
    cpkwh = scrapy.Field()
    mpkwh = scrapy.Field()

class EvadoptionSalesItem(scrapy.Item):
    brand = scrapy.Field()
    totsales = scrapy.Field()
    evsales = scrapy.Field()
    pevs = scrapy.Field()
    uspevs = scrapy.Field()
    ptusvs = scrapy.Field()

class EvadoptionTaxCreditItem(scrapy.Item):
    model = scrapy.Field()
    type = scrapy.Field()
    ftc = scrapy.Field()
    cvrp = scrapy.Field()
    cvrpr = scrapy.Field()
    range = scrapy.Field()
    msrp = scrapy.Field()
    amsrp = scrapy.Field()

class EvadoptionTCPhaseOutItem(scrapy.Item):
    brand = scrapy.Field()
    tot_10_19 = scrapy.Field()
    to200k = scrapy.Field()
    tot_jan_jun_19 = scrapy.Field()
    avg_sal_19 = scrapy.Field()

class EvadoptionUpcomingModelsItem(scrapy.Item):
    brand = scrapy.Field()
    model = scrapy.Field()
    evtype = scrapy.Field()
    bodytype = scrapy.Field()
    range = scrapy.Field()
    msrp = scrapy.Field()
    availability = scrapy.Field()

class EvadoptionMarketSharebyStateItem(scrapy.Item):
    state = scrapy.Field()
    evsales_2017 = scrapy.Field()
    evsales_2018 = scrapy.Field()
    yoy_sales_increase = scrapy.Field()
    ms_win_state_17 = scrapy.Field()
    ms_win_state_18 = scrapy.Field()
    yoy_share_increase = scrapy.Field()

class EvadoptionFactorsbyStateItem(scrapy.Item):
    state = scrapy.Field()
    evsales_share = scrapy.Field()
    zev_mandate = scrapy.Field()
    ev_taxcredit = scrapy.Field()
    gas_price_per_gallon = scrapy.Field()
    percent_light_trucks = scrapy.Field()
    median_household_income = scrapy.Field()
    green_score = scrapy.Field() 
    cfa_code = scrapy.Field()

class EvadoptionCSbyStateItem(scrapy.Item):
    state = scrapy.Field()
    chrg_locations = scrapy.Field()
    chrg_outlets = scrapy.Field()
    outlets_per_loc = scrapy.Field()
    ev_stock_11_18 = scrapy.Field()
    evs_to_chrg_outlets = scrapy.Field()

class EvadoptionChrgNetworkItem(scrapy.Item):
    network = scrapy.Field()
    level2_locations = scrapy.Field()
    level2_conn = scrapy.Field()
    dcfc_loc = scrapy.Field()
    dcfc_chrg_stations = scrapy.Field()
    conn_per_loc = scrapy.Field()
    level2_plus_dcfc_conn = scrapy.Field()
    level2_percent = scrapy.Field()