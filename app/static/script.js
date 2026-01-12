// Load users on page load
document.addEventListener('DOMContentLoaded', function() {
    loadUsers();
});

function loadUsers() {
    fetch('/api/users')
        .then(response => response.json())
        .then(users => {
            const usersList = document.getElementById('users-list');
            usersList.innerHTML = users.map(user => 
                `<div class="user-item">
                    <strong>${user.username}</strong> - ${user.email}
                </div>`
            ).join('');
        });
}

document.getElementById('user-form').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const userData = {
        username: document.getElementById('username').value,
        email: document.getElementById('email').value
    };
    
    fetch('/api/users', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(userData)
    })
    .then(response => {
        if (response.ok) {
            loadUsers();
            document.getElementById('user-form').reset();
        }
    });
});

function checkHealth() {
    fetch('/health')
        .then(response => response.json())
        .then(data => {
            document.getElementById('health-status').innerHTML = 
                `<p style="color: green;">Status: ${data.status}</p>`;
        })
        .catch(error => {
            document.getElementById('health-status').innerHTML = 
                `<p style="color: red;">Status: Unhealthy</p>`;
        });
}