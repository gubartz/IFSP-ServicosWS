Projeto de Conclusão de Curso do aluno Guilherme Lima Pereira do curso ADS - IFSP Campus Hortolândia.
Webservices.

#Instrução para carregar o slim
```php
php -r "readfile('https://getcomposer.org/installer');" | php
php composer.phar update
```

#Configuração do Banco de Dados
Criar o diretório config e um arquivo chamado config.php com o conteúdo:
```php
<?php
  define("DB_HOST", "");
  define("DB_USER", "");
  define("DB_PASSWORD", "");
  define("DB_DATABASE", "");
```