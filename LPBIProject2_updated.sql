
https://stackoverflow.com/questions/62788229/how-to-run-sql-query-inside-docker-container-and-export-results-outside-the-cont

SELECT CONCAT('{',
                 CONCAT('"@type":', '"BlogPosting"', ','),
                 CONCAT('"name":"', post_name, '"', ','),
                 CONCAT('"author":"', display_name, '"', ','),
                 CONCAT('"datePublished":"', post_date, '"', ','),
                 CONCAT('"datemodified":"', post_modified, '"', ','),
                 ('"keywords":'),
                 ('['),
                 group_concat('"', name, '"'),
                 (']'),
                 (','),
                 ('"url":'),
                 CONCAT('https://pharmaceuticalintelligence.com',date_format(post_date, '/%c/%e/%Y/'),post_name)AS url
                 '}'
             )
FROM wp_term_relationships
    INNER JOIN wp_term_taxonomy
        ON (
               wp_term_taxonomy.term_taxonomy_id = wp_term_relationships.term_taxonomy_id
               AND wp_term_taxonomy.taxonomy = 'category'
           )
    INNER JOIN wp_terms
        ON (wp_terms.term_id = wp_term_taxonomy.term_id)
    INNER JOIN wp_posts
        ON (wp_posts.ID = wp_term_relationships.object_id)
    INNER JOIN wp_users
        ON (wp_posts.post_author = wp_users.ID)
WHERE object_id IN ( 4103, 65986 )
GROUP BY post_name;

select post_name,display_name,post_date,post_modified 
sesFROM wp_term_relationships
    INNER JOIN wp_term_taxonomy
        ON (
               wp_term_taxonomy.term_taxonomy_id = wp_term_relationships.term_taxonomy_id
               AND wp_term_taxonomy.taxonomy = 'category'
           )
    INNER JOIN wp_terms
        ON (wp_terms.term_id = wp_term_taxonomy.term_id)
    INNER JOIN wp_posts
        ON (wp_posts.ID = wp_term_relationships.object_id)
    INNER JOIN wp_users
        ON (wp_posts.post_author = wp_users.ID)
WHERE object_id IN ( 4103, 65986 )
GROUP BY post_name
session.runSql("post_name AS name, display_name AS author , concat('[' ,group_concat(name),']') AS keywords,post_date AS datePublished,post_modified AS datemodified, CONCAT('https://pharmaceuticalintelligence.com',date_format(post_date, '/%c/%e/%Y/'),post_name)AS url from wp_term_relationships INNER JOIN wp_term_taxonomy ON( wp_term_taxonomy.term_taxonomy_id = wp_term_relationships.term_taxonomy_id AND wp_term_taxonomy.taxonomy = 'category' ) INNER JOIN wp_terms ON (wp_terms.term_id = wp_term_taxonomy.term_id) INNER JOIN wp_posts ON (wp_posts.ID = wp_term_relationships.object_id) INNER JOIN wp_users ON (wp_posts.post_author = wp_users.ID) where object_id IN ( 4103, 65986 ) GROUP BY post_name")



session.runSql("select `@context`,`@type`, post_name AS name, ANY_VALUE(display_name) AS author , concat('[' ,group_concat(name),']') AS keywords,post_date AS datePublished,post_modified AS datemodified from wp_term_relationships INNER JOIN wp_term_taxonomy ON( wp_term_taxonomy.term_taxonomy_id = wp_term_relationships.term_taxonomy_id AND wp_term_taxonomy.taxonomy = 'category' ) INNER JOIN wp_terms ON (wp_terms.term_id = wp_term_taxonomy.term_id) INNER JOIN wp_posts ON (wp_posts.ID = wp_term_relationships.object_id) INNER JOIN wp_users ON (wp_posts.post_author = wp_users.ID) where object_id IN ( 4103, 65986 ) GROUP BY post_name")


[
{"name":"biomarker-tool-development-for-early-diagnosis-of-pancreatic-cancer-van-andel-institute-and-emory-university","author":"2012pharmaceutical","keywords":"[Personalized and Precision Medicine &amp; Genomic Research,CANCER BIOLOGY &amp; Innovations in Cancer Therapy,Chemical Genetics,Cell Biology, Signaling &amp; Cell Circuits,Computational Biology/Systems and Bioinformatics,Medical and Population Genetics,Genome Biology,Chemical Biology and its relations to Metabolic Disease,Biological Networks, Gene Regulation and Evolution,Disease Biology, Small Molecules in Development of Therapeutic Drugs,Population Health Management, Genetics &amp; Pharmaceutical,Liver &amp; Digestive Diseases Research,Bio Instrumentation in Experimental Life Sciences Research,Biomarkers &amp; Medical Diagnostics,Systemic Inflammatory Response Related Disorders,Molecular Genetics &amp; Pharmaceutical,Genomic Testing: Methodology for Diagnosis,Technology Transfer: Biotech and Pharmaceutical,Reproductive Andrology, Embryology, Genomic Endocrinology, Preimplantation Genetic Diagnosis and Reproductive Genomics]","datePublished":"2012-10-24 18:18:52","datemodified":"2021-06-18 10:59:20"},
{"name":"tubiol5227-biomarkers-biotargets-genetic-testing-and-bioethics","author":"sjwilliamspa","keywords":"[Health Economics and Outcomes Research,Personalized and Precision Medicine &amp; Genomic Research,FDA Regulatory Affairs,BioSimilars,Regulated Clinical Trials: Design, Methods, Components and IRB related issues,Biomarkers &amp; Medical Diagnostics,Healthcare costs and reimbursement,Federal Budget Appropriations,Intellectual Property, Innovations, Commercialization, Investment in technological breakthrough,Conference Coverage with Social Media,BioBanking,Personal Health Applications: Tech Innovations serves HealhCare,Clinical Diagnostics,Patents,Biological Networks,FDA,Cancer and Current Therapeutics,BioTechnology - Venture Creation,BioIT: BioInformatics, NGS, Clinical &amp; Translational, Pharmaceutical R&amp;D Informatics, Clinical Genomics, Cancer Informatics,BioIT: BioInformatics,Clinical Genomics,Patient Experience,Bio-Ethics,Next Generation Sequencing (NGS),interventional oncology,Cancer Genomics,Patent Law in Biotech,Voices of Patients and Healthcare Providers,Personalized Medicine Coalition,Precision C]","datePublished":"2021-09-28 15:34:53","datemodified":"2021-09-28 15:34:53"}
]



{
  "@context": {
    "name": "http://schema.org/name",
    "image": {
      "@id": "http://schema.org/image",
      "@type": "@id"
    },
    "homepage": {
      "@id": "http://schema.org/url",
      "@type": "@id"
    }
  },



  ALTER TABLE wp_posts
ADD COLUMN `@context` VARCHAR(15);

UPDATE wp_posts
     SET `@context` = 'https://schema.org';

     concat('[' ,group_concat(name),']')

     {
  "@context": "https://schema.org",
  "@id": "https://www.wikidata.org/wiki/Q836821",
  "@type": "Movie",
  "name": "The Hitchhiker's Guide to the Galaxy",
  "disambiguatingDescription": "2005 British-American comic science fiction film directed by Garth Jennings",
  "titleEIDR": "10.5240/B752-5B47-DBBE-E5D4-5A3F-N",
  "isBasedOn": {
    "@id": "https://www.wikidata.org/wiki/Q3107329",
    "@type": "Book",
    "name": "The Hitchhiker's Guide to the Galaxy",
    "isbn": "0-330-25864-8",
    "author": {
      "@id": "https://www.wikidata.org/wiki/Q42",
      "@type": "Person",
      "name": "Douglas Adams"
    }
  }
}


SELECT CONCAT('{',
                 CONCAT('"context":', '"https://schema.org"', ','),
                 CONCAT('"@type":', '"BlogPosting"', ','),
                 CONCAT('"name":"', post_name, '"', ','),
                 CONCAT('"datePublished":"', post_date, '"', ','),
                 CONCAT('"datemodified":"', post_modified, '"', ','),
                 ('"keywords":'),
                 ('['),
                 group_concat('"', name, '"'),
                 (']'),
                 (','),
                 ('"url":'),
                 CONCAT(
                           '"',
                           'https://pharmaceuticalintelligence.com',
                           date_format(post_date, '/%c/%e/%Y/'),
                           post_name,
                           '",'
                       ),
                CONCAT('"author": {'),
                 CONCAT('"@type":"', 'Person', '"', ','),
                 CONCAT('"name":"', display_name, '"', ','),
                 '}', '}'
             )
FROM wp_term_relationships
    INNER JOIN wp_term_taxonomy
        ON (
               wp_term_taxonomy.term_taxonomy_id = wp_term_relationships.term_taxonomy_id
               AND wp_term_taxonomy.taxonomy = 'category'
           )
    INNER JOIN wp_terms
        ON (wp_terms.term_id = wp_term_taxonomy.term_id)
    INNER JOIN wp_posts
        ON (wp_posts.ID = wp_term_relationships.object_id)
    INNER JOIN wp_users
        ON (wp_posts.post_author = wp_users.ID)
WHERE object_id IN ( 4103)
GROUP BY post_name
INTO OUTFILE '/var/lib/mysql-files/test.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


{"context":"https://schema.org","@type":"BlogPosting","name":"biomarker-tool-development-for-early-diagnosis-of-pancreatic-cancer-van-andel-institute-and-emory-university","datePublished":"2012-10-24 18:18:52","datemodified":"2021-06-18 10:59:20","keywords":["Personalized and Precision Medicine &amp; Genomic Research","CANCER BIOLOGY &amp; Innovations in Cancer Therapy","Chemical Genetics","Cell Biology, Signaling &amp; Cell Circuits","Computational Biology/Systems and Bioinformatics","Medical and Population Genetics","Genome Biology","Chemical Biology and its relations to Metabolic Disease","Biological Networks, Gene Regulation and Evolution","Disease Biology, Small Molecules in Development of Therapeutic Drugs","Population Health Management, Genetics &amp; Pharmaceutical","Liver &amp; Digestive Diseases Research","Bio Instrumentation in Experimental Life Sciences Research","Biomarkers &amp; Medical Diagnostics","Systemic Inflammatory Response Related Disorders","Molecular Genetics &amp; Pharmaceutical","Genomic Testing: Methodology for Diagnosis","Technology Transfer: Biotech and Pharmaceutical","Reproductive Andrology, Embryology, Genomic Endocrinology, Preimplantation Genetic Diagnosis and Reproductive Genomics"],"url":"https://pharmaceuticalintelligence.com/10/24/2012/biomarker-tool-development-for-early-diagnosis-of-pancreatic-cancer-van-andel-institute-and-emory-university""author": {""@type":"Person","name":"2012pharmaceutical",}}




OUTPUT 1:
```
{
  "context": "https://schema.org",
  "@type": "BlogPosting",
  "name": "biomarker-tool-development-for-early-diagnosis-of-pancreatic-cancer-van-andel-institute-and-emory-university",
  "datePublished": "2012-10-24 18:18:52",
  "datemodified": "2021-06-18 10:59:20",
  "keywords": [
    "Personalized and Precision Medicine &amp; Genomic Research",
    "CANCER BIOLOGY &amp; Innovations in Cancer Therapy",
    "Chemical Genetics",
    "Cell Biology, Signaling &amp; Cell Circuits",
    "Computational Biology/Systems and Bioinformatics",
    "Medical and Population Genetics",
    "Genome Biology",
    "Chemical Biology and its relations to Metabolic Disease",
    "Biological Networks, Gene Regulation and Evolution",
    "Disease Biology, Small Molecules in Development of Therapeutic Drugs",
    "Population Health Management, Genetics &amp; Pharmaceutical",
    "Liver &amp; Digestive Diseases Research",
    "Bio Instrumentation in Experimental Life Sciences Research",
    "Biomarkers &amp; Medical Diagnostics",
    "Systemic Inflammatory Response Related Disorders",
    "Molecular Genetics &amp; Pharmaceutical",
    "Genomic Testing: Methodology for Diagnosis",
    "Technology Transfer: Biotech and Pharmaceutical",
    "Reproductive Andrology, Embryology, Genomic Endocrinology, Preimplantation Genetic Diagnosis and Reproductive Genomics"
  ],
  "url": "https://pharmaceuticalintelligence.com/10/24/2012/biomarker-tool-development-for-early-diagnosis-of-pancreatic-cancer-van-andel-institute-and-emory-university",
  "author": {
    "@type": "Person",
    "name": "2012pharmaceutical"
  }
}

```


OUTPUT 2: MySQL shell

{
    "@context": "https://schema.",
    "@type": "BlogPosting",
    "name": "biomarker-tool-development-for-early-diagnosis-of-pancreatic-cancer-van-andel-institute-and-emory-university",
    "author": "2012pharmaceutical",
    "keywords": "[Personalized and Precision Medicine &amp; Genomic Research,CANCER BIOLOGY &amp; Innovations in Cancer Therapy,Chemical Genetics,Cell Biology, Signaling &amp; Cell Circuits,Computational Biology/Systems and Bioinformatics,Medical and Population Genetics,Genome Biology,Chemical Biology and its relations to Metabolic Disease,Biological Networks, Gene Regulation and Evolution,Disease Biology, Small Molecules in Development of Therapeutic Drugs,Population Health Management, Genetics &amp; Pharmaceutical,Liver &amp; Digestive Diseases Research,Bio Instrumentation in Experimental Life Sciences Research,Biomarkers &amp; Medical Diagnostics,Systemic Inflammatory Response Related Disorders,Molecular Genetics &amp; Pharmaceutical,Genomic Testing: Methodology for Diagnosis,Technology Transfer: Biotech and Pharmaceutical,Reproductive Andrology, Embryology, Genomic Endocrinology, Preimplantation Genetic Diagnosis and Reproductive Genomics]",
    "datePublished": "2012-10-24 18:18:52",
    "datemodified": "2021-06-18 10:59:20"
}
{
    "@context": "https://schema.",
    "@type": "BlogPosting",
    "name": "tubiol5227-biomarkers-biotargets-genetic-testing-and-bioethics",
    "author": "sjwilliamspa",
    "keywords": "[Health Economics and Outcomes Research,Personalized and Precision Medicine &amp; Genomic Research,FDA Regulatory Affairs,BioSimilars,Regulated Clinical Trials: Design, Methods, Components and IRB related issues,Biomarkers &amp; Medical Diagnostics,Healthcare costs and reimbursement,Federal Budget Appropriations,Intellectual Property, Innovations, Commercialization, Investment in technological breakthrough,Conference Coverage with Social Media,BioBanking,Personal Health Applications: Tech Innovations serves HealhCare,Clinical Diagnostics,Patents,Biological Networks,FDA,Cancer and Current Therapeutics,BioTechnology - Venture Creation,BioIT: BioInformatics, NGS, Clinical &amp; Translational, Pharmaceutical R&amp;D Informatics, Clinical Genomics, Cancer Informatics,BioIT: BioInformatics,Clinical Genomics,Patient Experience,Bio-Ethics,Next Generation Sequencing (NGS),interventional oncology,Cancer Genomics,Patent Law in Biotech,Voices of Patients and Healthcare Providers,Personalized Medicine Coalition,Precision C]",
    "datePublished": "2021-09-28 15:34:53",
    "datemodified": "2021-09-28 15:34:53"
}
