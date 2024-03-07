defmodule Board.Repo.Migrations.CreateRoleBaseAccessControl do
  use Ecto.Migration

  def change do
    create table(:role) do
      add :name, :string
    end

    create table(:permission) do
      add :name, :string
      add :entity, :string
      add :action, :string
      add :access, :string
    end

    create unique_index(:permission, [:entity, :action, :access])

    create table(:role_permission, primary_key: false) do
      add :role_id, references(:role), primary_key: true
      add :permission_id, references(:permission), primary_key: true
    end
  end
end
