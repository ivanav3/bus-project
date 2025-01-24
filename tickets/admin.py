from django.contrib import admin

from tickets.models import Ticket


# Register your models here.

class TicketAdmin(admin.ModelAdmin):
    list_display = ('id','get_user_username', 'get_departure_city_name', 'get_arrival_city_name', 'passenger_count')

    def get_user_username(self, obj):
        return obj.user.username

    def get_departure_city_name(self, obj):
        return obj.timetable.departure_city.name

    def get_arrival_city_name(self, obj):
        return obj.timetable.arrival_city.name

    get_user_username.short_description = 'USER'
    get_departure_city_name.short_description = 'DEPARTURE CITY'
    get_arrival_city_name.short_description = 'ARRIVAL CITY'

admin.site.register(Ticket,TicketAdmin)