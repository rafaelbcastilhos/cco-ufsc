import scrapy
from ..items import JobsItem
from ..regex import *


class CathoSpider(scrapy.Spider):
    name = "catho_spider"

    start_urls = ['https://www.catho.com.br/vagas/cientista-de-dados/']

    custom_settings = {
        'CLOSESPIDER_ITEMCOUNT': 10
    }

    def parse(self, response):
        self.logger.info(f"Scrape Page {response.url}")

        total = response.xpath("//p[@class='sc-caSCKo ifvWxd']"
                               "/text()").get()

        split = total.split(": ")
        total = int(split[1])
        total = int(total / 20) + 1

        urls = []

        for x in range(2, total + 1):
            urls.append("https://www.catho.com.br/vagas/cientista-de-dados/?q=Cientista%20de%20Dados&page=" + str(x))

        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse_job)

    def parse_job(self, second_response):

        jobs = second_response.xpath("//li[@class='sc-cJSrbW eECoeS']")

        for job in jobs:
            item = JobsItem()

            title = job.css("::attr(data-gtm-dimension-38)").extract()
            item["title"] = str(title[0])

            item["company_name"] = None

            salary = job.css("::attr(data-gtm-dimension-41)").extract()
            item["salary"] = str(salary[0])

            item["description"] = None

            # html = get_html_from_response(second_response)
            # item["hiring_type"] = search_hiring_type(html)
            # item["hierarchy"] = search_hierarchy(html)
            # item["mode"] = search_mode(html)
            # item["url"] = second_response.url

            yield item
