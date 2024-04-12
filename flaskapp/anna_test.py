from flask import Flask, render_template, request

from models import donor

app = Flask(__name__)

@app.route('/donorprofile')
def donor_profile():
    donors = donor.get_by_id(55214)
    return render_template("donor_profile.html", donors=donors)