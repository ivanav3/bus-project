from django.contrib import admin
from .models import Timetable, City


# Register your models here.

class CityAdmin(admin.ModelAdmin):
    list_display = ('name','postal_code')

class TimetableAdmin(admin.ModelAdmin):

    list_display = ('id','get_departure_city_name', 'get_arrival_city_name', 'date', 'time')

    def get_departure_city_name(self, obj):
        return obj.departure_city.name

    def get_arrival_city_name(self, obj):
        return obj.arrival_city.name

    get_departure_city_name.short_description = 'DEPARTURE CITY'
    get_arrival_city_name.short_description = 'ARRIVAL CITY'


admin.site.register(City,CityAdmin)
admin.site.register(Timetable,TimetableAdmin)