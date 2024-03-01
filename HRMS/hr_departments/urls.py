from django.urls import path
from hr_departments import views

urlpatterns = [
	path('show_department/', views.all_departments),
    path('new_department/', views.add_department),
    path('update/<int:department_id>/', views.update_department),
    path('delete/<int:department_id>/', views.delete_department),
    path('detail/<int:department_id>/', views.department),
    path('search_by/',views.search_by),
    path('order_by/',views.order_by)
]