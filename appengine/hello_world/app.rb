# Copyright 2015 Google, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START app]naive_bayes
require "sinatra"
require "csv"
require "pry"
require "stuff-classifier"
require "rubygems"
#require "naive_bayes"
require_relative 'NaiveBayes'

def initialize
 #@cls = StuffClassifier::Bayes.new("<=50K or >50K")
  @a = NaiveBayes.new("<=50K", ">50K")
  
  CSV.foreach('data.csv') do |row|
      #@cls.train("#{row[14]}", "#{row[0]} #{row[1]} #{row[3]} #{row[5]} #{row[6]} #{row[8]} #{row[9]} #{row[13]}")
      @a.train("#{row[14]}".strip, "#{row[0]}".downcase.strip ,"#{row[1]}".downcase.strip,"#{row[3]}".downcase.strip,"#{row[5]}".downcase.strip,"#{row[6]}".downcase.strip,"#{row[8]}".downcase.strip,"#{row[9]}".downcase.strip,"#{row[13]}".downcase.strip)
      #@a.train("#{row[14]}".strip, "#{row[3]}" ,"#{row[13]}")
   end
   #binding.pry
end
 

get "/" do
  #binding.pry
   #@data = params[:data]
	 #binding.pry
	 erb :index
end

post "/" do
  #binding.pry
  @b= params[:data].downcase.split(' ')
  erb :index
end
# [END app]
