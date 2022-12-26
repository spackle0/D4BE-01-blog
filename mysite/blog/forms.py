# pylint: disable=too-few-public-methods,redefined-builtin,invalid-str-returned
# pylint: disable=missing-module-docstring,missing-class-docstring,no-member
from django import forms

from .models import Comment


class EmailPostForm(forms.Form):
    name = forms.CharField(max_length=25)
    email = forms.EmailField()
    to = forms.EmailField()
    comments = forms.CharField(required=False, widget=forms.Textarea)


class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ["name", "email", "body"]
