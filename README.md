Call to get a list of duas with its titles:
curl 'https://ccduydboxnoxujwedixz.supabase.co/functions/v1/duas' \
-H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjZHV5ZGJveG5veHVqd2VkaXh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYyNjk4NjksImV4cCI6MjAzMTg0NTg2OX0.OOcgblDPw3HR9_PTZNL2X0lTeRCY9wZPx-c7YxkCz0w'

Call to get a specific dua with its content, e.g. Dua Aahad:
curl 'https://ccduydboxnoxujwedixz.supabase.co/functions/v1/duas/aahad' \
-H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjZHV5ZGJveG5veHVqd2VkaXh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYyNjk4NjksImV4cCI6MjAzMTg0NTg2OX0.OOcgblDPw3HR9_PTZNL2X0lTeRCY9wZPx-c7YxkCz0w'