from django.http import HttpResponse
from django.shortcuts import render

from tickets.models import Ticket


# Create your views here.


def index(request):
    tickets = Ticket.objects.all()
    return render(request,'index.html',{'tickets': tickets})

def new(request):
    return HttpResponse('New Tickets')

