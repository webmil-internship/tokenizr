require 'dotenv/load'
require 'octokit'
require 'awesome_print'
require 'net/http'
require 'uri'
require_relative 'classes/provider'

Provider.new('secretAccesskey').results