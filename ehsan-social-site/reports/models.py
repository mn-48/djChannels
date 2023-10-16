from django.db import models

from django.contrib.auth.models import User

from user_management.models import Consumer
from employer.models import Employer, JobPost
from metrimony.models import Personal_Info


class Reports(models.Model):
    user = models.ForeignKey(User, on_delete = models.CASCADE, related_name = 'report_list')

    report_text = models.TextField()
    report_image = models.ImageField(blank = True, null =  True, upload_to = 'reports/images')

    type = models.CharField(max_length=100)


    matri_pro_to = models.ForeignKey(Personal_Info, on_delete = models.SET_NULL, related_name = 'matri_reports', blank = True, null = True)
    consumer_to = models.ForeignKey(Consumer, on_delete = models.SET_NULL, related_name = 'consumer_reports', blank = True, null = True)
    employer_to = models.ForeignKey(Employer, on_delete = models.SET_NULL, related_name = 'org_reports', blank = True, null = True)
    jobpost_to = models.ForeignKey(JobPost, on_delete = models.SET_NULL, related_name = 'jobpost_reports', blank = True, null = True)

    created_at = models.DateTimeField(auto_now_add = True)
    is_active=models.BooleanField(default=True)

    def __str__(self):
        return str(self.user)
    


