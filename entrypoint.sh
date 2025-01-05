#!/bin/bash

./wait-for-it.sh postgres:5432

echo "Applying database migrations..."
python manage.py migrate

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Creating superuser if it doesn't exist..."
python manage.py shell <<EOF
from django.contrib.auth import get_user_model

User = get_user_model()
if not User.objects.filter(email='admin@example.com').exists():
    User.objects.create_superuser(username='admin', email='admin@example.com', password='1234', is_active=True)
EOF

echo "Starting Gunicorn server..."
gunicorn django_restframework_boilerplate.wsgi:application --bind 0.0.0.0:8000

