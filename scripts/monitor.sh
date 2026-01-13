#!/bin/bash

# Simple monitoring script

check_health() {
    response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/health)
    
    if [ "$response" -eq 200 ]; then
        echo "$(date): Application is healthy (HTTP $response)"
    else
        echo "$(date): Application is unhealthy (HTTP $response)"
        # Add alert logic here (email, Slack, etc.)
    fi
}

check_resources() {
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
    memory=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2}')
    echo "$(date): CPU: $cpu% | Memory: $memory"
}

# Run checks
check_health
check_resources