from scrapy import Spider
from evadoption.items import EvadoptionCSbyStateItem

class EvadoptionChrgNetworkSpider(Spider):   
    name = "evadoptionCSbyState_spider"
    allowed_urls = ['https://evadoption.com/']
    start_urls = ['https://evadoption.com/ev-charging-stations-statistics/charging-stations-by-state/']

    custom_settings = {
        'CSBYSTATEPIPELINE_ENABLED': True
    }

    def parse(self, response):
                rows = response.xpath('//*[@id="tablepress-22"]/tbody//tr')
                for row in rows:
                    state = row.xpath('./td[1]//text()').extract_first()
                    chrg_locations = int(row.xpath('./td[2]//text()').extract_first().replace(',', ''))
                    chrg_outlets =  int(row.xpath('./td[3]//text()').extract_first().replace(',', ''))
                    outlets_per_loc = float(row.xpath('./td[4]//text()').extract_first())
                    ev_stock_11_18 = int(row.xpath('./td[5]//text()').extract_first().replace(',', ''))
                    evs_to_chrg_outlets = float(row.xpath('./td[6]//text()').extract_first())

                    item = EvadoptionCSbyStateItem()
                    item['state'] = state
                    item['chrg_locations'] = chrg_locations
                    item['chrg_outlets'] = chrg_outlets
                    item['outlets_per_loc'] = outlets_per_loc
                    item['ev_stock_11_18'] = ev_stock_11_18
                    item['evs_to_chrg_outlets'] = evs_to_chrg_outlets

                    yield item