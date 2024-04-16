from flask import Flask, render_template, request, redirect, url_for
from werkzeug.utils import secure_filename

from models import foodbank, donor, documentation, donation
from peewee import fn
app = Flask(__name__)

@app.route('/donor')
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
    gg = request.form.get('DO_ID')
    return gg


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
       search_results = foodbank.select().where(fn.lower(foodbank.city).contains(query.lower()))

    else:
        search_results = []

    # Render the search results template with the search results
    return render_template('search.html', search_results=search_results)


@app.route('/do_form')
def donation_form():
    return render_template('donation_form.html')


if __name__ == '__main__':
    app.run(debug=True)





























@app.route('/donorprofile')
def donor_profile():
    donors=donor.get_by_id(55214)
    return render_template("donor_profile.html", donors=donors)

@app.route('/request_a_donation', methods=['POST'])
def request_a_donation():
    return render_template('donation_form.html')

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

ALLOWED_EXTENSIONS={'txt', 'pdf','png','jpg','jpeg','gif'}
app.config['UPLOAD_FOLDER']="static/"

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.',1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/document_updated',methods=['POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['fileUpload']
        filename = secure_filename(f.filename)
        f.save(app.config['UPLOAD_FOLDER'] + filename) 
        return "File successfully uploaded"
