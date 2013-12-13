# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
ActiveRecord::Base.connection.execute("TRUNCATE TABLE user_roles");
roles = UserRole.create([
    {:user_role_type => 'Super Admin', :permission_set => { :reports => {:view => 1, :create => 1, :update => 1, :delete => 1}, 
        :transaction => {:view => 1, :create => 1, :update => 1, :delete => 1},
        :aprove_user => 1,
      }
    },
    {:user_role_type => 'Account Holder', :permission_set => { :reports => {:view => 1, :create => 1, :update => 1, :delete => 0}, 
        :transaction => {:view => 1, :create => 1, :update => 1, :delete => 0},
        :aprove_user => 1,
      }},
    {:user_role_type => 'Permanent Account Holder', :permission_set => { :reports => {:view => 1, :create => 0, :update => 0, :delete => 0}, 
        :transaction => {:view => 1, :create => 0, :update => 0, :delete => 0},
        :aprove_user => 0,
      }},
    {:user_role_type => 'General User', :permission_set => { :reports => {:view => 1, :create => 0, :update => 0, :delete => 0}, 
        :transaction => {:view => 1, :create => 0, :update => 0, :delete => 0},
        :aprove_user => 0,
      }}																				

  ]
);

