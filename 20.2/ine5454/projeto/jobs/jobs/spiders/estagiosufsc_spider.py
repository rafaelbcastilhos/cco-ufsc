import scrapy
from ..items import JobsItem
from ..regex import *


class EstagiosUFSCSpider(scrapy.Spider):
    name = "estagiosufsc_spider"
    allowed_domains = []

    custom_settings = {
        'CLOSESPIDER_ITEMCOUNT': 20
    }

    def start_requests(self):
        # realiza a requisicao para uma seed
        urls = ["https://estagios.ufsc.br/index.php?page=search&cursos%5B%5D=208"]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        self.logger.info(f"Scrape Page {response.url}")

        # percorre toda lista de vagas e captura o link de cada uma
        jobs_links = response.xpath("//table"
                                    "//tbody"
                                    "//tr"
                                    "//td"
                                    "//h3"
                                    "//a"
                                    "/@href").getall()

        self.logger.info(f"links especificos {jobs_links}, tamanho {len(jobs_links)}")

        # se houver links na lista de vagas, percorre um por um e realiza a requisição
        if jobs_links:
            yield from response.follow_all(jobs_links, callback=self.parse_job)

    def parse_job(self, second_response):
        # percorre a página e extrai as informações necessárias
        item = JobsItem()

        html = get_html_from_response(second_response)
        item["title"] = search_title(second_response)

        description = second_response.xpath(
            "//div[@id='description']"
            "//ul"
            "//li"
            "//strong"
            "/text()").getall()

        if "Conhecimentos Desenvolvidos: " in description:
            index = description.index("Conhecimentos Desenvolvidos: ") + 2
            description = second_response.xpath(
                "//div[@id='description']"
                "//ul"
                "//li[" + str(index) + "]"
                "/text()"
            ).getall()
            item["description"] = ' '.join(description)
        else:
            item["description"] = None

        item["company_name"] = None

        item["hiring_type"] = search_hiring_type(html)
        item["hierarchy"] = search_hierarchy(html)
        item["salary"] = search_salary(html)
        item["mode"] = search_mode(html)
        item["url"] = second_response.url

        self.logger.info(f"Job scraped")
        yield item
