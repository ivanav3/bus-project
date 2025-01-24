from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from .models import Timetable


# /timetable
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


