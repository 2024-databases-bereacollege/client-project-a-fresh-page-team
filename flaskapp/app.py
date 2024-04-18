from flask import Flask, render_template, request, redirect, url_for
from werkzeug.utils import secure_filename

from models import foodbank, donor, documentation, donation
from peewee import fn
app = Flask(__name__)

@app.route('/donors')
@app.route('/')
def donorList():
    donors = donor.select()
    return render_template("donor.html", 
                            page_title="Donor List",
                            page_description="Choose from one of the available Donor", 
                            donors=donors)

@app.route('/see details', methods=['POST'])
def see_details():
    """
    """
    for fb in search_results:
        if fb['id'] == foodbank_id:
            return fb
    return None


@app.route('/')
def homepage():
    return render_template('homepage.html')


@app.route('/search', methods=['POST'])
def search():
    # Retrieve the search query from the request parameters
    query = request.form.get('search')
    # Perform the database query using Peewee
    if query:
        # Use case-insensitive search for example, adjust as needed
        
        # Split the query into keywords
        search_results = foodbank.select().where(
            fn.lower(foodbank.city).contains(query.lower()))

        # Assuming description field contains information about services like "foodbanks"

    else:
        search_results = []

    # Render the search results template with the search results
    return render_template('search.html', search_results=search_results)


@app.route('/do_form')
def donation_form():
    return render_template('do_do_req_frm.html')































@app.route('/donor_profile/<doID>')
def donor_profile(doID):
    donors=donor.get_by_id(doID)
    return render_template("donor_profile.html", donors=donors)
@app.route('/request_a_donation', methods=['POST'])
def request_a_donation():
    return render_template('donation_form.html')

@app.route('/foodbank_profile/<FB_ID>')
def fb_profile(FB_ID):
    foodbank_info = foodbank.get_by_id(FB_ID)
    return render_template("foodbank_profile.html", fb=foodbank_info)
    
@app.route('/make_a_donation', methods=['POST'])
def make_a_donation():
    return render_template('donation_form.html')

@app.route('/profilefoodbank')
def index():
    return render_template('foodbank.html')

@app.route('/documents')
def doc():
    for documents in documentation.select():
        return render_template('documentation.html', document=documents)
def doc():
    for documents in documentation.select():
        return render_template('documentation.html', document=documents)

@app.route('/foodbankprofile')
def fb_profile():
    foodbanks = foodbank.get_by_id(84134)
    return render_template("foodbank_profile.html", fb=foodbanks)

@app.route('/make_a_donation', methods=['POST'])
def make_a_donation():
    return render_template('donation_form.html')


@app.route('/documents')
def doc():
    for documents in documentation.select():
        return render_template('documentation.html', document=documents)

@app.route('/document_updated', methods=['POST'])
def doc_updated():
    return "Document successfully updated!"
    
    
@app.route('/test')
def test():
    return render_template('test.html')