from glob import glob
import json

class ArticalPreview:
    def __init__(self, path):

        self.name = path.split("/")[-1]
        self.index = path.split("/")[-1]
        self.path = path
        self.thumbmail = glob(path + "/thumb*")
        self.number = 0
        self.blerb = ""

        self.findMetaData()

    def findMetaData(self):
        try:
            with open("static/articles/" + self.name + "/meta.json") as meta:
                metaData = json.loads(meta.read())

            self.number = int(metaData["number"])
            self.blerb = metaData["blerb"]
            self.name = metaData["name"]
        except IOError:
            self.blerb = "ERROR META FILE MISSING"

