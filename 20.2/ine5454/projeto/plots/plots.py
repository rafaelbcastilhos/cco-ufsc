import json
import numpy as np
import matplotlib.pyplot as plt
import statistics
from jobs.jobs.regex import get_digits

with open('/home/rafael/Documentos/cco-ufsc/20.2/ine5454/projeto/jobs/jobs.json', encoding='utf8') as out:
    jobs = json.load(out)


def bar_hiring_type():
    hiring_type = {
        'PJ': 0,
        'CLT': 0
    }

    for job in jobs:
        type = job["hiring_type"]
        if type == "PJ" or type == "CLT":
            hiring_type[type] += 1

    y_pos = np.arange(len(hiring_type))
    plt.xticks(y_pos, hiring_type.keys())
    plt.bar(y_pos, hiring_type.values())

    plt.show()


def bar_salary_hierarchy():
    relation = {
        'Sênior': [],
        'Pleno': [],
        'Junior': [],
        'Estagiário': []
    }

    mean = []

    for job in jobs:
        salary = job["salary"]
        hierarchy = job["hierarchy"]
        if salary is not None and hierarchy is not None:
            digits = get_digits(salary)
            if digits != 0:
                if "£" in salary:
                    convert = (digits * 7000) / 12
                    relation[hierarchy].append(convert)
                elif "€" in salary:
                    convert = (digits * 6000) / 12
                    relation[hierarchy].append(convert)
                elif "US" in salary or "U$" in salary:
                    convert = (digits * 5000) / 12
                    relation[hierarchy].append(convert)
                elif "R$":
                    relation[hierarchy].append(digits)

    for k in relation.keys():
        print(relation.get(k))
        if len(relation.get(k)) == 0:
            relation.get(k).append(0)
        mean.append(statistics.mean(relation.get(k)))

    y_pos = np.arange(len(relation))
    plt.xticks(y_pos, relation.keys())
    plt.bar(y_pos, mean)
    plt.show()


bar_hiring_type()
bar_salary_hierarchy()
