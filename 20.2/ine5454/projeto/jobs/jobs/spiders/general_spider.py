import scrapy
import re
from ..items import JobsItem


class GeneralSpider(scrapy.Spider):
    name = 'general_spider'
    allowed_domains = []

    custom_settings = {
        'CLOSESPIDER_ITEMCOUNT': 30
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
        html = ''.join(second_response.xpath("//body//text()").extract()).strip()

        item = JobsItem()
        item["title"] = self.search_title(html)
        item["company_name"] = self.search_company_name(html)
        item["description"] = self.search_description(html)
        item["hiring_type"] = self.search_hiring_type(html)
        item["hierarchy"] = self.search_hierarchy(html)
        item["mode"] = self.search_mode(html)
        item["salary"] = self.search_salary(html)

        self.logger.info(f"Job scraped")
        yield item

    def search_title(self, html):
        return "Titulo"

    def search_company_name(self, html):
        return "Empresa"

    def search_description(self, html):
        return "Descricao"

    def search_hierarchy(self, html):
        # regex para capturar a hierarquia/experiência
        if re.search(r'(?i)s[eêEÊ]nior', html):
            return "Sênior"

        elif re.search(r'(?i)pleno', html) or re.search(r'(?i)mid[-\s]?level', html):
            return "Pleno"

        elif re.search(r'(?i)j[uU]nior', html):
            return "Junior"

        elif re.search(r'(?i)est[aáAÁ]gi[(aáAÁ)rio]*', html) or re.search(r'(?i)trainee', html):
            return "Estagiário"

        else:
            return None

    def search_hiring_type(self, html):
        # regex para capturar o tipo da contratação
        if re.search(r'(?i)clt', html):
            return "CLT"

        elif re.search(r'(?i)pj', html):
            return "PJ"

        elif re.search(r'(?i)freelancer', html):
            return "Freelancer"

        else:
            return None

    def search_mode(self, html):
        # regex para capturar o modo de trabalho
        if re.search(r'(?i)presencial', html) or re.search(r'(?i)on[-\s]?site', html):
            return "Presencial"

        elif re.search(r'(?i)home[-\s]?office', html) or re.search(r'(?i)remot[eoEO]', html):
            return "Remoto"

        elif re.search(r'(?i)h[iíÍ]brido', html) or re.search(r'(?i)mixed', html):
            return "Híbrido"

        else:
            return None

    def search_salary(self, html):
        # regex para capturar o salário com diferentes moedas e pontuação
        salary = re.search(r'(?i)(R\$|€|£|USD|US\$)\s?(\d{1,4}(\.\d{3})?)(,\d{2})?(\.\d{2})?([kK])?', html)
        if salary:
            print(f"habemuus salario {salary.group()}")
            return salary.group()

        else:
            return "A combinar"
