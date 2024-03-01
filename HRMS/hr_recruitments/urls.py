from django.urls import path
from hr_recruitments import views

urlpatterns = [
	path('show_resume/', views.all_recruitments),
    path('new_resume/', views.add_recruitment),
    path('update/<int:resume_id>/', views.update_recruitment),
    path('delete/<int:resume_id>/', views.delete_recruitment),
    path('detail/<int:resume_id>/', views.recruitment),
    path('search_by/',views.search_by),
    path('order_by/',views.order_by)
]