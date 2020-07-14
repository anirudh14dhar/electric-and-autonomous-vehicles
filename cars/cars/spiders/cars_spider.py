from scrapy import Spider
from cars.items import CarsItem

class Carsspider(Spider):   
    name = "cars_spider"
    allowed_urls = ['https://www.cars.com/']
    start_urls = ['https://www.cars.com/articles/which-cars-have-self-driving-features-for-2020-418934/']

    def parse(self, response):
                rows = response.xpath('//*[@class="mainBody"]')
                for i in range(1, 36):
                    pattern = './h2[%d]//text()' % i
                    brand = rows.xpath(pattern).extract_first()
                    
                    if brand != 'More About the Systems':
                        item = CarsItem()
                        item['brand'] = brand
                        yield item
                    else:
                        continue

                i = 1
                pattern = './h3[%d]//text()' % i
                while bool(rows.xpath(pattern).extract_first()):
                    feature = rows.xpath(pattern).extract_first().replace(':', '')

                    if feature != "What should I look for?" and feature != "Lane-Centering Steering" and feature != "Hands-Free Steering" and feature != "Attention-Free Driving":
                        item = CarsItem()
                        item['feature'] = feature
                        yield item
                        i += 1
                        pattern = './h3[%d]//text()' % i
                    else:
                        i += 1
                        pattern = './h3[%d]//text()' % i
                        continue

                i = 1
                pattern = './ul[%d]//text()' % i 
                while bool(rows.xpath(pattern).extract_first()):
                    model = list(filter(lambda x: x != '\n', rows.xpath(pattern).extract()))

                    item = CarsItem()
                    item['model'] = model
                    yield item
                    i += 1
                    pattern = './ul[%d]//text()' % i 
                    
                        






