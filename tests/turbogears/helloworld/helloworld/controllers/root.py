# -*- coding: utf-8 -*-
"""Main Controller"""

from tg import expose, flash, require, url, request, redirect
from pylons.i18n import ugettext as _, lazy_ugettext as l_

from helloworld.lib.base import BaseController
from helloworld.model import DBSession, metadata
from helloworld.controllers.error import ErrorController

__all__ = ['RootController']


class RootController(BaseController):
   
    error = ErrorController()

    @expose('helloworld.templates.index')
    def index(self):
        return dict()

