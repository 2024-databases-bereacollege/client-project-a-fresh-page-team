-- https://www.programiz.com/sql/insert-into

-- Add SQL inserts here
INSERT INTO `Foodbank` (`FB_ID`,`Organisation`,`Primary Contact Name`,`Primary Contact Info`,`address`,`email`,`Joining Date`)
VALUES
  (84134,"Dictum Limited","Gavin Olsen","(805) 811-5218","1721 Nascetur Av.","curabitur.sed@google.edu","Apr 13, 2024"),
  (44204,"Nunc PC","Omar Compton","(495) 487-2527","P.O. Box 394, 9121 Adipiscing Rd.","tristique.senectus@outlook.couk","Mar 23, 2025"),
  (14789,"Libero Est LLP","Ciara Hopper","(305) 451-8544","8525 Praesent Road","rutrum@icloud.com","Oct 31, 2023"),
  (90226,"Arcu Incorporated","Savannah Brennan","1-975-967-4234","891-8625 Eleifend Street","sed.libero.proin@aol.edu","Nov 30, 2023"),
  (95899,"Lacus Ut Ltd","Eaton Cote","(628) 573-3280","851-4808 Viverra. Avenue","nulla.integer@yahoo.couk","Jul 30, 2023"),
  (49917,"Nullam Suscipit Est Company","Preston Melton","(691) 589-7369","478-8401 Lorem, Rd.","nec@google.org","Dec 24, 2023"),
  (60551,"Eu Eleifend Corporation","Sonia Petty","(777) 451-0807","685-5050 Etiam Ave","nec.metus@google.couk","Aug 18, 2023"),
  (71474,"Ligula Tortor Limited","Pandora Landry","1-921-357-7113","945-2142 Mauris Av.","sapien.cursus@hotmail.edu","Sep 30, 2024"),
  (58335,"Molestie Tortor PC","Valentine Figueroa","1-446-684-2218","P.O. Box 650, 4463 Feugiat Road","ornare.facilisis@protonmail.edu","Sep 25, 2023"),
  (85300,"Est Mollis Industries","Kaitlin Serrano","(528) 516-5768","594-8395 Est St.","nonummy.ultricies@outlook.net","Nov 24, 2023");

INSERT INTO `Documentation` (`DOC_ID`,`DO_ID`,`FB_ID`,`Type of Documentation`,`Date Obtained`,`Date valid`)
VALUES
  (32128,93567,10532,"Finances","05/08/29","06/23/23"),
  (69644,93506,59752,"Licenses","06/21/27","07/08/24"),
  (25464,40142,31557,"Quality Assurance","07/13/33","09/18/24"),
  (70638,79448,66172,"Licenses","04/30/26","11/24/23"),
  (56902,89960,83019,"Quality Assurance","04/14/27","06/17/23"),
  (13906,72242,73987,"Licenses","06/19/33","02/20/24"),
  (65680,47333,78752,"Finances","10/11/25","09/14/23"),
  (11174,47390,81576,"Licenses","01/08/29","08/14/24"),
  (66381,36938,31099,"Quality Assurance","04/24/28","10/23/23"),
  (28244,72077,16114,"Finances","09/02/24","01/07/25");

INSERT INTO `Donor` (`DO_ID`,`Organisation`,`Primary Contact Name`,`Subscribed`,`Primary Contact Info`,`address`,`email`,`Joining Date`,`Type of Organisation`)
VALUES
  (55214,"Turpis Ltd","Jesse Lopez","1-510-766-9562","P.O. Box 966, 174 Nec, St.","eu.turpis@hotmail.net","May 2, 2023","Individual","Yes"),
  (36580,"Mollis Nec LLC","Angelica Barnes","1-644-561-3419","Ap #897-4039 Diam. Rd.","donec.sollicitudin@outlook.ca","Feb 24, 2024","Individual","No"),
  (93180,"Gravida PC","Naida Cash","(284) 430-8637","176-7009 Et, Road","elit.erat@yahoo.couk","Apr 26, 2023","Individual","Yes"),
  (44241,"Magna Suspendisse Associates","Boris Hines","1-684-837-5382","Ap #680-6297 Ac Av.","donec.tincidunt@google.net","May 19, 2023","Organisation","No"),
  (79989,"Dictum Placerat PC","Hedy Frye","1-251-352-9093","219-3578 Erat. Ave","donec.elementum@outlook.com","May 26, 2024","Individual","Yes"),
  (60159,"Tellus Sem LLC","Hiram Reid","(232) 837-8646","P.O. Box 370, 9694 Purus, Ave","velit.eget@yahoo.ca","Jun 2, 2024","Organisation","No"),
  (63353,"Ipsum Porta Elit PC","Elton Melendez","1-187-127-8675","P.O. Box 477, 1799 Hendrerit Rd.","gravida@aol.couk","Jun 19, 2024","Organisation","No"),
  (85314,"Ac Mi PC","Dai Merrill","1-586-475-8805","828-5700 Turpis. Ave","vitae@protonmail.couk","Jun 19, 2024","Individual","No"),
  (52309,"Hendrerit Consectetuer Cursus PC","Aspen Weaver","(466) 332-1228","859-2853 Nec, Rd.","cras.dolor@protonmail.net","Jun 13, 2023","Organisation","No"),
  (35740,"Metus Aliquam Limited","Lael Skinner","1-658-111-7564","Ap #401-251 Mauris Street","molestie.dapibus@google.ca","Apr 13, 2024","Individual","No");

INSERT INTO `Donation` (`DN_ID`,`DO_ID`,`FB_ID`,`Type of Donation`,`Quantity (lbs)`,`Date valid`)
VALUES
  (37828,13326,18607,"pies",3,"12/23/23"),
  (31474,90074,85306,"sandwiches",0,"07/03/23"),
  (30178,25764,66510,"pies",3,"10/04/23"),
  (16415,34774,73871,"pasta",10,"08/26/24"),
  (80595,24074,17219,"sandwiches",5,"11/11/23"),
  (27209,64688,72851,"soups",9,"10/12/23"),
  (33177,61045,74769,"noodles",6,"12/08/24"),
  (87051,82473,10066,"noodles",6,"09/11/23"),
  (48349,22255,10111,"pies",9,"12/14/23"),
  (15100,66685,47658,"sandwiches",8,"08/04/24");