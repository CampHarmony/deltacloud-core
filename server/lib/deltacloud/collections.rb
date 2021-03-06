#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.

require_relative './collections/base'
require_relative './helpers/collection_helper'

module Deltacloud

  module Collections
    extend Deltacloud::CollectionHelper

    load_collections_for :deltacloud, :from => File.join(File.dirname(__FILE__), 'collections')

    def self.included(klass)
      klass.class_eval do
        Deltacloud::Collections.modules(:deltacloud).each do |collection_class|
          use collection_class
        end
      end
    end

  end
end
