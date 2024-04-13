from flask import Flask, render_template, request

from models import foodbank, donor, donation


app = Flask(__name__)

@app.route('/donor')
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


@app.route('/')
def homepage():
    return render_template('homepage.html')

@app.route('/search')
def search():
    if request.method == 'POST':
        # Get the search query from the form
        query = request.form['query']

        # Perform the search using Peewee
        search_results = foodbank.select().where(foodbank.item_name.contains(query))

        # Render the search results template with the search results
        return render_template('search_results.html', results = search_results)

@app.route('/do_form')
def donation_form():
    return render_template('donation_form.html')
