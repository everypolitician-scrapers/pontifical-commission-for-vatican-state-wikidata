#!/bin/env ruby
# encoding: utf-8

require 'everypolitician'
require 'wikidata/fetcher'

epmembers = EveryPolitician::Index.new.country("Vatican-City").lower_house.popolo.persons.map(&:wikidata).compact
wikipedia = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/pontifical-commission-for-vatican-state-wikipedia', column: 'id')

EveryPolitician::Wikidata.scrape_wikidata(ids: epmembers | wikipedia)
