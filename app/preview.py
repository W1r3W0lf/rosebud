from glob import glob
import json

# This object is used to create previews of the articles on the index page
class ArticalPreview:
    def __init__(self, path):

        self.name = path.split("/")[-1]
        self.index = path.split("/")[-1]
        self.path = path
        self.thumbnail = glob(path + "/thumb*")
        self.number = 0
        self.blerb = ""

        self.findMetaData()

    # Places the information in the meta file into the object of the article
    def findMetaData(self):
        try:
            with open("static/articles/" + self.name + "/meta.json") as meta:
                metaData = json.loads(meta.read())

            self.number = int(metaData["number"])
            self.blerb = metaData["blerb"]
            self.name = metaData["name"]
        except IOError:
            self.blerb = "ERROR META FILE MISSING"

