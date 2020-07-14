from scrapy import Spider
from evadoption.items import EvadoptionModelItem

class EvadoptionModelSpider(Spider):   
    name = "evadoptionModel_spider"
    allowed_urls = ['https://evadoption.com/']
    start_urls = ['https://evadoption.com/ev-models/']

    custom_settings = {
        'MODELPIPELINE_ENABLED': True
    }

    def parse(self, response):

                rows = response.xpath('//*[@id="tablepress-21"]/tbody//tr')
                for row in rows:
                    model = row.xpath('./td[1]/text()').extract_first()
                    type = row.xpath('./td[2]/text()').extract_first()
                    range = int(row.xpath('./td[3]/text()').extract_first())
                    msrp = int(row.xpath('./td[4]/text()').extract_first().replace('$', '').replace(',', ''))
                    cpmr = int(row.xpath('./td[5]/text()').extract_first().replace('$', '').replace(',', ''))
                    bpack = row.xpath('./td[6]/text()').extract_first()
                    cpkwh = int(row.xpath('./td[7]/text()').extract_first().replace('$', '').replace(',', ''))
                    mpkwh = row.xpath('./td[8]/text()').extract_first()

                    item = EvadoptionModelItem()
                    item['model'] = model
                    item['type'] = type
                    item['range'] = range
                    item['msrp'] = msrp
                    item['cpmr'] = cpmr
                    item['bpack'] = bpack
                    item['cpkwh'] = cpkwh
                    item['mpkwh'] = mpkwh

                    yield item
