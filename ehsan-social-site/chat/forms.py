from django import forms
from .models import GroupName
class GroupNameForm(forms.ModelForm):
    class Meta:
        model=GroupName
        exclude=['group_name','admins']
        widgets = {
                'participants': forms.CheckboxSelectMultiple(attrs={'multiple': True}),
            }
class ParticipantsAddForm(forms.ModelForm):
    # participants = forms.ModelChoiceField(queryset=User.objects.filter(), empty_label=None)
    class Meta:
        model=GroupName
        fields=['participants',]
        widgets = {
                'participants': forms.CheckboxSelectMultiple(attrs={'multiple': True}),
            }