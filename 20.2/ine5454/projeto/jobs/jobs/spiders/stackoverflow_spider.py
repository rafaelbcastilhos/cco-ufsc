import scrapy
from ..items import JobsItem
from ..regex import *


class StackoverflowSpider(scrapy.Spider):
    name = "stackoverflow_spider"
    allowed_domains = []

    custom_settings = {
        'CLOSESPIDER_ITEMCOUNT': 10
    }

    def start_requests(self):
        # realiza a requisicao para uma seed
        urls = ["https://stackoverflow.com/jobs?dr=BackendDeveloper"]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        self.logger.info(f"Scrape Page {response.url}")

        # percorre toda lista de vagas e captura o link de cada uma
        jobs_links = response.xpath("//div[@class='grid--cell fl1 ']"
                                    "//h2"
                                    "//a"
                                    "/@href").getall()

        self.logger.info(f"links especificos {jobs_links}, tamanho {len(jobs_links)}")

        # encontra o botão e captura o link para a próxima página
        next_page = response.xpath("//div[@class='s-pagination']"
                                   "//a[last()]"
                                   "/@href").get()

        self.logger.info(f"next {next_page}")

        # se houver links na lista de vagas, percorre um por um e realiza a requisição
        if jobs_links is not None:
            yield from response.follow_all(jobs_links, callback=self.parse_job)

        # realiza requisição para a próxima página
        if next_page is not None:
            yield response.follow(next_page, callback=self.parse)

    def parse_job(self, second_response):
        # percorre a página e extrai as informações necessárias
        item = JobsItem()

        item["title"] = second_response.xpath(
            "//h1[@class='fs-headline1 sticky:fs-body3 sticky:sm:fs-subheading t mb4 sticky:mb2']"
            "//a"
            "/@title").get()

        item["company_name"] = second_response.xpath(
            "//div[@class='fc-black-700 mb4 sticky:mb0 sticky:mr8 fs-body2 sticky:fs-body1 sticky:sm:fs-caption']"
            "//a"
            "/text()").get()

        # item["mode"] = second_response.xpath(
        #     "//span[@class='fc-yellow-500']"
        #     "/text()").get()

        # item["salary"] = second_response.xpath(
        #     "//span[@class='fc-green-400']"
        #     "/text()").get()

        # item["hierarchy"] = second_response.xpath(
        #     "//div[@class='grid gs16 gsx sm:fd-column fs-body2 fc-medium']"
        #     "//div[@class='grid--cell6']"
        #     "//div[2]"
        #     "//span[@class='fw-bold']"
        #     "/text()").get()

        item["description"] = second_response.xpath(
            "//div[@class='grid gs16 gsx sm:fd-column fs-body2 fc-medium']"
            "//div[@class='grid--cell6']"
            "//div[3]"
            "//span[@class='fw-bold']"
            "/text()").get()

        html = get_html_from_response(second_response)
        item["hiring_type"] = search_hiring_type(html)
        item["hierarchy"] = search_hierarchy(html)
        item["salary"] = search_salary(html)
        item["mode"] = search_mode(html)

        self.logger.info(f"Job scraped")
        yield item
