## API Endpoints

### Fetch Duas

#### Request

`GET /duas`

##### Query Parameters

- `languages` (optional): Comma-separated list of language codes to filter translations. If not provided, all translations will be returned.

##### Example

```http
GET /duas?languages=en,ar
```
##### Response
```
[
  {
    "route_name": "aahad",
    "titles": {
      "ar": "دعاء عَهْد",
      "en": "Supplication of Allegiance",
      "tl": "Dua Aahad"
    },
    "tags": ["tag1", "tag2"],
    "lines": {
      "1": {
        "ar": "ِسْمِ ٱللَّهِ ٱلرَّحْمٰنِ ٱلرَّحِيمِ",
        "en": "bismi allahi alrrahmani alrrahimi"
      }
    }
  }
]
```

### Fetch Single Dua

#### Request

`GET /duas/{:route_name}`

##### Path variables
- `route_name` (required): The route name of the Dua.

##### Query Parameters
- `languages` (optional): Comma-separated list of language codes to filter translations. If not provided, all translations will be returned.

##### Example

```http
GET /dua?aahad&languages=en,ar
```
##### Response
```
{
  "route_name": "aahad",
  "titles": {
    "ar": "دعاء عَهْد",
    "en": "Supplication of Allegiance"
  },
  "lines": {
    "1": {
      "ar": "ِسْمِ ٱللَّهِ ٱلرَّحْمٰنِ ٱلرَّحِيمِ",
      "en": "bismi allahi alrrahmani alrrahimi"
    }
  }
}
```

## Usage Example
### Fetching Duas
```
curl 'https://ccduydboxnoxujwedixz.supabase.co/functions/v1/duas' \
-H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjZHV5ZGJveG5veHVqd2VkaXh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYyNjk4NjksImV4cCI6MjAzMTg0NTg2OX0.OOcgblDPw3HR9_PTZNL2X0lTeRCY9wZPx-c7YxkCz0w'
```

### Fetching a Single Dua
```
curl 'https://ccduydboxnoxujwedixz.supabase.co/functions/v1/duas/aahad' \
-H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjZHV5ZGJveG5veHVqd2VkaXh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYyNjk4NjksImV4cCI6MjAzMTg0NTg2OX0.OOcgblDPw3HR9_PTZNL2X0lTeRCY9wZPx-c7YxkCz0w'
```

## Contribution
Feel free to contribute to this project by submitting issues or pull requests. For any questions, please contact the project maintainer.
