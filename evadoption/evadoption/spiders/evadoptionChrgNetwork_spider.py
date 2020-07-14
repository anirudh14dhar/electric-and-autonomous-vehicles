from scrapy import Spider
from evadoption.items import EvadoptionChrgNetworkItem

class EvadoptionChrgNetworkSpider(Spider):   
    name = "evadoptionChrgNetwork_spider"
    allowed_urls = ['https://evadoption.com/']
    start_urls = ['https://evadoption.com/ev-charging-stations-statistics/us-charging-network-rankings/']

    custom_settings = {
        'NETWORKPIPELINE_ENABLED': True
    }

    def parse(self, response):
                rows = response.xpath('//*[@id="tablepress-23"]/tbody//tr')
                for row in rows:
                    network = row.xpath('./td[1]//text()').extract_first()
                    level2_locations = int(row.xpath('./td[2]//text()').extract_first().replace(',', ''))
                    level2_conn =  int(row.xpath('./td[3]//text()').extract_first().replace(',', ''))
                    dcfc_loc = int(row.xpath('./td[4]//text()').extract_first().replace(',', ''))
                    dcfc_chrg_stations = int(row.xpath('./td[5]//text()').extract_first().replace(',', ''))
                    conn_per_loc = float(row.xpath('./td[6]//text()').extract_first())
                    level2_plus_dcfc_conn = int(row.xpath('./td[7]//text()').extract_first().replace(',', ''))
                    level2_percent = float(row.xpath('./td[8]//text()').extract_first().replace('%', ''))

                    item = EvadoptionChrgNetworkItem()
                    item['network'] = network
                    item['level2_locations'] = level2_locations
                    item['level2_conn'] = level2_conn
                    item['dcfc_loc'] = dcfc_loc
                    item['dcfc_chrg_stations'] = dcfc_chrg_stations
                    item['conn_per_loc'] = conn_per_loc
                    item['level2_plus_dcfc_conn'] = level2_plus_dcfc_conn
                    item['level2_percent'] = level2_percent

                    yield item