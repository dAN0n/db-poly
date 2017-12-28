from django.core.management.base import BaseCommand
from mus.models import *
import datetime

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'

    def _createCds(self):
        temp1 = Cds(cd_id = 1, code = "JNCD-0001", release_year = 2014)
        temp1.save()
        temp2 = Cds(cd_id = 2, code = "JNCD-0002", release_year = 2015)
        temp2.save()
        temp3 = Cds(cd_id = 3, code = "JNCD-0003", release_year = 2015)
        temp3.save()

    def _createLabels(self):
        temp1 = Labels(label_id = 1, label = "J-NERATION")
        temp1.save()
        temp2 = Labels(label_id = 2, label = "Unknown Label")
        temp2.save()
        temp3 = Labels(label_id = 3, label = "LapFox Trax")
        temp3.save()

    def _createTypes(self):
        temp1 = Types(type_id = 1, type = "Single")
        temp1.save()
        temp2 = Types(type_id = 2, type = "EP")
        temp2.save()
        temp3 = Types(type_id = 3, type = "Compilation")
        temp3.save()

    def _createGenres(self):
        temp1 = Genres(genre_id = 1, genre = "J-Core")
        temp1.save()
        temp2 = Genres(genre_id = 2, genre = "Happy Hardcore")
        temp2.save()
        temp3 = Genres(genre_id = 3, genre = "Dark Abient")
        temp3.save()

    def _createArtists(self):
        temp1 = Artists(art_id = 1, artist = "Nizikawa")
        temp1.save()
        temp2 = Artists(art_id = 2, artist = "Chill")
        temp2.save()
        temp3 = Artists(art_id = 3, artist = "ETIA")
        temp3.save()

    def _createTracks(self):
        temp1 = Tracks(track_id = 1, art_id = 1, title = "Jailbreak", duration = datetime.timedelta(minutes = 4, seconds = 48))
        temp1.save()
        temp2 = Tracks(track_id = 2, art_id = 2, title = "Do It Right", duration = datetime.timedelta(minutes = 5, seconds = 33))
        temp2.save()
        temp3 = Tracks(track_id = 3, art_id = 3, title = "Killer Bee", duration = datetime.timedelta(minutes = 4, seconds = 20))
        temp3.save()

    def _createPlaylists(self):
        temp1 = Playlists(pl_id = 1, name = "J-NERATION BEST")
        temp1.save()
        temp2 = Playlists(pl_id = 2, name = "Best Hits")
        temp2.save()
        temp3 = Playlists(pl_id = 3, name = "My playlist")
        temp3.save()

    def _createPlContent(self):
        temp1 = PlContent(pl_cnt_id = 1, pl_id = 1, track_id = 2)
        temp1.save()
        temp2 = PlContent(pl_cnt_id = 2, pl_id = 1, track_id = 1)
        temp2.save()
        temp3 = PlContent(pl_cnt_id = 3, pl_id = 1, track_id = 3)
        temp3.save()

    def _createAlbums(self):
        temp1 = Albums(alb_id = 1, album = "J-NERATION", label_id = 1, type_id = 3, year = 2014, rating = 4, num_of_ratings = 1)
        temp1.save()
        temp2 = Albums(alb_id = 2, album = "J-NERATION 2", label_id = 1, type_id = 3, year = 2015, rating = 5, num_of_ratings = 1)
        temp2.save()
        temp3 = Albums(alb_id = 3, album = "J-NERATION 3", label_id = 1, type_id = 3, year = 2015, rating = 5, num_of_ratings = 1)
        temp3.save()

    def _createAlbGenres(self):
        temp1 = AlbGenres(alb_gen_id = 1, alb_id = 1, genre_id = 1)
        temp1.save()
        temp2 = AlbGenres(alb_gen_id = 2, alb_id = 2, genre_id = 1)
        temp2.save()
        temp3 = AlbGenres(alb_gen_id = 3, alb_id = 2, genre_id = 1)
        temp3.save()

    def _createAlbInCd(self):
        temp1 = AlbInCd(alb_cd_id = 1, cd_id = 1, alb_id = 1)
        temp1.save()
        temp2 = AlbInCd(alb_cd_id = 2, cd_id = 2, alb_id = 2)
        temp2.save()
        temp3 = AlbInCd(alb_cd_id = 3, cd_id = 3, alb_id = 3)
        temp3.save()

    def _createAlbArt(self):
        temp1 = AlbArt(alb_art_id = 1, alb_id = 1, art_id = 2)
        temp1.save()
        temp2 = AlbArt(alb_art_id = 2, alb_id = 2, art_id = 2)
        temp2.save()
        temp3 = AlbArt(alb_art_id = 3, alb_id = 3, art_id = 2)
        temp3.save()

    def _createTracklists(self):
        temp1 = Tracklists(trklst_id = 1, alb_id = 1, track_id = 1)
        temp1.save()
        temp2 = Tracklists(trklst_id = 2, alb_id = 1, track_id = 2)
        temp2.save()
        temp3 = Tracklists(trklst_id = 3, alb_id = 1, track_id = 3)
        temp3.save()

    def _createAwards(self):
        temp1 = Awards(award_id = 1, aw_name = "Grammy")
        temp1.save()
        temp2 = Awards(award_id = 2, aw_name = "MTV Awards")
        temp2.save()
        temp3 = Awards(award_id = 3, aw_name = "MTV Russia Awards")
        temp3.save()

    def _createTrackAwards(self):
        temp1 = TrackAwards(trkaw_id = 1, track_id = 1, award_id = 1)
        temp1.save()
        temp2 = TrackAwards(trkaw_id = 2, track_id = 2, award_id = 2)
        temp2.save()
        temp3 = TrackAwards(trkaw_id = 3, track_id = 3, award_id = 3)
        temp3.save()

    def _createAlbAwards(self):
        temp1 = AlbAwards(albaw_id = 1, alb_id = 1, award_id = 2)
        temp1.save()
        temp2 = AlbAwards(albaw_id = 2, alb_id = 2, award_id = 2)
        temp2.save()
        temp3 = AlbAwards(albaw_id = 3, alb_id = 3, award_id = 2)
        temp3.save()

    def _createCityList(self):
        temp1 = CityList(city_id = 1, city_name = "Moscow")
        temp1.save()
        temp2 = CityList(city_id = 2, city_name = "Bryansk")
        temp2.save()
        temp3 = CityList(city_id = 3, city_name = "Omsk")
        temp3.save()

    def _createCountryList(self):
        temp1 = CountryList(country_id = 1, country_name = "Russia")
        temp1.save()
        temp2 = CountryList(country_id = 2, country_name = "USA")
        temp2.save()
        temp3 = CountryList(country_id = 3, country_name = "Ukraine")
        temp3.save()

    def _createCitiesInCountry(self):
        temp1 = CitiesInCountry(cic_id = 1, city_id = 1, country_id = 1)
        temp1.save()
        temp2 = CitiesInCountry(cic_id = 2, city_id = 2, country_id = 1)
        temp2.save()
        temp3 = CitiesInCountry(cic_id = 3, city_id = 3, country_id = 1)
        temp3.save()

    def _createSelling(self):
        temp1 = Selling(sel_id = 1, cd_id = 1, city_id = 1, sold = 15000, sold_date = datetime.date(day = 1, month = 1, year = 2014))
        temp1.save()
        temp2 = Selling(sel_id = 2, cd_id = 2, city_id = 1, sold = 5000, sold_date = datetime.date(day = 10, month = 3, year = 2015))
        temp2.save()
        temp3 = Selling(sel_id = 3, cd_id = 3, city_id = 1, sold = 1000, sold_date = datetime.date(day = 8, month = 7, year = 2015))
        temp3.save()

    def handle(self, *args, **options):
        self._createCds()
        self._createLabels()
        self._createTypes()
        self._createGenres()
        self._createArtists()
        self._createTracks()
        self._createPlaylists()
        self._createPlContent()
        self._createAlbums()
        self._createAlbGenres()
        self._createAlbInCd()
        self._createAlbArt()
        self._createTracklists()
        self._createAwards()
        self._createTrackAwards()
        self._createAlbAwards()
        self._createCityList()
        self._createCountryList()
        self._createCitiesInCountry()
        self._createSelling()