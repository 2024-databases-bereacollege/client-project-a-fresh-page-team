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






















































































#USER PUBLIC ROFILES
#Public view of donors and foodbanks (how another user will see their profile)
#All details added and are working
#Request a donation (fb requesting) connected to the 'fb_do_request_form'
#Request to Donate (donor requesting) connected to the 'do_do_req.frm.html'
#Image size are working; 200x200 for profile pic & 100x100 for posts for now
#Find a way to insert the bio from the user side (when creating account; may or may be implemented)

#donor public profile
@app.route('/donor_profile/<doID>')
def donor_profile(doID):
    donors=donor.get_by_id(doID)
    return render_template("donor_profile.html", donors=donors)
#form for foodbank requesting donation from a donor's profile
@app.route('/request_a_donation', methods=['POST'])
def request_a_donation():
    return render_template('fb_do_request_form')

#foodbank public profile
@app.route('/foodbank_profile/<FB_ID>')
def fb_profile(FB_ID):
    foodbank_info = foodbank.get_by_id(FB_ID)
    return render_template("foodbank_profile.html", fb=foodbank_info)
#Form for donor to requesting to donate from a foodbank's profile
@app.route('/request_to_donate', methods=['POST'])
def make_a_donation():
    return render_template('do_do_req_frm.html')

#DOCUMENTS
#Need to add queries
#Connect it to search bar and/or the documents button from the homepage (maybe/maybe not?)
#Basic view: all the documents that have been added by the user (implmented)
#Filter options (maybe): date uploaded, type of doc, expiration date (may not be implemented)
#Need to add an 'uploaded date column' (may not be possible to implement anymore)

#donor documents
@app.route('/documents/<do_ID>')
def doc(do_ID):
    donors=donor.get_by_id(do_ID)
    query = (documentation
        .select()
        .join(donor, on=documentation.DO_ID==donor.DO_ID)
        .where(documentation.DO_ID==donors))
    return render_template('documentation.html', document=query)

#uload files on the documents

#foodbank documents
    
