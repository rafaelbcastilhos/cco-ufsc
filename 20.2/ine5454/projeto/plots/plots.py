import json
import numpy as np
import matplotlib.pyplot as plt

with open('/home/rafael/Documentos/cco-ufsc/20.2/ine5454/projeto/jobs/jobs.json', encoding='utf8') as out:
    jobs = json.load(out)


def bar_hiring_type():
    hiring_type = {
        'PJ': 0,
        'CLT': 0
    }

    for job in jobs:
        type = str(job["hiring_type"])
        if type == "PJ" or type == "CLT":
            hiring_type[type] += + 1

    y_pos = np.arange(len(hiring_type))
    plt.xticks(y_pos, hiring_type.keys())
    plt.bar(y_pos, hiring_type.values())

    plt.show()


bar_hiring_type()
