from flask import Flask, render_template, Markup
from preview import ArticalPreview
from glob import glob

app = Flask(__name__)

@app.route('/')
def index():
    articles = sorted([ArticalPreview(path) for path in glob("static/articles/*")], key=lambda x: x.number, reverse=True)
    return render_template("index.html", articles=articles)

@app.route('/<name>')
def article(name):

    # Check user input to see if there is a matching article
    article_paths = glob("static/articles/*/")
    article_names = [path.split("/")[-1] for path in artical_paths]

    if name in article_names:
        try:
            with open("static/articles"+name+"text.html") as text:
                rawtext = text.read()
        except IOError:
            return "Error while opening article " + name
    else:
        return name + " no such article"

    content = Markup(rawtext)
    return render_template("article.html", name=name, content=content)

if __name__ == "__main__":
    app.run()
