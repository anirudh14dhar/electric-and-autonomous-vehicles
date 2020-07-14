# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy

class CarsItem(scrapy.Item):
    brand = scrapy.Field()
    feature = scrapy.Field()
    model = scrapy.Field()
