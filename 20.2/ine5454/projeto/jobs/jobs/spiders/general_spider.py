from ..items import JobsItem
from ..regex import *
from scrapy.linkextractors import LinkExtractor
import scrapy


class GeneralSpider(scrapy.Spider):
    name = "general_spider"
    allowed_domains = []

    custom_settings = {
        'CLOSESPIDER_ITEMCOUNT': 100
    }

    def start_requests(self):
        urls = ["https://www.nsctotal.com.br/noticias/busca-empregos-na-area-de-ti-em-santa-catarina-fique-atento"]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        link_extractor_first = LinkExtractor()
        reponse_link = link_extractor_first.extract_links(response)

        for link in reponse_link:
            print(f"Scrape page {link.url}")
            yield response.follow(link.url, self.parse_link)

    def parse_link(self, response):
        link_extractor_second = LinkExtractor()
        reponse_link = link_extractor_second.extract_links(response)

        for link in reponse_link:
            print(f"Scrape page {link.url}")
            url = link.url
            found = response.follow(url, self.parse_job)

            if found:
                yield found
            else:
                response.follow(link, self.parse_link)

    def parse_job(self, second_response):
        item = JobsItem()

        html = get_html_from_response(second_response)
        item["title"] = search_general_title(second_response)
        item["description"] = search_description(html)
        item["company_name"] = None
        item["hiring_type"] = search_hiring_type(html)
        item["hierarchy"] = search_hierarchy(html)
        item["salary"] = search_salary(html)
        item["mode"] = search_mode(html)
        item["url"] = second_response.url

        if item["salary"] is not None and item["title"]:
            return item
        else:
            return None
