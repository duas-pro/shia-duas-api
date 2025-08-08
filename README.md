# Shia Duas API (currently still developing)
A comprehensive collection of 80+ Shia Islamic supplications (duas) and pilgrimage prayers (ziyarat) available in 8 different languages. This API serves as the backend for the duas.pro ([website](https://duas.pro), [repo](https://github.com/duas-pro/duas-pro-frontend)), but is openly accessible for anyone to use in their own projects. It provides easy access to a diverse range of spiritual content for developers building Islamic apps or websites. With its multi-language support, this API enables users to access these important religious texts in their preferred language, making it a valuable resource for the Shia community and researchers worldwide.

## Features
- 80+ Shia Islamic supplications (duas) and pilgrimage prayers (ziyarat)
- Available in 8 different languages
- Audio versions of duas available
- Line-by-line translations with timestamps
- Serves as backend for duas.pro ([website](https://duas.pro), [repo](https://github.com/duas-pro/duas-pro-frontend))
- Open access for anyone to use in their projects

## Technology
This API is developed as a Supabase Function using JavaScript, providing a scalable and efficient backend solution.

## Test and view API
You can access the API and find its complete documentation [here](https://www.postman.com/duas-pro/workspace/shia-duas-api).

## Local Development
You can find a guide for local development [here](https://supabase.com/docs/guides/local-development/overview) and specific for Supabase Functions [here](https://supabase.com/docs/guides/functions/quickstart). If you successfully setted your local development environment up, you can access the local Supabase dashboard [here](http://localhost:54323/project/default). For your convenience:
1. Make sure Docker is running
2. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
3. Run `supabase functions serve --no-verify-jwt`.
4. Make a HTTP request 🎉
5. If you changed something in the Studio and want to create a SQL migration, use supabase `db diff --schema public`.

### Production Deployment
Edge Functions and database migrations are deployed automatically on push on the main branch.

## Upcoming Features and Roadmap
We are constantly working to improve and expand the Shia Duas API. Our plans for future development include:

1. Expanding our collection of duas and ziyarat
2. Adding support for more languages
3. Implementing a notification system for duas
4. Integrating AI to identify trending and popular duas
5. Providing analytics on dua reading patterns, including time, location, and frequency of recitation
6. Enabling export of duas in various formats (PDF, PowerPoint)
7. Continuous improvement of user experience based on community feedback

## Contribution
We welcome suggestions and contributions to help us achieve these goals and to identify new ways to enhance the API.

Contributors:

<a href="https://github.com/anquuni/duas-pro-frontend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=anquuni/duas-pro-frontend" />
</a>
