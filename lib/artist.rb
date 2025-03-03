require_relative '../lib/concerns/memorable'
require 'pry'

class Artist
  extend Memorable
  include Paramble
  attr_accessor :name
  attr_reader :songs

  SONGS = []

  def initialize
    SONGS << self
    @songs = []
  end

  def self.find_by_name(name)
    SONGS.detect{|a| a.name == name}
  end

  def self.all
    SONGS
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
