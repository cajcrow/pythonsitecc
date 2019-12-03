from django.contrib import admin
from .models import Product, Offer


class OfferAdmin(admin.ModelAdmin):
    list_display = ('code', 'discount')


class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'stock')


#Registering the models to register in admin section
admin.site.register(Offer, OfferAdmin)
admin.site.register(Product, ProductAdmin)