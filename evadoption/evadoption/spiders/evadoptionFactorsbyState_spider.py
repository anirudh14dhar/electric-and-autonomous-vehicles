from scrapy import Spider
from evadoption.items import EvadoptionFactorsbyStateItem
import re

class EvadoptionFactorsbyStateSpider(Spider):   
    name = "evadoptionFactorsbyState_spider"
    allowed_urls = ['https://evadoption.com/']
    start_urls = ['https://evadoption.com/factors-contributing-to-ev-sales-market-share-by-us-state/']

    custom_settings = {
        'FACTORSPIPELINE_ENABLED': True
    }
    
    def parse(self, response):
                rows = response.xpath('//*[@id="tablepress-12"]/tbody//tr')
                for row in rows:
                    state = row.xpath('./td[1]//text()').extract_first()
                    evsales_share = float(row.xpath('./td[2]/text()').extract_first().replace('%', ''))
                    zev_mandate =  row.xpath('./td[3]/text()').extract_first()
                    if zev_mandate == 'N/A':
                        zev_mandate = 0
                    elif zev_mandate == 'ZEV':
                        zev_mandate = 1
                    else:
                        zev_mandate = 2
                    zev_mandate = int(zev_mandate)
                    ev_taxcredit = row.xpath('./td[4]/text()').extract_first().replace('*', '')
                    gas_price_per_gallon = float(row.xpath('./td[5]/text()').extract_first().replace('$', ''))
                    percent_light_trucks = float(row.xpath('./td[6]/text()').extract_first().replace('%', ''))
                    median_household_income = int(row.xpath('./td[7]/text()').extract_first().replace(',', ''))
                    green_score = float(row.xpath('./td[8]/text()').extract_first().replace('N/A', '0'))
                    color = row.xpath('./td[1]//font/@color').extract_first()
                    if color == '#ff0000':
                        cfa_code = 'RED'
                    else:
                        cfa_code = 'BLUE'

                    item = EvadoptionFactorsbyStateItem()
                    item['state'] = state
                    item['evsales_share'] = evsales_share
                    item['zev_mandate'] = zev_mandate
                    item['ev_taxcredit'] = ev_taxcredit
                    item['gas_price_per_gallon'] = gas_price_per_gallon
                    item['percent_light_trucks'] = percent_light_trucks
                    item['median_household_income'] = median_household_income
                    item['green_score'] = green_score
                    item['cfa_code'] = cfa_code

                    yield item
