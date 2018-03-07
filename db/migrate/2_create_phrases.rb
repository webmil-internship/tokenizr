Sequel.migration do
  change do
    create_table(:phrases) do
      primary_key :id
      Integer :passkey_id
      String :phrase_key
      String :phrase_val
    end
  end
end
