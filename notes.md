# Notes

### Server

- https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/development_environment
- https://nodejs.dev/learn/error-handling-in-nodejs
- https://blog.leonhassan.co.uk/setting-up-a-simple-rest-server-in-node-js/
- https://medium.com/swlh/how-to-create-a-simple-restful-api-in-node-js-ae4bfddea158
- https://hackernoon.com/restful-api-design-with-node-js-26ccf66eab09
- https://www.tutorialspoint.com/nodejs/nodejs_restful_api.htm


## API

- GraphQL:
  - https://graphql.org/learn/
  - https://fr.wikipedia.org/wiki/GraphQL
- pourquoi une API REST ?
  - le choix d'une API REST est complètement adapté à un tel projet web. C'est un choix technique fait par tous les CMS e-commerce étudiés.
  - une alternative aurait pu être le choix d'une API SOAP (Magento le propose par exemple) mais le couplage client/serveur est plus lourd avec ce type d'API.
    - ce n'est pas idéal, ça ressemble plus à du legacy de la part d'Adobe...
  - REST est orienté ressource, la logique de l'API est toute entière construite côté serveur et le client ignore totalement sont fonctionnement under the hood.
  - Prestashop: "The PrestaShop web service uses the REST architecture in order to be available on as many platforms as possible, since the HTTP protocol and XML files are understood by most platforms, if not all."
    - src: https://devdocs.prestashop.com/1.7/webservice/getting-started/

- comment authentifier l'accès à l'API ?
  - Tokens
  - API Keys (login creds ?)
  - OAuth
  - rsc: https://devdocs.magento.com/guides/v2.4/get-started/authentication/gs-authentication.html

- Woocommerce
  - doc: https://developer.woocommerce.com/
  - REST API : https://woocommerce.github.io/woocommerce-rest-api-docs/#introduction

- Shopify
  - doc/REST API: https://shopify.dev/docs

- Magento:
  - doc: https://devdocs.magento.com/
  - REST API: https://devdocs.magento.com/guides/v2.4/get-started/rest_front.html

- Prestashop:
  - doc: https://devdocs.prestashop.com/1.7/
  - REST API: https://devdocs.prestashop.com/1.7/webservice/getting-started/

## Database

- quelle SGBD utiliser ?
  - Node est souvent associé à MongoDb (ORM Mongoose), pourquoi ?
  - hackermoon: "We’ll be using MongoDB, a NOSQL database. It’s the optimal choice for our needs as we do not have the need for a relational database."
    - Nous avons besoin d'une DB relationnelle. Donc nous ne devrions pas utiliser MongoDB
    - src: https://hackernoon.com/restful-api-design-with-node-js-26ccf66eab09
- comment gérer le multilangue ?
  - Prestashop: "Tables which contain translations must end with the _lang suffix. For instance, ps_product_lang contains all the translations for the ps_product table."
    - src: https://devdocs.prestashop.com/1.7/development/database/

