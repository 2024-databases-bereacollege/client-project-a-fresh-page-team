from flask import Flask, render_template, request, redirect, url_for
from werkzeug.utils import secure_filename
from models import foodbank, donor, documentation, donation, fb_donation_request, do_donation_request
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


@app.route('/request_a_donation', methods = ["GET", "POST"])
def getdonation_form():
    if request.method == "POST":
        print("Handling POST")
        fbusnm = request.form.get("fbusername")
        dousnm = request.form.get("dousername")
        Name_of_org = request.form.get("name_of_org") 
        Item = request.form.get("item")
        Quantity = request.form.get("quantity")
        Date_Requested = request.form.get("date")
        Fb = getPK(foodbank, fbusnm)
        Do = getPK(donor, dousnm)

        if Fb and Do != 'None':
            try:
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
                return "Donation request created successfully"
            except Exception as e:
                # Handle database insertion error
                return f"Error creating donation request: {e}"    
    return render_template('fb_form.html')

@app.route('/request_to_donate', methods = ["GET", "POST"])
def todonate_form():
    if(request.method == "POST"):
        print("Handling POST")
        fbusnm = request.form.get("fusnm")
        dousnm = request.form.get("dusnm")
        Name_of_org = request.form.get("name_of_org")
        Item = request.form.get("item")
        Quantity = request.form.get("quantity")
        Date_Requested = request.form.get("date")
        Fb = getPK(foodbank, fbusnm)
        Do = getPK(donor, dousnm)
        if Fb and Do != 'None':
            # Create donation request only if Fb and Do exist
            try:
                # Create donation request
                do_donation_request.create(
                    fusnm=fbusnm,
                    dusnm=dousnm,
                    name_of_org=Name_of_org,
                    item=Item,
                    quantity=Quantity,
                    date_requested=Date_Requested,
                    FB_ID=Fb,
                    DO_ID=Do
                )
                return "Donation request created successfully"
            except Exception as e:
                # Handle database insertion error
                return f"Error creating donation request: {e}"
    return render_template("do_form.html")


def getPK(tb, usnm):
    try:
        query = (tb.get(tb.username == usnm))
        if query:
            return getattr(query, tb._meta.primary_key.name)
        else:
            print("No record found with the specified username.")
            return 'None'
    except tb.DoesNotExist:
        print("Table does not contain the specified record.")
        return 'None'
    except Exception as e:
        print("An error occurred:", e)
        return 'None'


















































































@app.route('/login')
def login():
    return render_template('login.html')

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
# Form for donor to request to donate from a foodbank's profile
@app.route('/request_to_donate', methods=['POST'])
def make_a_donation():
    return render_template('do_form.html')

@app.route('/donation_history/<fbID>')
def foodbank_donations(fbID):
    foodbank_info = foodbank.get_by_id(fbID)
    query = (donation
             .select()
             .join(foodbank, on=donation.FB_ID == foodbank.FB_ID)
             .where(donation.FB_ID == fbID))
    donations_info = query.execute()
    return render_template('donation_history.html', foodbank=foodbank_info, donations=donations_info)

#DOCUMENTS
#Need to add queries
#Connect it to search bar and/or the documents button from the homepage (maybe/maybe not?)
#Basic view: all the documents that have been added by the user (implmented)
#Filter options (maybe): date uploaded, type of doc, expiration date (may not be implemented)
#Need to add an 'uploaded date column' (may not be possible to implement anymore)

#donor documents
@app.route('/do_documents/<doID>')
def DO_doc(doID):
    do=donor.get_by_id(doID)
    query = (documentation
        .select()
        .join(donor, on=documentation.DO_ID==donor.DO_ID)
        .where(documentation.DO_ID==do))
    return render_template('do_documents.html', document=query)

@app.route('/document_edit/<id>', methods=['GET','POST'])
def document_edit(id):
    doc=documentation.get_by_id(id)
    return render_template('document_edit.html', document=doc)

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


#ADMIN VIEWS

#homepage of admin
#menu looks different from users
@app.route('/admin')
def admin_homepage():
    return render_template('admin_homepage.html')

#ability to see all foodbanks in the system
@app.route('/all_fb')
def fb():
    foodbanks=foodbank
    return render_template('all_fb.html', fb=foodbanks)

#ability to see all the donors in the system
@app.route('/all_do')
def do():
    donors=donor
    return render_template('all_do.html', do=donors)

#ability to see all docs in the system
@app.route('/all_doc')
def doc():
    fb = (documentation
        .select()
        .join(foodbank, on=documentation.FB_ID==foodbank.FB_ID))
    do = (documentation
        .select()
        .join(donor, on=documentation.DO_ID==donor.DO_ID))
    return render_template('all_doc.html', fb=fb, do=do)

@app.route('/all_dn')
def donations():
    fb=(fb_donation_request
        .select()
        .join(foodbank, on=fb_donation_request.FB_ID==foodbank.FB_ID))
    do=(do_donation_request
        .select()
        .join(donor, on=do_donation_request.DO_ID==donor.DO_ID))
    dn=(donation
         .select()
        .join(foodbank, on=donation.FB_ID==foodbank.FB_ID)
        .join(donor, on=donation.DO_ID==donor.DO_ID))
    return render_template('all_dn.html', fb=fb, do=do, dn=dn)



































@app.route('/donor_donation/<doID>')
def donor_donations(doID):
    donor_info = donor.get_by_id(doID)
    query = (donation
             .select()
             .join(donor, on=donation.DO_ID == donor.DO_ID)
             .where(donation.DO_ID == doID))
    donations_info1 = query.execute()
    return render_template('donor_donation.html', donor=donor_info, donations=donations_info1)