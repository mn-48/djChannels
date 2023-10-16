from django import forms
from django.forms import ModelForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Consumer,Country




class AddConsumerForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        super(AddConsumerForm, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'

            self.fields['address1'].widget.attrs.update({'class': 'form-control tcap'})
            self.fields['address2'].widget.attrs.update({'class': 'form-control tcap'})


    class Meta:
        model = Consumer
        fields = "__all__"
        exclude = (
            'user','occupation', 'date_of_birth', 'nid_number', 'father_name','mother_name', 'spouse_name','bio', 'password',
            'left_refer','right_refer', 'is_master', 'is_late','created_at','updated_at','blood_group','father_occupation',
            'mother_occupation','hobby','height','weight','marital_status','languages','about_tour','about_family_members',
            'designation_and_service_organization','primary_name_and_session','highschool_name_and_session',
            'college_name_and_session','university_name_and_session','psd_name_and_session','others_name_and_session',
            'father_name_change', 'mother_name_change','username','rank','add_seller',
        )
        widgets = {

            'first_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'First Name'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Last Name'}),
            'phone': forms.TextInput(attrs={'placeholder': 'Phone No'}),
            'refered_by': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Refered By'}),

            'occupation': forms.TextInput(attrs={'class': 'form-control'}),
            'nid_number': forms.TextInput(attrs={'class' : 'form-control'}),
            'father_name': forms.TextInput(attrs={'class' : 'form-control'}),
            'mother_name': forms.TextInput(attrs={'class' : 'form-control'}),
            'spouse_name': forms.TextInput(attrs={'class' : 'form-control'}),
            'address1': forms.TextInput(attrs={'class' : 'form-control', 'placeholder': 'Address 1'}),
            'address2': forms.TextInput(attrs={'class' : 'form-control', 'placeholder': 'Address 2'}),
        }



        # def __init__(self, *args, **kwargs):
        #     super(AddConsumerForm, self).__init__(*args, **kwargs)
        #     self.fields['long_desc'].widget.attrs['cols'] = 10
        #     self.fields['long_desc'].widget.attrs['rows'] = 60



#changepass
class ChangePasswordForm(forms.Form):
    old_pass = forms.CharField(label='Enter Your old password', max_length=50, widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder':"Your Old Password", 'required':'True'}))
    new_pass = forms.CharField(label='Enter New Password', max_length=50, widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder':"New password", 'required':'True'}))
    repert_new_pass = forms.CharField(label='Enter Again Your New Password', max_length=50, widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder':"Repeat New Password", 'required':'True'}))




class CountryForm(forms.ModelForm):
    class Meta:
        model = Country
        fields = [
            'name','topLevelDomain','alpha2Code','alpha3Code','callingCodes','capital','region','subregion',
            'latlng','demonym','area','timezones','currencies','languages','flag'
        ]
        widgets = {
            'name': forms.TextInput(attrs={'class' : 'form-control'}),
            'callingCodes': forms.TextInput(attrs={'class' : 'form-control'}),
        }
