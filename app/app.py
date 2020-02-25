from flask import Flask, render_template, Markup
from preview import ArticalPreview
from glob import glob

app = Flask(__name__)

@app.route('/')
def index():
    # Gets a sorted list of all of the articles based on there given number.
    articles = [ArticalPreview(path) for path in glob("static/articles/*")]
    get_number = lambda article: article.number
    articles = sorted(articles, key=get_number, reverse=True)
    return render_template("index.html", articles=articles)

@app.route('/<name>')
def article(name):

    # Check user input to see if there is a matching article
    article_paths = glob("static/articles/*")
    article_names = [path.split("/")[-1] for path in article_paths]

    if name in article_names:
        try:
            # Exstract the text from the article's text.html file 
            with open("static/articles/"+name+"/text.html") as text:
                rawtext = text.read()
        except IOError:
            return "Error while opening article :" + name
    else:
        return "No such article as :" + name

    # place the raw text into the article template
    content = Markup(rawtext)
    return render_template("article.html", name=name, content=content)

if __name__ == "__main__":
    app.run()
