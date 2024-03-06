defmodule Board.Repo.Migrations.CreateRoleBaseAccessControl do
  use Ecto.Migration

  def change do
    create table(:member) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end

    create table(:role) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end

    create table(:permission) do
      add :name, :string
      add :entity, :string
      add :action, :string
      add :access, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:permission, [:entity, :action, :access])

    create table(:role_member) do
      add :role_id, references(:role, on_delete: :delete_all)
      add :member_id, references(:member, on_delete: :delete_all)
    end

    create unique_index(:role_member, [:role_id, :member_id])

    create table(:role_permission) do
      add :role_id, references(:role, on_delete: :delete_all)
      add :permission_id, references(:permission, on_delete: :delete_all)
    end

    create unique_index(:role_permission, [:role_id, :permission_id])
  end
end
