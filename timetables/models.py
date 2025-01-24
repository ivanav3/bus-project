from django.contrib.auth.models import User
from django.db import models


# Create your models here.

class City(models.Model):
    name = models.CharField(max_length=100)
    postal_code = models.PositiveIntegerField()


class Timetable(models.Model):
    id = models. AutoField(primary_key=True)
    departure_city = models.ForeignKey(City,related_name='departure_city',on_delete=models.CASCADE)
    arrival_city = models.ForeignKey(City,related_name='arrival_city',on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()

    def __str__(self):
        return (f"Number: {self.id} | From: {self.departure_city.name} | To: {self.arrival_city.name} |"
                f" Date: {self.date} | Time: {self.time}")

