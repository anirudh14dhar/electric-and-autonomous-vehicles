from scrapy import Spider
from evadoption.items import EvadoptionMarketSharebyStateItem

class EvadoptionMarketSharebyStateSpider(Spider):   
    name = "evadoptionMarketSharebyState_spider"
    allowed_urls = ['https://evadoption.com/']
    start_urls = ['https://evadoption.com/ev-market-share/ev-market-share-state/']

    custom_settings = {
        'MARKETSHAREPIPELINE_ENABLED': True
    }
    
    def parse(self, response):

                rows = response.xpath('//*[@id="tablepress-20"]/tbody//tr')
                for row in rows:
                    state = row.xpath('./td[1]/text()').extract_first()
                    evsales_2017 = int(row.xpath('./td[2]/text()').extract_first().replace(',', ''))
                    evsales_2018 = int(row.xpath('./td[3]/text()').extract_first().replace(',', ''))
                    yoy_sales_increase = float(row.xpath('./td[4]/text()').extract_first().replace('%', ''))
                    ms_win_state_17 = float(row.xpath('./td[4]/text()').extract_first().replace('%', ''))
                    ms_win_state_18 = float(row.xpath('./td[5]/text()').extract_first().replace('%', ''))
                    yoy_share_increase = float(row.xpath('./td[6]/text()').extract_first().replace('%', ''))

                    item = EvadoptionMarketSharebyStateItem()
                    item['state'] = state
                    item['evsales_2017'] = evsales_2017
                    item['evsales_2018'] = evsales_2018
                    item['yoy_sales_increase'] = yoy_sales_increase
                    item['ms_win_state_17'] = ms_win_state_17
                    item['ms_win_state_18'] = ms_win_state_18
                    item['yoy_share_increase'] = yoy_share_increase

                    yield item