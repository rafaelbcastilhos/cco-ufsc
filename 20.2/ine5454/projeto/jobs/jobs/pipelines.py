# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
import json
from itemadapter import ItemAdapter


def clean_item(item):
    spec_chars = ["¦", "ð", "Ÿ", "¥", "³", "\n", "\b", "<br>", "\r", "  ", "•", "\t"]
    for char in spec_chars:
        if item['title'] is not None:
            item['title'] = item['title'].replace(char, ' ').strip()
            if len(item['title']) >= 128:
                item['title'] = item['title'][:125] + "..."

        if item['company_name'] is not None:
            item['company_name'] = item['company_name'].replace(char, '')

        if item['description'] is not None:
            item['description'] = item['description'].replace(char, ' ').strip()
            if len(item['description']) >= 255:
                item['description'] = item['description'][:252] + "..."

        if item['hierarchy'] is not None:
            item['hierarchy'] = item['hierarchy'].replace(char, '')

        if item['hiring_type'] is not None:
            item['hiring_type'] = item['hiring_type'].replace(char, '')

        if item['mode'] is not None:
            item['mode'] = item['mode'].replace(char, '')

        if item['salary'] is not None:
            item['salary'] = item['salary'].replace(char, '')
        else:
            item['salary'] = "A combinar"

    return item


class JobsPipeline:
    def open_spider(self, spider):
        # abre arquivo, se nao existir é criado, se existir é adicionado ao final
        self.file = open("jobs.json", 'a+', encoding='utf8')

    def close_spider(self, spider):
        self.file.close()

    def process_item(self, item, spider):
        # limpa o item, converte em dicionário e escreve no arquivo
        job_object = clean_item(item)
        line = json.dumps(
            ItemAdapter(job_object).asdict(), ensure_ascii=False) + ",\n"
        self.file.write(line)
