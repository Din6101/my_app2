defmodule MyApp.Repo.Migrations.FixDepartmentIdColumn do
  use Ecto.Migration

  def change do
    # Check if department_id column exists, if not add it
    execute """
    DO $$
    BEGIN
      IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'users' AND column_name = 'department_id'
      ) THEN
        ALTER TABLE users ADD COLUMN department_id integer;
      END IF;
    END $$;
    """
  end
end
