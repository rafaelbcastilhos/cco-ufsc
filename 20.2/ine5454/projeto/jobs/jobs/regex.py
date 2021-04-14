import re


def get_html_from_response(response):
    return ''.join(response.xpath("//body//text()").extract()).strip()


# regex para capturar a hierarquia/experiência
def search_hierarchy(html):
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


# regex para capturar o tipo da contratação
def search_hiring_type(html):
    if re.search(r'(?i)clt', html):
        return "CLT"

    elif re.search(r'(?i)pj', html):
        return "PJ"

    elif re.search(r'(?i)freela[ncer]?', html):
        return "Freelancer"

    else:
        return None


# regex para capturar o modo de trabalho
def search_mode(html):
    if re.search(r'(?i)presencial', html) or re.search(r'(?i)on[-\s]?site', html):
        return "Presencial"

    elif re.search(r'(?i)home[-\s]?office', html) or re.search(r'(?i)remot[eoEO]', html):
        return "Remoto"

    elif re.search(r'(?i)h[iíÍ]brido', html) or re.search(r'(?i)mixed', html):
        return "Híbrido"

    else:
        return None


# regex para capturar o salário com diferentes moedas e pontuação
def search_salary(html):
    salary = re.search(r'(?i)(R\$|€|£|USD|US\$)\s?(\d{1,4}(\.\d{3})?)(,\d{2})?(\.\d{2})?([kK])?', html)
    if salary:
        print(f"log salario {salary.group()}")
        return salary.group()

    else:
        return None


# regex para capturar o título da vaga quando inicia com "Vaga 'de || em'"
def search_title(html):
    title = re.search(r'(?i)[\n\r][ \t]*(vaga (de|em)?)[ \t]*([^\n\r]*)', html)
    if title:
        print(f"log title {title.group()}")
        return title.group()

    else:
        return None


# regex para capturar a descrição da vaga quando possui a palavra chave "descrição || description"
def search_description(html):
    description = re.search(r'(?i)[\n\r][ \t]*((job)?descri[cCçÇpP][aAãÃtT][iI]?o[nN]?)[ \t]*([^\n\r]*)[\r\n]+([^\r\n]+)', html)
    if description:
        print(f"log description {description.group()}")
        return description.group()

    else:
        return None
