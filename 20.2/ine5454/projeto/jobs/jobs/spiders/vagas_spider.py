import scrapy
from ..items import JobsItem


class VagasSpider(scrapy.Spider):
    name = "vagas_spider"
    allowed_domains = []

    custom_settings = {
        'CLOSESPIDER_ITEMCOUNT': 15
    }

    def start_requests(self):
        # realiza a requisicao para uma seed
        urls = ["https://www.vagas.com.br/vagas-de-devops"]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        self.logger.info(f"Scrape Page {response.url}")

        # percorre toda lista de vagas e captura o link de cada uma
        jobs_links = response.xpath("//div[@class='informacoes-header']"
                                    "//h2"
                                    "//a"
                                    "/@href").getall()

        self.logger.info(f"links especificos {jobs_links}, tamanho {len(jobs_links)}")

        # encontra o botão e captura o link para a próxima página
        next_page = response.xpath("//div[@id='todasVagas']"
                                   "//a"
                                   "/@href").get()

        self.logger.info(f"next {next_page}")

        # se houver links na lista de vagas, percorre um por um e realiza a requisição
        if jobs_links is not None:
            yield from response.follow_all(jobs_links, callback=self.parse_job)

        # realiza requisição para a próxima página
        if next_page:
            yield response.follow(next_page, callback=self.parse)

    def parse_job(self, second_response):
        # percorre a página e extrai as informações necessárias
        item = JobsItem()

        item["title"] = second_response.xpath(
            "//div[@class='job-shortdescription__column job-shortdescription__column--second']"
            "//h1"
            "/text()").get()

        item["company_name"] = second_response.xpath(
            "//div[@class='job-shortdescription__column job-shortdescription__column--second']"
            "//div"
            "//h2"
            "/text()").get()

        item["salary"] = second_response.xpath(
            "//div[@class='infoVaga']"
            "//ul"
            "//li"
            "//div"
            "//span[2]"
            "/text()").get()

        item["hierarchy"] = second_response.xpath(
            "//div[@class='job-hierarchylist']"
            "//span"
            "/@aria-label").get()

        item["description"] = None
        item["hiring_type"] = None
        item["mode"] = None

        self.logger.info(f"Job scraped")
        yield item
