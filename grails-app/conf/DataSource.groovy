dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "dave"
	password = "1234"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
		  dbCreate = "update"//one of 'create', 'create-drop','update'
		  url = "jdbc:mysql://localhost:3306/tekdays"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
//START:prod	
	production {
		dataSource {
			//START_HIGHLIGHT
			jndiName = "java:comp/env/jdbc/TekDaysDS"
			//END_HIGHLIGHT
		}
	}
//END:prod
}
