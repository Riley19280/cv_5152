from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.template import Context, loader
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings


def index(request):
    return HttpResponse("Hello, world. You're at the projects index.")


@csrf_exempt
def filtering(request):
    return render(request, 'filtering.html')


@csrf_exempt
def filter(request):
    f = request.FILES['image']

    path = settings.MEDIA_ROOT + '/' + f.name
    with open(path, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)

    #TODO: Do image filtering heere

    return render(request, 'filtering.html', {'prefilter': '/media/' + f.name})