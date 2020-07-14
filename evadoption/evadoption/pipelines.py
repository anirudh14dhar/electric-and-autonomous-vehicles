# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html

from scrapy.exceptions import DropItem
from scrapy.exporters import CsvItemExporter
from scrapy.exceptions import NotConfigured
import pandas as pd 

class ValidateItemPipeline(object):
    def process_item(self, item, spider):
        if any(pd.isnull(list(item.values()))):
            raise DropItem("Missing values!")
        else:
            return item

class EvadoptionModelPipeline(object):
    def __init__(self):
        self.filename = 'evadoptionModels.csv'
    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.getbool('MODELPIPELINE_ENABLED'):
            raise NotConfigured
        return cls()
    def open_spider(self, spider):
        if spider.name == 'evadoptionModel_spider':
            self.csvfile = open(self.filename, 'wb')
            self.exporter = CsvItemExporter(self.csvfile)
            self.exporter.start_exporting()
    def close_spider(self, spider):
        if spider.name == 'evadoptionModel_spider':
            self.exporter.finish_exporting()
            self.csvfile.close()
    def process_item(self, item, spider):
        if spider.name == 'evadoptionModel_spider':
            self.exporter.export_item(item)
            return item

class EvadoptionSalesPipeline(object):
    def __init__(self):
        self.filename = 'evadoptionSales.csv'
    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.getbool('SALESPIPELINE_ENABLED'):
            raise NotConfigured
        return cls()
    def open_spider(self, spider):
        if spider.name == 'evadoptionSales_spider':
            self.csvfile = open(self.filename, 'wb')
            self.exporter = CsvItemExporter(self.csvfile)
            self.exporter.start_exporting()
    def close_spider(self, spider):
        if spider.name == 'evadoptionSales_spider':
            self.exporter.finish_exporting()
            self.csvfile.close()
    def process_item(self, item, spider):
        if spider.name == 'evadoptionSales_spider':
            self.exporter.export_item(item)
            return item

class EvadoptionTaxCreditPipeline(object):
    def __init__(self):
        self.filename = 'evadoptionTaxCredit.csv'
    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.getbool('TAXCREDITPIPELINE_ENABLED'):
            raise NotConfigured
        return cls()
    def open_spider(self, spider):
        if spider.name == 'evadoptionTaxCredit_spider':
            self.csvfile = open(self.filename, 'wb')
            self.exporter = CsvItemExporter(self.csvfile)
            self.exporter.start_exporting()
    def close_spider(self, spider):
        if spider.name == 'evadoptionTaxCredit_spider':
            self.exporter.finish_exporting()
            self.csvfile.close()
    def process_item(self, item, spider):
        if spider.name == 'evadoptionTaxCredit_spider':
            self.exporter.export_item(item)
            return item

class EvadoptionTCPhaseOutPipeline(object):
    def __init__(self):
        self.filename = 'evadoptionTCPhaseOut.csv'
    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.getbool('TCPHASEOUTPIPELINE_ENABLED'):
            raise NotConfigured
        return cls()
    def open_spider(self, spider):
        if spider.name == 'evadoptionTCPhaseOut_spider':
            self.csvfile = open(self.filename, 'wb')
            self.exporter = CsvItemExporter(self.csvfile)
            self.exporter.start_exporting()
    def close_spider(self, spider):
        if spider.name == 'evadoptionTCPhaseOut_spider':
            self.exporter.finish_exporting()
            self.csvfile.close()
    def process_item(self, item, spider):
        if spider.name == 'evadoptionTCPhaseOut_spider':
            self.exporter.export_item(item)
            return item

class EvadoptionUpcomingModelsPipeline(object):
    def __init__(self):
        self.filename = 'evadoptionUpcomingModels.csv'
    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.getbool('UPCOMINGMODELSPIPELINE_ENABLED'):
            raise NotConfigured
        return cls()
    def open_spider(self, spider):
        if spider.name == 'evadoptionUpcomingModels_spider':
            self.csvfile = open(self.filename, 'wb')
            self.exporter = CsvItemExporter(self.csvfile)
            self.exporter.start_exporting()
    def close_spider(self, spider):
        if spider.name == 'evadoptionUpcomingModels_spider':
            self.exporter.finish_exporting()
            self.csvfile.close()
    def process_item(self, item, spider):
        if spider.name == 'evadoptionUpcomingModels_spider':
            self.exporter.export_item(item)
            return item

class EvadoptionMarketSharebyStatePipeline(object):
    def __init__(self):
        self.filename = 'evadoptionMarketSharebyState.csv'
    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.getbool('MARKETSHAREPIPELINE_ENABLED'):
            raise NotConfigured
        return cls()
    def open_spider(self, spider):
        if spider.name == 'evadoptionMarketSharebyState_spider':
            self.csvfile = open(self.filename, 'wb')
            self.exporter = CsvItemExporter(self.csvfile)
            self.exporter.start_exporting()
    def close_spider(self, spider):
        if spider.name == 'evadoptionMarketSharebyState_spider':
            self.exporter.finish_exporting()
            self.csvfile.close()
    def process_item(self, item, spider):
        if spider.name == 'evadoptionMarketSharebyState_spider':
            self.exporter.export_item(item)
            return item

class EvadoptionFactorsbyStatePipeline(object):
    def __init__(self):
        self.filename = 'evadoptionFactorsbyState.csv'
    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.getbool('FACTORSPIPELINE_ENABLED'):
            raise NotConfigured
        return cls()
    def open_spider(self, spider):
        if spider.name == 'evadoptionFactorsbyState_spider':
            self.csvfile = open(self.filename, 'wb')
            self.exporter = CsvItemExporter(self.csvfile)
            self.exporter.start_exporting()
    def close_spider(self, spider):
        if spider.name == 'evadoptionFactorsbyState_spider':
            self.exporter.finish_exporting()
            self.csvfile.close()
    def process_item(self, item, spider):
        if spider.name == 'evadoptionFactorsbyState_spider':
            self.exporter.export_item(item)
            return item

class EvadoptionCSbyStatePipeline(object):
    def __init__(self):
        self.filename = 'evadoptionCSbyState.csv'
    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.getbool('CSBYSTATEPIPELINE_ENABLED'):
            raise NotConfigured
        return cls()
    def open_spider(self, spider):
        if spider.name == 'evadoptionCSbyState_spider':
            self.csvfile = open(self.filename, 'wb')
            self.exporter = CsvItemExporter(self.csvfile)
            self.exporter.start_exporting()
    def close_spider(self, spider):
        if spider.name == 'evadoptionCSbyState_spider':
            self.exporter.finish_exporting()
            self.csvfile.close()
    def process_item(self, item, spider):
        if spider.name == 'evadoptionCSbyState_spider':
            self.exporter.export_item(item)
            return item

class EvadoptionChrgNetworkPipeline(object):
    def __init__(self):
        self.filename = 'evadoptionChrgNetwork.csv'
    @classmethod
    def from_crawler(cls, crawler):
        if not crawler.settings.getbool('NETWORKPIPELINE_ENABLED'):
            raise NotConfigured
        return cls()
    def open_spider(self, spider):
        if spider.name == 'evadoptionChrgNetwork_spider':
            self.csvfile = open(self.filename, 'wb')
            self.exporter = CsvItemExporter(self.csvfile)
            self.exporter.start_exporting()
    def close_spider(self, spider):
        if spider.name == 'evadoptionChrgNetwork_spider':
            self.exporter.finish_exporting()
            self.csvfile.close()
    def process_item(self, item, spider):
        if spider.name == 'evadoptionChrgNetwork_spider':
            self.exporter.export_item(item)
            return item
