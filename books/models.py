from django.db import models

class Book(models.Model):
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255)
    category = models.CharField(max_length=100)
    cover = models.ImageField(upload_to='covers/', blank=True)
    file = models.FileField(upload_to='books/')

    def __str__(self):
        return self.title
