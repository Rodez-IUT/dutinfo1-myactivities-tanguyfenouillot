CREATE OR REPLACE FUNCTION add_activity(title varchar(200)) RETURNS bigint AS $$
  INSERT INTO activity (id, title) 
  VALUES (nextval('id_generator'), add_activity.title)
  RETURNING id;
 $$ LANGUAGE SQL;