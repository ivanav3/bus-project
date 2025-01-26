from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
import json
from tickets.models import Ticket
from django.views.decorators.csrf import csrf_exempt

# Create your views here.


def index(request):
    tickets = Ticket.objects.all()
    return render(request,'index.html',{'tickets': tickets})


@csrf_exempt
def new(request):
    if request.method != 'POST':
        return JsonResponse({"error": "Invalid request method. Use POST."}, status=405)
    try:
        data = json.loads(request.body)

        passenger_count = data.get('passenger_count')
        timetable_id = data.get('timetable_id')
        user_id = data.get('user_id')

        ticket = Ticket(passenger_count=passenger_count, timetable_id=timetable_id, user_id=user_id)
        ticket.save()

        return JsonResponse({
            "message":"Ticket successfully created"
        }, status=200)

    except Exception as e:
        return JsonResponse({"error": f"Error occurred: {e}"}, status=400)


def get_tickets_by_user(request):
    try:

        user_id = request.GET.get('user_id')


        if not user_id:
            return JsonResponse({"error": "user_id is required"}, status=400)

        user_id = int(user_id)
        tickets = Ticket.objects.filter(user_id=user_id)

        if not tickets.exists():
            return JsonResponse([], safe=False,status=200)


        return JsonResponse(
            list(tickets.values('id','passenger_count', 'timetable_id', 'user_id')),
            status=200,
            safe=False
        )

    except Exception as e:
        return JsonResponse({"error": f"Error occurred: {e}"}, status=400)

