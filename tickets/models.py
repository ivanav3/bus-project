from django.contrib.auth.models import User
from django.core.validators import MinValueValidator
from django.db import models

from timetables.models import Timetable

# Create your models here.

class Ticket(models.Model):
    user = models.ForeignKey(User,related_name="usert",on_delete=models.CASCADE)
    timetable = models.ForeignKey(Timetable,related_name="timetable",on_delete=models.CASCADE)
    passenger_count = models.IntegerField(validators=[MinValueValidator(1)])
