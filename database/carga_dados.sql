#Realizando as cargas de dados
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
INSERT INTO turma VALUES( 1, 2015, 01 );
INSERT INTO turma VALUES( 2, 2015, 02 );
INSERT INTO turma VALUES( 3, 2015, 02 );

INSERT INTO periodo VALUES( 1, "Matutino" );
INSERT INTO periodo VALUES( 2, "Vespertino" );
INSERT INTO periodo VALUES( 3, "Noturno" );

#Matérias do primeiro semestre
INSERT INTO disciplina VALUES( null, 'ADCA1', 'Arquitetura de Computadores', 80 );
INSERT INTO disciplina VALUES( null, 'LOPA1', 'Lógica de Programação', 120 );
INSERT INTO disciplina VALUES( null, 'COEA1', 'Comunicação e Expressão', 40 );
INSERT INTO disciplina VALUES( null, 'INGA1', 'Inglês técnico', 40 );
INSERT INTO disciplina VALUES( null, 'MD1A1', 'Matemática Discreta I', 40 );
INSERT INTO disciplina VALUES( null, 'HCTA1', 'História da Ciência e da Tecnologia', 40 );

#Matérias do segundo semestre
INSERT INTO disciplina VALUES( null, 'MD1A2', 'Matemática Discreta II', 40 );
INSERT INTO disciplina VALUES( null, 'AS1A2', 'Análise de Sistemas I', 80 );
INSERT INTO disciplina VALUES( null, 'ADMA2', 'Administração Geral', 40 );
INSERT INTO disciplina VALUES( null, 'SOPA2', 'Sistemas Operacionais', 80 );
INSERT INTO disciplina VALUES( null, 'RC1A2', 'Redes de Computadores I', 80 );
INSERT INTO disciplina VALUES( null, 'LOGA2', 'Linguagem de Programação I', 80 );

#Matérias do terceiro semestre
INSERT INTO disciplina VALUES( null, 'PEEA3', 'Probabilidade e Estatística', 40 );
INSERT INTO disciplina VALUES( null, 'OSMA3', 'Organização, Sistemas e Métodos', 40 );
INSERT INTO disciplina VALUES( null, 'BD1A3', 'Banco de Dados I', 80 );
INSERT INTO disciplina VALUES( null, 'EDDA3', 'Estrutura de Dados', 80 );
INSERT INTO disciplina VALUES( null, 'RC2A3', 'Redes de Computadores II', 80 );
INSERT INTO disciplina VALUES( null, 'AS2A3', 'Análise de Sistemas II', 80 );

#Matérias do quarto semestre
INSERT INTO disciplina VALUES( null, 'BD2A4', 'Banco de Dados II', 80 );
INSERT INTO disciplina VALUES( null, 'MTPA4', 'Metodologia de Pesquisa', 40 );
INSERT INTO disciplina VALUES( null, 'GSIA4', 'Gestão de Serviços Informatizados', 40 );
INSERT INTO disciplina VALUES( null, 'IDSA4', 'Implantação de Servidores', 80 );
INSERT INTO disciplina VALUES( null, 'PRSA4', 'Projeto de Sistemas', 80 );
INSERT INTO disciplina VALUES( null, 'LP2A4', 'Linguagem de Programação II', 80 );

#Matérias do quinto semestre
INSERT INTO disciplina VALUES( null, 'SIGA5', 'Sistemas de Informações Gerenciais', 80 );
INSERT INTO disciplina VALUES( null, 'GTIA5', 'Gestão de TI', 80 );
INSERT INTO disciplina VALUES( null, 'DW1A5', 'Desenvolvimento para Web I', 80 );
INSERT INTO disciplina VALUES( null, 'ENGA5', 'Engenharia de Software', 80 );
INSERT INTO disciplina VALUES( null, 'PR1A5', 'Projeto Integrado I', 80 );

#Matérias do sexto semestre
INSERT INTO disciplina VALUES( null, 'DW2A6', 'Desenvolvimento Web II', 80 );
INSERT INTO disciplina VALUES( null, 'PI2A6', 'Projeto Integrado II', 160 );
INSERT INTO disciplina VALUES( null, 'TPAA6', 'Tópicos Avançados', 80 );
INSERT INTO disciplina VALUES( null, 'SEGA6', 'Segurança da Informação', 80 );

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
INSERT INTO avaliacao VALUES( 1, '2015-03-26', 'Prova 1', 0.7 );
INSERT INTO avaliacao VALUES( 2, '2015-06-29', 'Prova 2', 0.3 );
INSERT INTO avaliacao VALUES( 3, '2015-06-29', 'Prova 2', 0.3 );

#Situações
INSERT INTO situacao VALUES( 1, 'Aprovado'  );
INSERT INTO situacao VALUES( 2, 'Reprovado' );
INSERT INTO situacao VALUES( 3, 'Em Curso'  );

#Incluindo relacionamento entre turma e o periodo em que a turma pertence
INSERT INTO rel_turma_periodo VALUES( 1, 1, 3 );
INSERT INTO rel_turma_periodo VALUES( 2, 2, 3 );

#Criando o relacionamento entre disciplinas e turma
INSERT INTO rel_turma_disciplina VALUES( 1, 1, 15 );
INSERT INTO rel_turma_disciplina VALUES( 2, 2, 19 );
INSERT INTO rel_turma_disciplina VALUES( 3, 3, 27 );

INSERT INTO rel_aluno_turma_disciplina VALUES (null, 1, 1, 90);
INSERT INTO rel_aluno_turma_disciplina VALUES (null, 1, 2, 90);
INSERT INTO rel_aluno_turma_disciplina VALUES (null, 1, 3, 75);

INSERT INTO rel_professor_turma_disciplina VALUES( 1, 2, 1 );
INSERT INTO rel_professor_turma_disciplina VALUES( 2, 2, 2 );
INSERT INTO rel_professor_turma_disciplina VALUES( 3, 2, 3 );

INSERT INTO rel_avaliacao_turma_disciplina VALUES( 1, 1, 1 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 2, 2, 2 );
INSERT INTO rel_avaliacao_turma_disciplina VALUES( 3, 3, 3 );

INSERT INTO rel_avaliacao_turma_aluno VALUES( 1, 1, 1 , 5);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 2, 2, 1 , 10);
INSERT INTO rel_avaliacao_turma_aluno VALUES( 3, 3, 1 , 4);

INSERT INTO rel_situacao_aluno_turma VALUES ( null, 1, 1, 1, 10);
INSERT INTO rel_situacao_aluno_turma VALUES ( null, 1, 1, 2, 5);
INSERT INTO rel_situacao_aluno_turma VALUES ( null, 1, 1, 3, 8);