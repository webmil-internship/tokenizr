Sequel.migration do
  change do
    create_table(:phrases) do
      primary_key :id
      Integer :passkey_id
      String :val_phrase
    end
  end
end
