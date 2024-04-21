from flask import Flask, render_template, request, redirect, url_for
from werkzeug.utils import secure_filename
from models import foodbank, donor, documentation, donation, fb_donation_request
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


@app.route('/do_form', methods = ["GET", "POST"])
def donation_form():
    if request.method == "POST":
        fbusnm = request.form.get("username")
        Name_of_org = request.form.get("name_of_org") 
        Item = request.form.get("item")
        Quantity = request.form.get("quantity")
        Date_Requested = request.form.get("date")
        Fb = getPK(foodbank, 'FB_ID', fbusnm)
        Do = getPK(donor, 'DO_ID', fbusnm)
# Insert the form data into the Donation table
        fb_donation_request.create(
            username= fbusnm,
            name_of_org= Name_of_org,
            item= Item,
            quantity= Quantity,
            date_requested= Date_Requested,
            FB_ID = Fb,
            DO_ID = Do
        )
    return render_template('fb_form.html')

def getPK(tb, col_name, usnm) :
    query = (tb.select().where(tb.username == usnm));
    for q in query:
        q = q.col_name;
    return q


















































































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
@app.route('/do_documents/<do_ID>')
def DO_doc(do_ID):
    donors=donor.get_by_id(do_ID)
    query = (documentation
        .select()
        .join(donor, on=documentation.DO_ID==donor.DO_ID)
        .where(documentation.DO_ID==donors))
    return render_template('donor_documents.html', document=query)

#foodbank documents
@app.route('/fb_documents/<fb_ID>')
def FB_doc(fb_ID):
    fb=foodbank.get_by_id(fb_ID)
    query = (documentation
        .select()
        .join(foodbank, on=documentation.FB_ID==foodbank.FB_ID)
        .where(documentation.FB_ID==fb))
    return render_template('foodbank_documents.html', document=query)

#upload files on the documents
ALLOWED_EXTENSIONS={'txt', 'pdf','png','jpg','jpeg','gif'}
app.config['UPLOAD_FOLDER']="static/"

@app.route('/document_updated',methods=['POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['fileUpload']
        filename = secure_filename(f.filename)
        f.save(app.config['UPLOAD_FOLDER'] + filename) 
        return "File successfully uploaded!"
    
