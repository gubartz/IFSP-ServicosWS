#Realizando as cargas de dados

INSERT INTO noticia VALUES( 1, 'EQUIPES DE HORTOLÂNDIA GANHAM O TORNEIO ROBOCODE IFSP 2015', 'De setembro a novembro ocorreu o Torneio Robocode IFSP 2015 que foi realizado pelo Campus Capivari. Houve 11 equipes participantes, dentre elas, duas equipes do Campus Hortolândia. As equipes foram formadas pelos alunos do ADS matutino e noturno. A equipe do ADS matutino era composta pelos alunos Felipe, Gabriel e Julio e liderados pelo estudante Lenilson. Os alunos João, Rodolfo e Thiago com a liderança do estudante Davi formavam a equipe do ADS noturno.    Com muito orgulho, nossas equipes ficaram em 1º (ADS noturno) e 2º lugar (ADS matutino) no campeonato interno. O primeiro colocado também teve a oportunidade de participar do Torneio Robocode 2015 realizado em Limeira. Nessa ocasião, os campeões do Torneio Robocode IFSP 2015 receberam um prêmio.');
INSERT INTO noticia VALUES( 2, 'I WORKSHOP DE PROJETOS DA MECÂNICA 2015', '  No dia 02 de dezembro ocorrerá o I Workshop de Projetos da Mecânica 2015. As atividades terão início às 14h e irá até as 22h. Para participar acesse a Programação, escolha qual atividade você irá participar e então se inscreva pelo Site.');
INSERT INTO noticia VALUES( 3, 'SEMANA DA CONSCIÊNCIA NEGRA: DIVERSIDADE, RAÇA E GÊNERO EM DEBATE DO IFSP', '   A Coordenadoria de Extensão, Coordenadoria Sociopedagógica e NAPNE orgulhosamente convidam para a Semana da Consciência Negra: Diversidade, raça e gênero em debate do IFSP Câmpus Hortolândia - de 13 a 23 de novembro. Para informações acesse a Programação. Participem!');
INSERT INTO noticia VALUES( 4, 'PUBLICADO ANAIS DA SNCT DO CÂMPUS HORTOLÂNDIA DE 2014', 'É com muita satisfação e alegria que a organização da III Semana Nacional de Ciência e Tecnologia do Câmpus Hortolândia divulga o lançamento dos Anais do evento. Os Anais trazem os resumos dos trabalhos acadêmicos, de extensão e de iniciação científica que foram apresentados no evento pelos alunos, os resultados dos concursos de poemas e de imagens digitais com as respectivas obras vencedoras e também os resumos das palestras e minicursos ministrados durante o evento, que ocorreu nos dias 13 e 14 de outubro de 2014. Outro objetivo da organização foi resgatar as informações sobre a II edição, que ocorreu em 2013, com o intuito de registrar a história do evento e do câmpus. Os Anais estão disponíveis gratuitamente no portal do câmpus. Os organizadores aproveitam a oportunidade para agradecer a todos os envolvidos na elaboração e parabeniza os autores dos resumos pelos trabalhos.');
INSERT INTO noticia VALUES( 5, 'RESULTADO: SELECIONADOS PARA FAZER O CURSO CONSTRUINDO SITES EM JOOMLA', '   A lista final dos candidatos que realizarão o curso Construindo sites com Joomla! está disponível nesta notícia. O curso será realizado nos dias 7, 14, 21 e 28 de Novembro de 2015, das 10h00 às 16h00 no Laboratório 3 do IFSP - Câmpus Hortolândia.
 
 
Anderson Cascalho de Souza
Antonio Marcio Paschoal
Clodoaldo Aparecido Peternella
Clodoaldo do Nascimento Junior
Daniel Eduardo Cazelli Mendes Soares
Douglas de Araújo
Elisangela Dubiel dos Santos
Elizabeth Silva
Elton Cesar Prando
Isaias de Jesus Souza Júnior
Jefferson Aparecido da Silva
João Pedro Santos Vidiri
Juliano Ricceli da Silva
Lucas Vinicius Pimenta
Luiz Torres Júnior
Menelik Samori Nazaré Soares
Reginaldo Donizete Ribeiro da Silva
Renata Gomes Da Silva
Ronaldo Rodrigues Martins
Welliton Gonçalves de Souza');

INSERT INTO curso VALUES( 1, 'Análise e Desenvolvimento de Sistemas', 'Informática', 6 );

INSERT INTO tipo_usuario VALUES( 1, 'Aluno'     );
INSERT INTO tipo_usuario VALUES( 2, 'Professor' );

INSERT INTO usuario VALUES( 1, #id_usuario
                            1, #id_tipo_usuario
                            'Guilherme Lima Pereira',
                            '45.245.984-9',
                            '421.819.808-02',
                            '13183-250',
                            '(19) 3897-1762',
                            '(19) 98173-7172',
                            'guuuilp@gmail.com',
                            '132017-3',
                            '123456',
                            null );

INSERT INTO usuario VALUES( 2, #id_usuario
                            2, #id_tipo_usuario
                            'Gustavo Bartz Guedes',
                            '4.032.894-40',
                            '845.184.304-25',
                            '13120-230',
                            '(19) 3875-1261',
                            '(19) 98433-7122',
                            'gubartz@ifsp.edu.br',
                            '162912-1',
                            '123456' ,
                            null );

INSERT INTO usuario VALUES( 3, #id_usuario
                            2, #id_tipo_usuario
                            'André Constantino da Silva',
                            '30.655.797-6',
                            '116.878.341-05',
                            '13120-231',
                            '(19) 3875-1263',
                            '(19) 98433-7124',
                            'andre.constantino@gmail.com',
                            '162912-2',
                            '123456' ,
                            null );

INSERT INTO usuario VALUES( 4, #id_usuario
                            2, #id_tipo_usuario
                            'Carlos Roberto dos Santos Jr',
                            '48.215.365-9',
                            '678.534.594-40',
                            '13120-232',
                            '(19) 3875-1265',
                            '(19) 98433-7126',
                            'carlos.rsantos@ifsp.edu.br',
                            '162912-3',
                            '123456' ,
                            null );

INSERT INTO usuario VALUES( 5, #id_usuario
                            2, #id_tipo_usuario
                            'Daiane Mastrangelo Tomazeti',
                            '46.048.190-3',
                            '415.578.013-55',
                            '13120-233',
                            '(19) 3875-1267',
                            '(19) 98433-7128',
                            'daianetomazeti@gmail.com',
                            '162912-4',
                            '123456' ,
                            null );

INSERT INTO usuario VALUES( 6, #id_usuario
                            2, #id_tipo_usuario
                            'Edgar Noda',
                            '41.766.399-7',
                            '934.834.052-24',
                            '13120-234',
                            '(19) 3875-1269',
                            '(19) 98433-7121',
                            'edgar.noda@ifsp.edu.br',
                            '162912-5',
                            '123456' ,
                            null );

INSERT INTO usuario VALUES( 7, #id_usuario
                            2, #id_tipo_usuario
                            'Leandro Ledel',
                            '46.281.275-3',
                            '045.353.991-23',
                            '13120-235',
                            '(19) 3875-1265',
                            '(19) 98433-7122',
                            'leandro.ledel@gmail.com',
                            '162912-6',
                            '123456' ,
                            null );

INSERT INTO usuario VALUES( 8, #id_usuario
                            2, #id_tipo_usuario
                            'Rodolfo Francisco de Oliveira',
                            '22.065.604-6',
                            '545.810.012-34',
                            '13120-236',
                            '(19) 3875-1261',
                            '(19) 98433-7129',
                            'rodolfo.oliveira@ifsp.edu.br',
                            '162912-7',
                            '123456' ,
                            null );

INSERT INTO usuario VALUES( 9, #id_usuario
                            2, #id_tipo_usuario
                            'Fernando Sambinelli',
                            '22.065.604-7',
                            '545.810.012-35',
                            '13120-236',
                            '(19) 3875-1269',
                            '(19) 98433-7123',
                            'fersambi@gmail.com',
                            '162912-8',
                            '123456', 
                            null);

#Criação de Turmas
INSERT INTO turma VALUES( 1, 2013, 01 );
INSERT INTO turma VALUES( 2, 2013, 02 );
INSERT INTO turma VALUES( 3, 2014, 01 );
INSERT INTO turma VALUES( 4, 2014, 02 );
INSERT INTO turma VALUES( 5, 2015, 01 );
INSERT INTO turma VALUES( 6, 2015, 02 );

INSERT INTO periodo VALUES( 1, "Matutino" );
INSERT INTO periodo VALUES( 2, "Vespertino" );
INSERT INTO periodo VALUES( 3, "Noturno" );

#Matérias do primeiro semestre
INSERT INTO disciplina VALUES( 1, 'ADCA1', 'Arquitetura de Computadores', 80 );
INSERT INTO disciplina VALUES( 2, 'LOPA1', 'Lógica de Programação', 120 );
INSERT INTO disciplina VALUES( 3, 'COEA1', 'Comunicação e Expressão', 40 );
INSERT INTO disciplina VALUES( 4, 'INGA1', 'Inglês técnico', 40 );
INSERT INTO disciplina VALUES( 5, 'MD1A1', 'Matemática Discreta I', 40 );
INSERT INTO disciplina VALUES( 6, 'HCTA1', 'História da Ciência e da Tecnologia', 40 );

#Matérias do segundo semestre
INSERT INTO disciplina VALUES( 7, 'MD1A2', 'Matemática Discreta II', 40 );
INSERT INTO disciplina VALUES( 8, 'AS1A2', 'Análise de Sistemas I', 80 );
INSERT INTO disciplina VALUES( 9, 'ADMA2', 'Administração Geral', 40 );
INSERT INTO disciplina VALUES( 10, 'SOPA2', 'Sistemas Operacionais', 80 );
INSERT INTO disciplina VALUES( 11, 'RC1A2', 'Redes de Computadores I', 80 );
INSERT INTO disciplina VALUES( 12, 'LOGA2', 'Linguagem de Programação I', 80 );

#Matérias do terceiro semestre
INSERT INTO disciplina VALUES( 13, 'PEEA3', 'Probabilidade e Estatística', 40 );
INSERT INTO disciplina VALUES( 14, 'OSMA3', 'Organização, Sistemas e Métodos', 40 );
INSERT INTO disciplina VALUES( 15, 'BD1A3', 'Banco de Dados I', 80 );
INSERT INTO disciplina VALUES( 16, 'EDDA3', 'Estrutura de Dados', 80 );
INSERT INTO disciplina VALUES( 17, 'RC2A3', 'Redes de Computadores II', 80 );
INSERT INTO disciplina VALUES( 18, 'AS2A3', 'Análise de Sistemas II', 80 );

#Matérias do quarto semestre
INSERT INTO disciplina VALUES( 19, 'BD2A4', 'Banco de Dados II', 80 );
INSERT INTO disciplina VALUES( 20, 'MTPA4', 'Metodologia de Pesquisa', 40 );
INSERT INTO disciplina VALUES( 21, 'GSIA4', 'Gestão de Serviços Informatizados', 40 );
INSERT INTO disciplina VALUES( 22, 'IDSA4', 'Implantação de Servidores', 80 );
INSERT INTO disciplina VALUES( 23, 'PRSA4', 'Projeto de Sistemas', 80 );
INSERT INTO disciplina VALUES( 24, 'LP2A4', 'Linguagem de Programação II', 80 );

#Matérias do quinto semestre
INSERT INTO disciplina VALUES( 25, 'SIGA5', 'Sistemas de Informações Gerenciais', 80 ); #Carlos 4
INSERT INTO disciplina VALUES( 26, 'GTIA5', 'Gestão de TI', 80 ); #Edgar 6
INSERT INTO disciplina VALUES( 27, 'DW1A5', 'Desenvolvimento para Web I', 80 ); #Gustavo 2
INSERT INTO disciplina VALUES( 28, 'ENGA5', 'Engenharia de Software', 80 ); #Fernando 9
INSERT INTO disciplina VALUES( 29, 'PR1A5', 'Projeto Integrado I', 80 ); #André 3

#Matérias do sexto semestre
INSERT INTO disciplina VALUES( 30, 'DW2A6', 'Desenvolvimento Web II', 80 ); #Leandro 7
INSERT INTO disciplina VALUES( 31, 'PI2A6', 'Projeto Integrado II', 160 ); #Daiane 5
INSERT INTO disciplina VALUES( 32, 'TPAA6', 'Tópicos Avançados', 80 ); #Gustavo 2
INSERT INTO disciplina VALUES( 33, 'SEGA6', 'Segurança da Informação', 80 ); #Rodolfo 8

#Relacionamentos curso e disciplina
INSERT INTO rel_disciplina_curso VALUES( null, 1, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 2, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 3, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 4, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 5, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 6, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 7, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 8, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 9, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 10, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 11, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 12, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 13, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 14, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 15, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 16, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 17, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 18, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 19, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 20, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 21, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 22, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 23, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 24, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 25, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 26, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 27, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 28, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 29, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 30, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 31, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 32, 1 );
INSERT INTO rel_disciplina_curso VALUES( null, 33, 1 );

#Avaliações
INSERT INTO avaliacao VALUES( 1, '2015-03-26', 'Prova 1', 0.35 );
INSERT INTO avaliacao VALUES( 2, '2015-06-29', 'Prova 2', 0.35 );
INSERT INTO avaliacao VALUES( 3, '2015-04-15', 'Trabalho 1', 0.15 );
INSERT INTO avaliacao VALUES( 4, '2015-06-21', 'Trabalho 2', 0.15 );
INSERT INTO avaliacao VALUES( 5, '2015-02-27', 'Prova 1', 0.35 );
INSERT INTO avaliacao VALUES( 6, '2015-07-23', 'Prova 2', 0.35 );
INSERT INTO avaliacao VALUES( 7, '2015-03-10', 'Trabalho 1', 0.15 );
INSERT INTO avaliacao VALUES( 8, '2015-05-03', 'Trabalho 2', 0.15 );
INSERT INTO avaliacao VALUES( 9, '2015-02-27', 'Prova 1', 0.23 );
INSERT INTO avaliacao VALUES( 10, '2015-07-23', 'Prova 2', 0.23 );
INSERT INTO avaliacao VALUES( 11, '2015-07-23', 'Prova 3', 0.23 );
INSERT INTO avaliacao VALUES( 12, '2015-12-10', 'Seminário', 0.31 );

#Situações
INSERT INTO situacao VALUES( 1, 'Aprovado'  );
INSERT INTO situacao VALUES( 2, 'Reprovado' );
INSERT INTO situacao VALUES( 3, 'Em Curso'  );

#Incluindo relacionamento entre turma e o periodo em que a turma pertence
INSERT INTO rel_turma_periodo VALUES( 1, 1, 3 );
INSERT INTO rel_turma_periodo VALUES( 2, 2, 3 );
INSERT INTO rel_turma_periodo VALUES( 3, 3, 3 );
INSERT INTO rel_turma_periodo VALUES( 4, 4, 3 );
INSERT INTO rel_turma_periodo VALUES( 5, 5, 3 );
INSERT INTO rel_turma_periodo VALUES( 6, 6, 3 );

#Criando o relacionamento entre disciplinas e turma
INSERT INTO rel_turma_disciplina VALUES( 1, 5, 25 );
INSERT INTO rel_turma_disciplina VALUES( 2, 5, 26 );
INSERT INTO rel_turma_disciplina VALUES( 3, 5, 27 );
INSERT INTO rel_turma_disciplina VALUES( 4, 5, 28 );
INSERT INTO rel_turma_disciplina VALUES( 5, 5, 29 );
INSERT INTO rel_turma_disciplina VALUES( 6, 6, 30 );
INSERT INTO rel_turma_disciplina VALUES( 7, 6, 31 );
INSERT INTO rel_turma_disciplina VALUES( 8, 6, 32 );
INSERT INTO rel_turma_disciplina VALUES( 9, 6, 33 );

INSERT INTO rel_aluno_turma_disciplina VALUES( 1, 1, 1, 59 );
INSERT INTO rel_aluno_turma_disciplina VALUES( 2, 1, 2, 92 );
INSERT INTO rel_aluno_turma_disciplina VALUES( 3, 1, 3, 91 );
INSERT INTO rel_aluno_turma_disciplina VALUES( 4, 1, 4, 42 );
INSERT INTO rel_aluno_turma_disciplina VALUES( 5, 1, 5, 51 );
INSERT INTO rel_aluno_turma_disciplina VALUES( 6, 1, 6, 68 );
INSERT INTO rel_aluno_turma_disciplina VALUES( 7, 1, 7, 32 );
INSERT INTO rel_aluno_turma_disciplina VALUES( 8, 1, 8, 71 );
INSERT INTO rel_aluno_turma_disciplina VALUES( 9, 1, 9, 75 );

INSERT INTO rel_professor_turma_disciplina VALUES( 1, 4, 1 );
INSERT INTO rel_professor_turma_disciplina VALUES( 2, 6, 2 );
INSERT INTO rel_professor_turma_disciplina VALUES( 3, 2, 3 );
INSERT INTO rel_professor_turma_disciplina VALUES( 4, 9, 4 );
INSERT INTO rel_professor_turma_disciplina VALUES( 5, 3, 5 );
INSERT INTO rel_professor_turma_disciplina VALUES( 6, 7, 6 );
INSERT INTO rel_professor_turma_disciplina VALUES( 7, 5, 7 );
INSERT INTO rel_professor_turma_disciplina VALUES( 8, 2, 8 );
INSERT INTO rel_professor_turma_disciplina VALUES( 9, 8, 9 );

INSERT INTO rel_avaliacao_turma_disciplina VALUES( 1, 1, 1 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 2, 2, 1 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 3, 3, 1 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 4, 4, 1 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 5, 5, 2 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 6, 6, 2 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 7, 7, 2 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 8, 8, 2 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 9, 9, 3 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 10, 10, 3 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 11, 11, 3 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 12, 12, 3 );

INSERT INTO rel_avaliacao_turma_aluno VALUES( 1, 1, 1 , 6);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 2, 2, 1 , 6);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 3, 3, 1 , 10);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 4, 4, 1 , 10);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 5, 5, 1 , 9);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 6, 6, 1 , 7);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 7, 7, 1 , 0);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 8, 8, 1 , 8.5);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 9, 9, 1 , 7);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 10, 10, 1 , 7);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 11, 11, 1 , 6.5);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 12, 12, 1 , 9.7);

INSERT INTO rel_situacao_aluno_turma VALUES ( 1, 1, 1, 1, 10);
INSERT INTO rel_situacao_aluno_turma VALUES ( 2, 1, 1, 2, 6);
INSERT INTO rel_situacao_aluno_turma VALUES ( 3, 2, 1, 3, 5.3);
INSERT INTO rel_situacao_aluno_turma VALUES ( 4, 1, 1, 4, 7);
INSERT INTO rel_situacao_aluno_turma VALUES ( 5, 1, 1, 5, 7);
INSERT INTO rel_situacao_aluno_turma VALUES ( 6, 3, 1, 6, 7.8);
INSERT INTO rel_situacao_aluno_turma VALUES ( 7, 3, 1, 7, 8.2);
INSERT INTO rel_situacao_aluno_turma VALUES ( 8, 3, 1, 8, 10);
INSERT INTO rel_situacao_aluno_turma VALUES ( 9, 3, 1, 9, 6.4);