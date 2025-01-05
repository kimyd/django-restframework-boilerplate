# Overview
This is a boilerplate project for building RESTful APIs using Django REST Framework.

## Tech Stack
- Python 3.8+
- Django 4.2.17
- Django REST Framework 3.15.2
- PostgreSQL
- Swagger/OpenAPI Documentation (drf-yasg)

## Dependencies
- Django 4.2.17
- Django REST Framework 3.15.2
- django-cors-headers 4.6.0
- django-environ 0.11.2
- djangorestframework-api-key 3.0.0
- djangorestframework-simplejwt 5.3.1
- drf-yasg 1.21.8
- gunicorn 23.0.0
- psycopg2-binary 2.9.10
- whitenoise 6.8.2

# Getting Started

### Prerequisites
- Python 3.8 or higher
- pip
- virtualenv (optional)

### Installation
1. Clone the repository
```bash
git clone https://github.com/your-username/django-restframework-boilerplate.git
cd django-restframework-boilerplate
```

2. Install dependencies
```bash
pip install -r requirements.txt
```

3. Set up environment variables
```bash
cp .env.example .env
```

4. Run the development server
```bash
docker-compose up
```

5. Access the API documentation
```bash
http://localhost:8000/swagger/
```

# Customizing Project Name and App Names

### Changing Project Name
1. Rename the root directory `django_restframework_boilerplate` to your desired project name
2. Update the following files with your new project name:
   - `manage.py`: Update DJANGO_SETTINGS_MODULE
   - `django_restframework_boilerplate/asgi.py`: Update DJANGO_SETTINGS_MODULE
   - `django_restframework_boilerplate/wsgi.py`: Update DJANGO_SETTINGS_MODULE
   - `docker-compose.yml`: Update service names and environment variables
   - `Dockerfile`: Update relevant paths if necessary

3. Rename the main project directory:
```bash
mv django_restframework_boilerplate/ your_project_name/
```

4. Search and replace all occurrences of "django_restframework_boilerplate" in the project:
```bash
find . -type f -exec sed -i 's/django_restframework_boilerplate/your_project_name/g' {} +
```

### Changing App Names
1. Rename the app directory:
```bash
mv api/ your_app_name/
```

2. Update the app configuration:
   - Edit `your_app_name/apps.py` and update the name attribute
   - Update INSTALLED_APPS in `settings.py`
   - Update any import statements referencing the old app name
   - Update any URL configurations in `urls.py`

3. If you have any existing migrations, you'll need to:
   - Delete the migrations folder in the renamed app
   - Create new migrations after renaming
```bash
python manage.py makemigrations
```

### After Renaming
1. Clean and rebuild Docker containers:
```bash
docker-compose down -v
docker-compose build
docker-compose up
```

2. Create new migrations and migrate the database:
```bash
python manage.py makemigrations
python manage.py migrate
```

> **Note**: Make sure to update any references to the old names in your custom code, documentation, and configuration files.

