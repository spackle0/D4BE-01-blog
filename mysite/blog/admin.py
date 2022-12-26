# pylint: disable=too-few-public-methods,redefined-builtin,invalid-str-returned
# pylint: disable=missing-module-docstring,missing-class-docstring,no-member
from django.contrib import admin
from .models import Post, Comment


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ["title", "slug", "author", "publish", "status"]
    list_filter = ["status", "created", "publish", "author"]
    search_fields = ["title", "body"]
    prepopulated_fields = {"slug": ("title",)}
    raw_id_fields = ["author"]
    date_hierarchy = "publish"
    ordering = ["status", "publish"]


@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ["name", "email", "post", "created", "active"]
    list_filter = ["active", "created", "updated"]
    search_fields = ["name", "email", "body"]
