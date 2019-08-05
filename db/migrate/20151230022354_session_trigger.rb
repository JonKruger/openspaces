class SessionTrigger < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
    CREATE OR REPLACE FUNCTION process_session_history() RETURNS TRIGGER AS $session_history$
    BEGIN
        --
        -- Create a row in session_history to reflect the operation performed on session,
        -- make use of the special variable TG_OP to work out the operation.
        --
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO session_history (operation, action_date, session_id, title, owner, twitter_handle, time_slot_id, meeting_space_id, created_at, updated_at) SELECT 'D', now(), OLD.*;
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO session_history (operation, action_date, session_id, title, owner, twitter_handle, time_slot_id, meeting_space_id, created_at, updated_at) SELECT 'U', now(), NEW.*;
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO session_history (operation, action_date, session_id, title, owner, twitter_handle, time_slot_id, meeting_space_id, created_at, updated_at) SELECT 'I', now(), NEW.*;
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
    $session_history$ LANGUAGE plpgsql;

    CREATE TRIGGER session_history
    AFTER INSERT OR UPDATE OR DELETE ON sessions
        FOR EACH ROW EXECUTE PROCEDURE process_session_history(); 
    SQL
  end
end
