from flask import Flask, render_template, Markup
from preview import ArticalPreview
from glob import glob

app = Flask(__name__)

@app.route('/')
def index():
    articals = sorted([ArticalPreview(path) for path in glob("static/articals/*")], key=lambda x: x.number, reverse=True)
    return render_template("index.html", articals=articals)

@app.route('/<name>')
def artical(name):
    
    # remove .'s to prevent an attacker from using relitive paths.
    name = name.replace(".","")

    try:
        with open("static/articals"+name+"text.html") as text:
            rawtext = text.read()
    except IOError:
        return name + " No such artical"

    content = Markup(rawtext)
    return render_template("artical.html", name=name, content=content)

if __name__ == "__main__":
    app.run()
