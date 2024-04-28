from flask import Flask, render_template, request, redirect, url_for
from werkzeug.utils import secure_filename
from models import foodbank, donor, documentation, donation, fb_donation_request
from peewee import fn
app = Flask(__name__)


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


@app.route('/request_to_donate', methods = ["GET", "POST"])
def donation_form():
    if request.method == "POST":
        print("Handling POST")
        fbusnm = request.form.get("fbusername")
        dousnm = request.form.get("dousername")
        Name_of_org = request.form.get("name_of_org") 
        Item = request.form.get("item")
        Quantity = request.form.get("quantity")
        Date_Requested = request.form.get("date")
        Fb = getPK(foodbank, 'FB_ID', fbusnm)
        Do = getPK(donor, 'DO_ID', dousnm)
# Insert the form data into the Donation table
        print("INserting request")
        fb_donation_request.create(
            fbusername= fbusnm,
            dousername= dousnm,
            name_of_org= Name_of_org,
            item= Item,
            quantity= Quantity,
            date_requested= Date_Requested,
            FB_ID = Fb,
            DO_ID = Do
        )
    print("Done with POST")

    return render_template('fb_form.html')

def getPK(tb, col_name, usnm) :
    query = (tb.select().where(tb.username == usnm));
    for q in query:
        q = q.col_name;
    return q





















































































#Add Bio to profile page
@app.route('/add_bio')
def add():
    if request.method==['POST']:
        bio=request.form.get('bio')
    
    return render_template('add_bio.html')


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
    return render_template("donor_profile.html", do=donors)
#form for foodbank requesting donation from a donor's profile
@app.route('/request_a_donation', methods=['POST'])
def request_a_donation():
    return render_template('fb_form.html')

#foodbank public profile
@app.route('/foodbank_profile/<fbID>')
def fb_profile(fbID):
    foodbanks = foodbank.get_by_id(fbID)
    return render_template("foodbank_profile.html", fb=foodbanks)
#Form for donor to request to donate from a foodbank's profile
# @app.route('/request_to_donate', methods=['POST'])
# def make_a_donation():
#     return render_template('do_form.html')

#DOCUMENTS
#Need to add queries
#Connect it to search bar and/or the documents button from the homepage (maybe/maybe not?)
#Basic view: all the documents that have been added by the user (implmented)
#Filter options (maybe): date uploaded, type of doc, expiration date (may not be implemented)
#Need to add an 'uploaded date column' (may not be possible to implement anymore)

#donor documents
@app.route('/do_documents/<doID>')
def DO_doc(doID):
    donors=donor.get_by_id(doID)
    query = (documentation
        .select()
        .join(donor, on=documentation.DO_ID==donor.DO_ID)
        .where(documentation.DO_ID==donors))
    return render_template('do_documents.html', document=query)

#foodbank documents
@app.route('/fb_documents/<fbID>')
def FB_doc(fbID):
    fb=foodbank.get_by_id(fbID)
    query = (documentation
        .select()
        .join(foodbank, on=documentation.FB_ID==foodbank.FB_ID)
        .where(documentation.FB_ID==fb))
    return render_template('fb_documents.html', document=query)

#upload files on the documents
ALLOWED_EXTENSIONS={'txt', 'pdf','png','jpg','jpeg','gif'}
app.config['UPLOAD_FOLDER']="static/Document_Uploads/"

@app.route('/document_uploaded',methods=['POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['fileUpload']
        filename = secure_filename(f.filename)
        f.save(app.config['UPLOAD_FOLDER'] + filename) 
        return "File successfully uploaded!"

# This route handles the form submission and displays the food bank profile dynamically
@app.route('/profilefb/<fbID>')
def fb_information(fbID):
    foodbanks = foodbank.get_by_id(fbID)
    return render_template("profilefb.html", fb=foodbanks)

@app.route('/profiledonor/<doID>')
def profile_donor(doID):
    donors=donor.get_by_id(doID)
    return render_template("profiledonor.html", donors=donors)

@app.route('/donation_history')
def donations_received():
    return render_template('donation_history.html')