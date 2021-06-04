# Notes

## API

### Argumentaire

  - Pourquoi développer une API ?
    - permet de décoréller le serveur du client rendant possible la création d'applications tierces plus facilement (offre une meilleure scalabilité)
  - Pourquoi choisir de développer une API REST ?
    - [+] REST utilise le protocole HTTP, disponible pour la plupart des clients
    - [+] Les exemples observés (CMS e-commerce) ont fait ce choix
    - [+] REST est moins couplé client/serveur que SOAP
    - [+] REST est généralement perçu comme un choix pertinent pour développer une API, plébiscité par la communauté, ce qui facilite le support de l'API
    - [+] REST est un modèle mature ayant fait ses preuves
    - [.] mise en cache côté serveur (duh?)
    - [-] REST peut poser des problèmes de under-fetching ou over-fetching
      - le résultat d'une requête REST n'est pas forcément clairement prédictible
      - ces problèmes sont dues à la rigidité structurelle d'une API REST
      - ce problème impact négativement les performances de l'API car les requêtes ne sont pas toujours optimisées en fonction des besoins du client
    - [-] il n'y a pas de méthodologie standard pour structurer une API REST (exception faite des initiatives comme OPEN API)
  - Pourquoi choisir de développer une API GraphQL ?
    - [+] GraphQL est hautement prédictible (évite les problèmes d'under-fetching et over-fetching)
    - [+] GraphQL est fortement typé côté client (Schema Type System: https://graphql.org/learn/schema/)
    - [+] Idéal pour le développement parallèle server - client de l'API
    - [.] voir Cons GraphQl: https://blog.api.rakuten.net/graphql-vs-rest/#REST_and_GraphQL_comparison

  - CONCLUSION : Nous avons fait le choix de développer une API REST pour les raisons suivantes :
    - pour approfondir les notions vues en cours
    - pour profiter de la maturité du modèle et donc de la disponibilité des ressources en ligne
    - pour pouvoir aisément s'inspirer des autres acteurs du marché

### Implémenter une API

  - https://swagger.io/tools/swagger-ui/
  - https://oai.github.io/Documentation/start-here.html

### Sécuriser une API

  - https://blog.api.rakuten.net/api-security/
  - JWT (Json Web Tokens: https://jwt.io/)
    - https://www.toptal.com/nodejs/secure-rest-api-in-nodejs
  - OAuth:
    - https://developer.okta.com/blog/2018/08/21/build-secure-rest-api-with-node
    - https://blog.arcoptimizer.com/construire-une-api-rest-simple-avec-node-et-oauth-2-0
  - API Keys:
    - https://devdocs.magento.com/guides/v2.4/get-started/authentication/gs-authentication.html

### Documenter une API

  - https://blog.api.rakuten.net/best-practices-for-writing-api-documentation/
  - https://medium.com/swlh/restful-api-documentation-made-easy-with-swagger-and-openapi-6df7f26dcad

### Documentation GraphQL

  - https://graphql.org/learn/
  - https://fr.wikipedia.org/wiki/GraphQL

### Autres documents

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

------------------------------------------------------------------------------------------------

### Server

RESTful Design with NodeJs:

- https://www.toptal.com/nodejs/secure-rest-api-in-nodejs
- https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/development_environment
- https://malcoded.com/posts/angular-backend-express/
- https://blog.leonhassan.co.uk/setting-up-a-simple-rest-server-in-node-js/
- https://medium.com/swlh/how-to-create-a-simple-restful-api-in-node-js-ae4bfddea158
- https://hackernoon.com/restful-api-design-with-node-js-26ccf66eab09
- https://www.tutorialspoint.com/nodejs/nodejs_restful_api.htm

- Error handling in NodeJS: https://nodejs.dev/learn/error-handling-in-nodejs
- Log handling in NodeJS: https://nodejs.dev/learn/how-to-log-an-object-in-nodejs
- Manage the Environments in NodeJS: https://nodejs.dev/learn/nodejs-the-difference-between-development-and-production

------------------------------------------------------------------------------------------------

## Database

- Pourquoi Node est souvent associé au SGBD MongoDB et son ORM Mongoose ?
- MongoDB est un système NoSQL (non-relational database), nous devrions utiliser un SGBD relationnel pour gérer les données d'un site e-commerce
  - SQL works best for clearly defined, discrete items with exact specifications. Typical use cases are online stores and banking systems. (https://www.sitepoint.com/sql-vs-nosql-choose/)
- Comment gérer la base de donnée pour un site multilangue ?
  - Prestashop: "Tables which contain translations must end with the _lang suffix. For instance, ps_product_lang contains all the translations for the ps_product table."
    - src: https://devdocs.prestashop.com/1.7/development/database/

### documentation

- https://www.mongodb.com/nosql-explained/nosql-vs-sql
- https://www.mongodb.com/nosql-explained