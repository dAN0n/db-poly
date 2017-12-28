from django.db import models

# default tables
class Albums(models.Model):
	alb_id = models.IntegerField(primary_key = True)
	album = models.CharField(max_length = 100)
	label = models.ForeignKey('Labels', null = True)
	type = models.ForeignKey('Types', null = True)
	year = models.IntegerField(null = True)
	rating = models.DecimalField(max_digits = 3, decimal_places = 2, null = True)
	num_of_ratings = models.IntegerField(null = True)

	class Meta:
		db_table = "albums"

class Artists(models.Model):
	art_id = models.IntegerField(primary_key = True)
	artist = models.CharField(max_length = 100)

	class Meta:
		db_table = "artists"

class Cds(models.Model):
	cd_id = models.IntegerField(primary_key = True)
	code = models.CharField(max_length = 100)
	release_year = models.IntegerField(null = True)

	class Meta:
		db_table = "cds"

class AlbArt(models.Model):
	alb_art_id = models.IntegerField(primary_key = True)
	alb = models.ForeignKey('Albums')
	art = models.ForeignKey('Artists')

	class Meta:
		db_table = "alb_art"

class AlbInCd(models.Model):
	alb_cd_id = models.IntegerField(primary_key = True)
	cd = models.ForeignKey('Cds')
	alb = models.ForeignKey('Albums')

	class Meta:
		db_table = "alb_in_cd"

class Labels(models.Model):
	label_id = models.IntegerField(primary_key = True)
	label = models.CharField(max_length = 100)

	class Meta:
		db_table = "labels"

class Types(models.Model):
	type_id = models.IntegerField(primary_key = True)
	type = models.CharField(max_length = 40)

	class Meta:
		db_table = "types"

class Genres(models.Model):
	genre_id = models.IntegerField(primary_key = True)
	genre = models.CharField(max_length = 40)

	class Meta:
		db_table = "genres"

class Tracks(models.Model):
	track_id = models.IntegerField(primary_key = True)
	art = models.ForeignKey('Artists')
	title = models.CharField(max_length = 100)
	duration = models.DurationField()

	class Meta:
		db_table = "tracks"

class Tracklists(models.Model):
	trklst_id = models.IntegerField(primary_key = True)
	alb = models.ForeignKey('Albums')
	track = models.ForeignKey('Tracks')

	class Meta:
		db_table = "tracklists"

class Playlists(models.Model):
	pl_id = models.IntegerField(primary_key = True)
	name = models.CharField(max_length = 200)

	class Meta:
		db_table = "playlists"

class PlContent(models.Model):
	pl_cnt_id = models.IntegerField(primary_key = True)
	pl = models.ForeignKey('Playlists')
	track = models.ForeignKey('Tracks')

	class Meta:
		db_table = "pl_content"

class AlbGenres(models.Model):
	alb_gen_id = models.IntegerField(primary_key = True)
	alb = models.ForeignKey('Albums')
	genre = models.ForeignKey('Genres')

	class Meta:
		db_table = "alb_genres"

# modification tables
class TrackAwards(models.Model):
	trkaw_id = models.IntegerField(primary_key = True)
	track = models.ForeignKey('Tracks')
	award = models.ForeignKey('Awards')

	class Meta:
		db_table = "track_awards"

class Awards(models.Model):
	award_id = models.IntegerField(primary_key = True)
	aw_name = models.CharField(max_length = 20)

	class Meta:
		db_table = "awards"

class AlbAwards(models.Model):
	albaw_id = models.IntegerField(primary_key = True)
	alb = models.ForeignKey('Albums')
	award = models.ForeignKey('Awards')

	class Meta:
		db_table = "alb_awards"

class CityList(models.Model):
	city_id = models.IntegerField(primary_key = True)
	city_name = models.CharField(max_length = 10)

	class Meta:
		db_table = "city_list"

class CountryList(models.Model):
	country_id = models.IntegerField(primary_key = True)
	country_name = models.CharField(max_length = 10)

	class Meta:
		db_table = "country_list"

class CitiesInCountry(models.Model):
	cic_id = models.IntegerField(primary_key = True)
	city = models.ForeignKey('CityList')
	country = models.ForeignKey('CountryList')

	class Meta:
		db_table = "cities_in_country"

class Selling(models.Model):
	sel_id = models.IntegerField(primary_key = True)
	cd = models.ForeignKey('Cds')
	city = models.ForeignKey('CityList')
	sold = models.IntegerField()
	sold_date = models.DateField(auto_now = False, auto_now_add = False)

	class Meta:
		db_table = "selling"