from scrapy import Spider
from evadoption.items import EvadoptionTaxCreditItem

class EvadoptionTaxCreditSpider(Spider):
    name = "evadoptionTaxCredit_spider"
    allowed_urls = ['https://evadoption.com/']
    start_urls = ['https://evadoption.com/ev-sales/federal-and-california-incentives-by-ev-model/']

    custom_settings = {
        'TAXCREDITPIPELINE_ENABLED': True
    }

    def parse(self, response):
                rows = response.xpath('//*[@id="tablepress-28"]/tbody//tr')
                for row in rows:
                    model = row.xpath('./td[1]/text()').extract_first()
                    type = row.xpath('./td[2]/text()').extract_first()
                    ftc = int(row.xpath('./td[3]/text()').extract_first().replace('$', '').replace(',', '').replace('N/A', '0'))
                    cvrp = row.xpath('./td[4]/text()').extract_first()
                    cvrpr = int(row.xpath('./td[5]/text()').extract_first().replace('$', '').replace(',', ''))
                    range = float(row.xpath('./td[6]/text()').extract_first())
                    msrp = int(row.xpath('./td[7]/text()').extract_first().replace('$', '').replace(',', ''))
                    amsrp = int(row.xpath('./td[8]/text()').extract_first().replace('$', '').replace(',', ''))

                    item = EvadoptionTaxCreditItem()
                    item['model'] = model
                    item['type'] = type
                    item['ftc'] = ftc
                    item['cvrp'] = cvrp
                    item['cvrpr'] = cvrpr
                    item['range'] = range
                    item['msrp'] = msrp
                    item['amsrp'] = amsrp

                    yield item