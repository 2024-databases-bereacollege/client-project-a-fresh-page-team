from flask import Flask, render_template, request, redirect, url_for
from werkzeug.utils import secure_filename

from models import foodbank, donor, documentation, donation
from peewee import fn
app = Flask(__name__)

@app.route('/donors')
def donorList():
    donors = donor.select()
    return render_template("donor.html", 
                            page_title="Donor List",
                            page_description="Choose from one of the available Donor", 
                            donors=donors)



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

















































































#This what a donor profile will look like when viewed by another user
#All details added and are working
#Need to connect to the the fb donation request form (foodbank fills out to request donations from donors)
#Images are wokring on and off; size are too big; might need to add size restrictions
#Find a way to insert the 
@app.route('/donor_profile/<doID>')
def donor_profile(doID):
    donors=donor.get_by_id(doID)
    return render_template("donor_profile.html", donors=donors)
#This is not the correct form; using this form as test
@app.route('/request_a_donation', methods=['POST'])
def request_a_donation():
    return render_template('donation_form.html')

#This what a foodbank profile will look like when viewed by another user
#All details added and are working
#Need to connect to the the  DO donation request form (donor fills out to request to donate to foodbanks)
#Images are wokring on and off; size are too big; might need to add size restrictions
@app.route('/foodbank_profile/<FB_ID>')
def fb_profile(FB_ID):
    foodbank_info = foodbank.get_by_id(FB_ID)
    return render_template("foodbank_profile.html", fb=foodbank_info)
#Might not be the correct form, using this as a test template to see if users will be sent to another page if they click on "request to donate"    
@app.route('/make_a_donation', methods=['POST'])
def make_a_donation():
    return render_template('donation_form.html')


#Need to add queries
#Connect it to search bar and/or the documents button from the homepage
#Basic view: all the documents that have been added by the user
#Filter options (maybe): date uploaded, type of doc, expiration date
#Need to add an 'uploaded date column'
@app.route('/documents/<do_ID>')
def doc(do_ID):
    donors=donor.get_by_id(do_ID)
    query = (documentation
        .select()
        .join(donor, on=documentation.DO_ID==donor.DO_ID)
        .where(documentation.DO_ID==donors))
    return render_template('documentation.html', document=query)

#uload files on the documents

#doc for fb
    
