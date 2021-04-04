import re


def get_html_from_response(response):
    return ''.join(response.xpath("//body//text()").extract()).strip()


def search_hierarchy(html):
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


def search_hiring_type(html):
    # regex para capturar o tipo da contratação
    if re.search(r'(?i)clt', html):
        return "CLT"

    elif re.search(r'(?i)pj', html):
        return "PJ"

    elif re.search(r'(?i)freelancer', html):
        return "Freelancer"

    else:
        return None


def search_mode(html):
    # regex para capturar o modo de trabalho
    if re.search(r'(?i)presencial', html) or re.search(r'(?i)on[-\s]?site', html):
        return "Presencial"

    elif re.search(r'(?i)home[-\s]?office', html) or re.search(r'(?i)remot[eoEO]', html):
        return "Remoto"

    elif re.search(r'(?i)h[iíÍ]brido', html) or re.search(r'(?i)mixed', html):
        return "Híbrido"

    else:
        return None


def search_salary(html):
    # regex para capturar o salário com diferentes moedas e pontuação
    salary = re.search(r'(?i)(R\$|€|£|USD|US\$)\s?(\d{1,4}(\.\d{3})?)(,\d{2})?(\.\d{2})?([kK])?', html)
    if salary:
        print(f"log salario {salary.group()}")
        return salary.group()

    else:
        return "A combinar"
