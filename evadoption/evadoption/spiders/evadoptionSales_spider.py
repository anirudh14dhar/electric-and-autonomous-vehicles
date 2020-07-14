from scrapy import Spider
from evadoption.items import EvadoptionSalesItem

class EvadoptionSalesSpider(Spider):
    name = "evadoptionSales_spider"
    allowed_urls = ['https://evadoption.com/']
    start_urls = ['https://evadoption.com/ev-sales/evs-percent-of-vehicle-sales-by-brand/']

    custom_settings = {
        'SALESPIPELINE_ENABLED': True
    }

    def parse(self, response):
                rows = response.xpath('//*[@id="tablepress-10"]/tbody//tr')
                for row in rows:
                    brand = row.xpath('./td[1]/text()').extract_first()
                    totsales = int(row.xpath('./td[2]/text()').extract_first().replace('$', '').replace(',', ''))
                    evsales = int(row.xpath('./td[3]/text()').extract_first().replace('$', '').replace(',', ''))
                    pevs = float(row.xpath('./td[4]/text()').extract_first().replace('%',''))
                    uspevs = float(row.xpath('./td[5]/text()').extract_first().replace('%',''))
                    ptusvs = float(row.xpath('./td[6]/text()').extract_first().replace('%',''))

                    item = EvadoptionSalesItem()
                    item['brand'] = brand
                    item['totsales'] = totsales
                    item['evsales'] = evsales
                    item['pevs'] = pevs
                    item['uspevs'] = uspevs
                    item['ptusvs'] = ptusvs

                    yield item