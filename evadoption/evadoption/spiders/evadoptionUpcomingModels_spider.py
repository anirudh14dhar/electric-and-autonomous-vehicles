from scrapy import Spider
from evadoption.items import EvadoptionUpcomingModelsItem

class EvadoptionUpcomingModelsItemSpider(Spider):
    name = "evadoptionUpcomingModels_spider"
    allowed_urls = ['https://evadoption.com/']
    start_urls = ['https://evadoption.com/future-evs/new-electric-vehicles-in-2020/']

    custom_settings = {
        'UPCOMINGMODELSPIPELINE_ENABLED': True
    }
    
    def parse(self, response):
                rows = response.xpath('//*[@id="tablepress-27"]/tbody//tr')
                for row in rows:
                    brand = row.xpath('./td[1]/text()').extract_first()
                    model = row.xpath('./td[2]/text()').extract_first()
                    evtype = row.xpath('./td[3]/text()').extract_first()
                    bodytype = row.xpath('./td[4]/text()').extract_first()
                    range = int(row.xpath('./td[5]/text()').extract_first()[0:3])
                    msrp = int(row.xpath('./td[6]/text()').extract_first().replace('$', '').replace(',', '')[0:4])
                    availability = int(row.xpath('./td[7]/text()').extract_first()[0:4])

                    item = EvadoptionUpcomingModelsItem()
                    item['brand'] = brand
                    item['model'] = model
                    item['evtype'] = evtype
                    item['bodytype'] = bodytype
                    item['range'] = range
                    item['msrp'] = msrp
                    item['availability'] = availability

                    yield item