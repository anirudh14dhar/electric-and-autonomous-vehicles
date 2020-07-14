from scrapy import Spider
from evadoption.items import EvadoptionTCPhaseOutItem

class EvadoptionTCPhaseOutSpider(Spider):
    name = "evadoptionTCPhaseOut_spider"
    allowed_urls = ['https://evadoption.com/']
    start_urls = ['https://evadoption.com/ev-sales/federal-ev-tax-credit-phase-out-tracker-by-automaker/']

    custom_settings = {
        'TCPHASEOUTPIPELINE_ENABLED': True
    }
    
    def parse(self, response):
                rows = response.xpath('//*[@id="tablepress-6"]/tbody//tr')
                for row in rows:
                    brand = row.xpath('./td[1]/text()').extract_first()
                    tot_10_19 = int(row.xpath('./td[2]/text()').extract_first().replace(',', ''))
                    to200k = int(row.xpath('./td[3]/text()').extract_first().replace(',', ''))
                    tot_jan_jun_19 = int(row.xpath('./td[4]/text()').extract_first().replace(',', ''))
                    avg_sal_19 = int(row.xpath('./td[5]/text()').extract_first().replace(',', ''))

                    item = EvadoptionTCPhaseOutItem()
                    item['brand'] = brand
                    item['tot_10_19'] = tot_10_19
                    item['to200k'] = to200k
                    item['tot_jan_jun_19'] = tot_jan_jun_19
                    item['avg_sal_19'] = avg_sal_19

                    yield item