# Copyright (C) 2012-2013 Codethink Limited
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


import mustard


class Requirement(mustard.elementfactory.Element):

    def __init__(self, data):
        mustard.elementfactory.Element.__init__(self, data)

        self.mapped_to = {}
        self.subrequirements = {}
        self.verificationcriteria = {}

    def sort_subrequirements(self, **kwargs):
        return mustard.sorting.sort_elements(
            self.subrequirements.items(), kwargs)
