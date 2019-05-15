CREATE OR REPLACE FUNCTION add_activity(in_title varchar(200), in_description text, in_owner_id bigint)
  RETURNS record AS $$
  
DECLARE 

BEGIN
	
	
	-- check existence
	IF in_owner_id == null THEN
		INSERT INTO activity(id, title, description, creation_date, modification_date, owner_id)
		VALUES(nextval('id_generator'), in_title, in_description, "default owner")
		RETURN NULL;
	ELSE
		INSERT INTO activity(id, title, description, creation_date, modification_date, owner_id)
		VALUES(nextval('id_generator'), in_title, in_description, in_owner_id)
		RETURN NULL;
		
	END IF
	
END 
$$ language plpgsql;

CREATE OR REPLACE FUNCTION find_all_activities(activities_cursor)
  RETURNS refcursor AS $$
  
$$ language plpgsql;