-- rechercher le user avec username = "Default_owner"
-- Si il existe alors retourne le user
-- Sinon 
--   On créé le user avec username = "Default_owner"
--   On retourne le user créé
CREATE OR REPLACE FUNCTION get_default_owner() RETURNS "user" AS $$

DECLARE

  defaultOwner "user"%rowtype;
  defautlOwnerUsername varchar(50) := 'Default Owner';
  
BEGIN

  SELECT *
  FROM "user"
  WHERE username = defaultOwnerUsername;

  if not found then
    INSERT INTO "user" (id, username)
    VALUES (nextval('id_generator'), defaultOwnerUsername);
    SELECT * INTO defaultOwner
    FROM "user"
    WHERE username = defaultOwnerUsername;
  end if;
  RETURN defaultOwner;
END
  
$$ LANGUAGE plpgsql;
  
--  SELECT *
--  FROM "user"
--  WHERE username IS NULL*/

--CREATE OR REPLACE FUNCTION fix_activities_without_owner() RETURNS SETOF activity AS $$

--$$ LANGUAGE plpgSQL;
