from flask import Flask, jsonify, request
from flask_restful import Resource, Api, reqparse
from flask_mysqldb import MySQL
from cryptography.fernet import Fernet

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'workindia'

mysql = MySQL(app)
api = Api(app)

parser = reqparse.RequestParser()
parser.add_argument('username', type=str)
parser.add_argument('password', type=str)
parser.add_argument('note', type=str)


def load_key():
    """
    Loads the key from the current directory named `key.key`
    """
    return open("key.key", "rb").read()


class RegisterPage(Resource):
    def post(self):
        args = parser.parse_args()
        un = str(args['username'])
        pw = str(args['password'])
        if un is None or un == None or un == 'None':
            return jsonify({"error": "send username"})
        if un is None or pw == None or pw == 'None':
            return jsonify({"error": "send password"})
        cursor = mysql.connection.cursor()
        result = cursor.execute('Select * from  users where username="' + un + '" and password="' + pw + '"')
        if result > 0:
            return jsonify({
                "error": "already exists",
            })
        query = 'Insert into users(username, password) values("' + un + '","'+pw+'")'
        print(query)
        cursor.execute(query)
        mysql.connection.commit()
        cursor.close()
        return jsonify({"status": "account created"})


class LoginPage(Resource):
    def post(self):
        args = parser.parse_args()
        un = str(args['username'])
        pw = str(args['password'])
        if un is None or un == None or un == 'None':
            return jsonify({"error": "send username"})
        if un is None or pw == None or pw == 'None':
            return jsonify({"error": "send password"})
        cursor = mysql.connection.cursor()
        result = cursor.execute('Select * from  users where username="'+un+'" and password="'+pw+'"')
        if result > 0:
            user = cursor.fetchone()
            return jsonify({
                "status": "success",
                "userId": user[0],
            })
        return jsonify({
            "status": "error"
        })


class ListNotesPage(Resource):
    def get(self):
        userId = request.args.get('userId')
        cursor = mysql.connection.cursor()
        res = cursor.execute("Select * from users where id="+userId)
        if res>0:
            result = cursor.execute(
                'Select * from  notes where userid=' + userId + '')
            if result > 0:
                notes = cursor.fetchall()
                response = []
                key = load_key()
                f = Fernet(key)
                for note in notes:
                    s = note[2].encode()
                    print(s)
                    decrypted = f.decrypt(s)
                    user = {
                        "id": note[0],
                        "userId": note[1],
                        "note": decrypted.decode()
                    }
                    response.append(user)
                return jsonify(response)
            return jsonify({
                "status": "error"
            })
        return jsonify({
                "error": "user does not exist"
            })


class AddNote(Resource):
    def post(self):
        userId = request.args.get('userId')
        args = parser.parse_args()
        note = str(args['note'])
        if note is None or note == None or note == 'None':
            return jsonify({"error": "empty note"})
        key = load_key()
        note = note.encode()
        f = Fernet(key)
        encrypted = f.encrypt(note)
        cursor = mysql.connection.cursor()
        res = cursor.execute("Select * from users where id=" + userId)
        if res > 0:
            query = 'Insert into notes(userid, note) values(' + userId + ',"' + encrypted.decode() + '")'
            print(query)
            cursor.execute(query)
            mysql.connection.commit()
            cursor.close()
            return jsonify({"status": "success"})
        return jsonify({
            "error": "user does not exist"
        })



api.add_resource(RegisterPage, "/app/user")
api.add_resource(LoginPage, "/app/user/auth")
api.add_resource(ListNotesPage, "/app/sites/list")
api.add_resource(AddNote, "/app/sites")

if __name__ == '__main__':
    app.run(debug=True)

