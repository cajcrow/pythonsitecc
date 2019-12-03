from django.http import HttpResponse
from django.shortcuts import render


#first view function (main page of products app) - http request passed to client server
#whenever there is a request to /products, call index
def index(request):
    return HttpResponse('Hello World')


def new(request):
    return HttpResponse('New Products')


