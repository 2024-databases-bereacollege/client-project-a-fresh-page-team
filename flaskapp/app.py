from flask import Flask, render_template, request

from models import donor

from models import foodbank


app = Flask(__name__)

@app.route('/')
def donorList():
    donors = donor.select()
    return render_template("donor.html", 
                            page_title="Donor List",
                            page_description="Choose from one of the available Donor", 
                            donors=donors)
@app.route('/see details', methods=['POST'])
def register():
    """
    """
    gg = request.form.get('DO_ID')

    return 'Hi there'


@app.route('/homepage')
def homepage():
    return render_template('homepage.html')

@app.route('/search')

def search():
   foodbank = foobank.select()
    return render_template('search.html',banks=banks)


