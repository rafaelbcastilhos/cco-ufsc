from ..items import JobsItem
from ..regex import *
from scrapy.linkextractors import LinkExtractor
import scrapy


class GeneralSpider(scrapy.Spider):
    name = "general_spider"
    allowed_domains = []

    custom_settings = {
        'CLOSESPIDER_ITEMCOUNT': 200
    }

    def start_requests(self):
        urls = ["https://www.nsctotal.com.br/noticias/busca-empregos-na-area-de-ti-em-santa-catarina-fique-atento"]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        jobs_links = response.xpath("//div[@class='paywall-content']"
                                    "//div"
                                    "//div"
                                    "//div"
                                    "//p"
                                    "//a"
                                    "/@href").getall()

        print(f"jobs_links {jobs_links}")

        if "https://www.nextshipping.com.br/" in jobs_links:
            jobs_links.remove("https://www.nextshipping.com.br/")
        for link in jobs_links[2:-3]:
            yield response.follow(link, self.parse_link)

    def parse_link(self, response):
        link_extractor_second = LinkExtractor()
        reponse_link = link_extractor_second.extract_links(response)

        print(f"reponse_link {reponse_link}")
        for link in reponse_link:
            print(f"Scrape page {link.url}")
            url = link.url
            found = response.follow(url, self.parse_job)

            if found:
                yield found

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

        if item["salary"] is not None and \
                (item["mode"] is not None or
                 item["hierarchy"] is not None or
                 item["hiring_type"] is not None) and \
                (item["title"] is not None or
                 item["description"] is not None):
            return item
        else:
            return None
