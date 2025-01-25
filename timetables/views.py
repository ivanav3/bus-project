from django.http import HttpResponse, JsonResponse
import json
from django.views.decorators.csrf import csrf_exempt
from .models import Timetable, City
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.middleware.csrf import get_token

# /timetables
def index(request):
    timetables = Timetable.objects.select_related('departure_city', 'arrival_city').all()
    timetables_data = []

    for timetable in timetables:
        timetables_data.append({
            'id': timetable.id,
            'departure_city': {
                'id': timetable.departure_city.id,
                'name': timetable.departure_city.name,
                'postal_code': timetable.departure_city.postal_code
            },
            'arrival_city': {
                'id': timetable.arrival_city.id,
                'name': timetable.arrival_city.name,
                'postal_code': timetable.arrival_city.postal_code,
            },
            'date':timetable.date,
            'time':timetable.time

        })

    return JsonResponse(timetables_data, safe=False)
# /timetable/new
def new(request):
    return HttpResponse('New Timetable')

def cities(request):
    cities = City.objects.all()

    cities_list = list(cities.values('id', 'name','postal_code'))
    return JsonResponse(cities_list, safe=False)

def users(request):
    users = User.objects.all()
    users_list = list(users.values('username','email'))
    return JsonResponse(users_list,safe=False)

# @csrf_protect
@csrf_exempt
def new_user(request):
    if request.method != 'POST':
        return JsonResponse({"error": "Invalid request method. Use POST."}, status=405)
    try:
        data = json.loads(request.body)

        username = data.get('username')
        password = data.get('password')
        first_name = data.get('first_name')
        last_name = data.get('password')
        email = data.get('email')

        if not username or not password or not email:
            return JsonResponse({"error": "All fields are required"}, status=400)

        if User.objects.filter(username=username).exists():
            return JsonResponse({"error": "User already exists."}, status=400)

        user = User.objects.create_user(username=username, password=password,
                                        first_name = first_name,
                                        last_name = last_name,
                                        email=email)
        user.save()

        return JsonResponse({
            "id": user.id,
            "username": user.username,
            "email": user.email
        }, status=200)

    except Exception as e:
        return JsonResponse({"error": f"Error occurred: {e}"}, status=400)




@csrf_exempt
def login_user(request):
    data = json.loads(request.body)

    username = data.get('username')
    password = data.get('password')

    if not username or not password:
        return JsonResponse({'error': 'Username and password are required.'}, status=400)

    user = authenticate(request, username=username, password=password)

    if user is not None:
        login(request, user)
        csrf_token = get_token(request)
        return JsonResponse({
            'id':user.id,
            'username': user.username,
            'first_name': user.first_name,
            'last_name':user.last_name,
            'csrf_token': csrf_token
        })
    else:
        return JsonResponse({
            'error': 'Invalid username or password.'}, status=400)

@csrf_exempt
def delete_user(request):
    data = json.loads(request.body)

    id = data.get('id')
    username = data.get('username')

    user = User.objects.get(id=id,username=username)
    user.delete()
    if user is not None:
        return JsonResponse({
            "message" : "User is successfully deleted.",
        }, status = 200)
    else:
        return JsonResponse({
            'error': 'Invalid username or password.'}, status=400)