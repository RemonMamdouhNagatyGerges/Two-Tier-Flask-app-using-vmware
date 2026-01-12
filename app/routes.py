from flask import render_template, request, jsonify
from .models import db, User

def register_routes(app):
    @app.route('/')
    def home():
        return render_template('index.html')
    
    @app.route('/api/users', methods=['GET'])
    def get_users():
        users = User.query.all()
        return jsonify([{'id': u.id, 'username': u.username, 'email': u.email} for u in users])
    
    @app.route('/api/users', methods=['POST'])
    def add_user():
        data = request.json
        new_user = User(username=data['username'], email=data['email'])
        db.session.add(new_user)
        db.session.commit()
        return jsonify({'message': 'User created successfully'}), 201
    
    @app.route('/health')
    def health_check():
        return jsonify({'status': 'healthy'}), 200