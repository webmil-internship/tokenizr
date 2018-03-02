Sequel.migration do
  change do
    create_table(:passkeys) do
      primary_key :id
      String :provider
      String :target
      String :key_phrase
      DateTime :when
    end
  end
end
