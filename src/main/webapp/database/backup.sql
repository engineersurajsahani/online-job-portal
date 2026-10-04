-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: online_job_portal
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `add_catagory`
--

DROP TABLE IF EXISTS `add_catagory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `add_catagory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(2000) DEFAULT NULL,
  `categoryInfo` varchar(2000) DEFAULT NULL,
  `categoryImage` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_catagory`
--

LOCK TABLES `add_catagory` WRITE;
/*!40000 ALTER TABLE `add_catagory` DISABLE KEYS */;
INSERT INTO `add_catagory` VALUES (1,'IT','IT jobs include careers related to software development, computer systems, networking, cybersecurity, data management, and technical support. These roles are available in software companies, startups, MNCs, and government organizations.','IT.jpg'),(2,'Banking','Banking jobs include career opportunities in financial institutions like public banks, private banks, cooperative banks, and financial service companies. These roles involve handling money, customer accounts, loans, investments, and financial operations.','Bank.jpg'),(3,'Teaching','Teaching jobs include career opportunities in schools, colleges, universities, coaching institutes, and online education platforms. These roles focus on educating students, preparing lesson plans, and supporting academic growth.','Teaching1.jpg'),(4,'Sales & Marketing','Sales and Marketing jobs focus on promoting products or services, attracting customers, increasing business revenue, and building brand value. These roles are available in almost every industry including retail, IT, banking, real estate, FMCG, and e-commerce.','Sales & Marketing.jpg'),(5,'Healthcare','Healthcare jobs include career opportunities in hospitals, clinics, nursing homes, diagnostic centers, pharmacies, and healthcare organizations. These roles focus on patient care, medical support, diagnosis, treatment, and healthcare management.','Healthcare.jpg');
/*!40000 ALTER TABLE `add_catagory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_apply_job`
--

DROP TABLE IF EXISTS `e_apply_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_apply_job` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(200) DEFAULT NULL,
  `job_title` varchar(200) DEFAULT NULL,
  `job_type` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `applay_date` varchar(200) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `mobilenumber` bigint(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `resume` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `r_id` varchar(45) DEFAULT NULL,
  `interview_date` varchar(45) DEFAULT NULL,
  `interview_time` varchar(45) DEFAULT NULL,
  `interview_location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_apply_job`
--

LOCK TABLES `e_apply_job` WRITE;
/*!40000 ALTER TABLE `e_apply_job` DISABLE KEYS */;
INSERT INTO `e_apply_job` VALUES (1,'10','Software Tester (QA Engineer)','Full Time','TCS','Mumbai','25000-40000','tcs.jpg','12/02/2026','1','yashraj baburao mane',8208164660,'omiii@gmail.com','PratikResume.pdf','Accept','1','2026-02-20','13:26','pune'),(2,'12','Loan Officer','Full Time','HDFC','Pune','15000-27000','HDFC.jpg','12/02/2026','1','yashraj baburao mane',8208164660,'prathampkpk@gmail.com','BCAIII.pdf','Accept','1','2026-02-13','13:48','pune'),(3,'13','Cashier (Bank Teller)','Full Time','ICICI','Shirala','15000-25000','icici.jpg','12/02/2026','1','yashraj baburao mane',8208164660,'prathampkpk@gmail.com','PratikResume.pdf','Accept','1',NULL,NULL,NULL),(4,'18','College Lecturer','Full Time','DYP','Pune','22000-30000','Dy.jpg','12/02/2026','1','yashraj baburao mane',8208164660,'prathampkpk@gmail.com','B.C.A. Part II Semester –III NEP Examination March - 2024 (1).pdf','Accept','1','2026-03-05','01:47','mumbai'),(5,'1','software devloper','Full Time','TCS','pune','18000-22000','tcs.jpg','13/02/2026','2','pratik padalkar',9970962092,'pratikpadalkar0011@gmail.com','PratikResume.pdf','Accept','1','2026-02-20','01:00','pune'),(6,'1','software devloper','Full Time','TCS','pune','18000-22000','tcs.jpg','03/03/2026','3','Shaniraj shashikant Alugade',8208164660,'shanirajalugade55@gmail.com','PratikResume.pdf','Accept','1','2026-03-05','12:24','mumbai'),(7,'16','Branch Manager','Full Time','HDFC','Pune','25000-38000','HDFC.jpg','05/03/2026','1','kunal bhimrao nirmale ',9322483043,'kunalnirmale7@gmail.com','PratikResume.pdf','Accept','1','2026-03-11','12:00','mumbai'),(8,'18','College Lecturer','Full Time','DYP','Pune','22000-30000','Dy.jpg','05/03/2026','1','kunal bhimrao nirmale ',9322483043,'kunalnirmale7@gmail.com','PratikResume.pdf','Accept','1','2026-03-12','12:13','mumbai');
/*!40000 ALTER TABLE `e_apply_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_contactus`
--

DROP TABLE IF EXISTS `e_contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_contactus` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `contactnumber` bigint(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_contactus`
--

LOCK TABLES `e_contactus` WRITE;
/*!40000 ALTER TABLE `e_contactus` DISABLE KEYS */;
INSERT INTO `e_contactus` VALUES (1,'pratik',8208164660,'pratik@gmail.com','nice'),(2,'kunal',8208164660,'kunal@gmail.com','login problem'),(3,'Omkar',8208164660,'omiii@gmail.com','login problem'),(4,'Omkar',8208164660,'omiii@gmail.com','login problem');
/*!40000 ALTER TABLE `e_contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_feedback`
--

DROP TABLE IF EXISTS `e_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_feedback` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `feedback` varchar(1000) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_feedback`
--

LOCK TABLES `e_feedback` WRITE;
/*!40000 ALTER TABLE `e_feedback` DISABLE KEYS */;
INSERT INTO `e_feedback` VALUES (1,'kunal bhimrao nirmale ','kunal@gmail.com','Excellent','very use full','11/02/2026');
/*!40000 ALTER TABLE `e_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_signup`
--

DROP TABLE IF EXISTS `e_signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_signup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `phone_no` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_signup`
--

LOCK TABLES `e_signup` WRITE;
/*!40000 ALTER TABLE `e_signup` DISABLE KEYS */;
INSERT INTO `e_signup` VALUES (1,'Kunal Bhimrao Nirmale','Kunal','kunal@gmail.com','male','9322483043','1234',NULL),(2,'pratik dattatray padalakr','Partyaa','pratikpadalkar0011@gmail.com','male','9970962092','2092',NULL),(3,'Shaniraj Shashikant Alugade','Shaniraj01','shanirajalugade55@gmail.com','male','8208164660','82081',NULL);
/*!40000 ALTER TABLE `e_signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_add_job`
--

DROP TABLE IF EXISTS `r_add_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_add_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) DEFAULT NULL,
  `jobtitle` varchar(200) DEFAULT NULL,
  `companyname` varchar(200) DEFAULT NULL,
  `JobType` varchar(200) DEFAULT NULL,
  `position` varchar(200) DEFAULT NULL,
  `Experience` varchar(200) DEFAULT NULL,
  `Qualification` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `job_discription` varchar(2000) DEFAULT NULL,
  `companylogo` varchar(200) DEFAULT NULL,
  `requirement` varchar(2000) DEFAULT NULL,
  `job_upload_date` varchar(200) DEFAULT NULL,
  `r_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_add_job`
--

LOCK TABLES `r_add_job` WRITE;
/*!40000 ALTER TABLE `r_add_job` DISABLE KEYS */;
INSERT INTO `r_add_job` VALUES (1,'IT','software devloper','TCS','Full Time','3','0','Graduate','pune','18000-22000','A Software Developer designs, builds, and maintains software applications. This can include desktop software, enterprise systems, or backend systems that power websites and apps. They work closely with other developers, testers, and project managers to turn business needs into working software. Their job includes writing code, debugging errors, improving performance, and updating old systems.','tcs.jpg','Strong knowledge of at least one programming language (Java, Python, C++, C#)  Understanding of Data Structures and Algorithms  Knowledge of OOP (Object-Oriented Programming)  Basic knowledge of databases (MySQL, PostgreSQL)  Version control tools like Git  Problem-solving and logical thinking','11/02/2026','1'),(2,'IT','Web Developer','Wipro','Full Time','5','2','Post Graduate','mumbai','25000-38000','A Web Developer builds and maintains websites and web applications. They ensure that websites are fast, responsive, and user-friendly. Some focus on the frontend (design and layout), while others work on the backend (server, database, APIs). Full web developers handle both sides.','Wipro.jpg','HTML, CSS, JavaScript  Frontend frameworks (React, Angular, or Vue)  Backend language (Node.js, PHP, Python, or Java)  Database knowledge (MySQL, MongoDB)  Understanding of APIs and web hosting  Basic SEO and website performance knowledge','11/02/2026','1'),(3,'IT','Data Analyst','Flipkart','Full Time','1','5','Post Graduate','Mumbai','50000-67000','A Data Analyst collects, processes, and analyzes data to help companies make better business decisions. They turn raw numbers into reports, dashboards, and visual charts that explain trends and patterns.','flipkart.jpg','Strong Excel skills  SQL for database queries  Python or R for data analysis  Data visualization tools (Power BI, Tableau)  Basic statistics knowledge  Analytical thinking','11/02/2026','1'),(4,'IT','Cybersecurity Analyst','Cisco','Part Time','4','1','Post Graduate','Bangalore','21000-28000','Cybersecurity Analysts protect systems, networks, and data from hackers and cyber threats. They monitor security alerts, test systems for vulnerabilities, and respond to security incidents.','Cisco.jpg','Networking fundamentals  Knowledge of firewalls, antivirus, and IDS/IPS  Ethical hacking basics  Security certifications (CEH, CompTIA Security+) helpful  Linux basics  Strong attention to detail','11/02/2026','1'),(5,'IT','Cloud Engineer','AWS','Full Time','2','0','Post Graduate','Pune','20000-24000','A Cloud Engineer manages cloud platforms where companies store data and run applications. They set up cloud servers, ensure security, and optimize performance.','Aws.jpg','Knowledge of AWS, Azure, or Google Cloud  Linux and networking basics  Understanding of virtualization  DevOps tools (Docker, Kubernetes basics)  Scripting knowledge (Bash or Python)','11/02/2026','1'),(6,'IT','Network Engineer','Airtel','Part Time','9','4','Diploma','Bangalore','25000-40000','Network Engineers design and maintain computer networks so that systems can communicate smoothly. They manage routers, switches, and network security.','Airtel.jpg','Networking concepts (TCP/IP, DNS, DHCP)  Routers and switches configuration  CCNA certification (preferred)  Firewall and network security basics  Troubleshooting skills','11/02/2026','1'),(7,'IT','Database Administrator (DBA)','Oracle','Internship','20','0','Graduate','Bangalore','8000-12000','A DBA manages databases that store important company data. They ensure databases are secure, backed up, and running efficiently.','Oracle.jpg','Strong SQL knowledge  Experience with MySQL, Oracle, or SQL Server  Backup and recovery methods  Database security basics  Performance tuning knowledge','11/02/2026','1'),(8,'IT','AI / ML Engineer','Google','Full Time','7','3','Post Graduate','Mumbai','32000-42000','AI/ML Engineers build systems that learn from data, like chatbots, recommendation systems, and image recognition tools.','Google.jpg','Python programming  Machine learning algorithms  Libraries like TensorFlow, PyTorch, Scikit-learn  Statistics and linear algebra basics  Data preprocessing skills','11/02/2026','1'),(9,'IT','UI/UX Designer','Zomato','Part Time','4','1','Post Graduate','Mumbai','30000-40000','UI/UX Designers make apps and websites easy and enjoyable to use. UI focuses on look and layout, while UX focuses on user experience and usability.','zomato.jpg','Tools like Figma, Adobe XD, Sketch  Design principles and color theory  Wireframing and prototyping  User research and testing  Creativity and communication skills','11/02/2026','1'),(10,'IT','Software Tester (QA Engineer)','TCS','Full Time','11','2','Post Graduate','Mumbai','25000-40000','Software Testers check applications for bugs and ensure everything works correctly before release.','tcs.jpg','Manual testing knowledge  Test case writing  Automation tools (Selenium, JUnit)  Understanding of SDLC and STLC  Attention to detail','11/02/2026','1'),(11,'Banking','Bank Clerk','SBI','Full Time','1','0','Graduate','sangli','25000-38000','Bank clerks handle daily customer transactions such as deposits, withdrawals, passbook updates, and account-related services.','sbi.jpg','Basic computer knowledge, communication skills, accuracy in calculations','11/02/2026','1'),(12,'Banking','Loan Officer','HDFC','Full Time','1','2','Graduate','Pune','15000-27000','Loan Officers evaluate loan applications and help customers get home loans, personal loans, or business loans.','HDFC.jpg','Financial knowledge, document verification, decision-making','11/02/2026','1'),(13,'Banking','Cashier (Bank Teller)','ICICI','Full Time','1','0','Graduate','Shirala','15000-25000','A Bank Cashier handles cash deposits and withdrawals at the bank counter.','icici.jpg','Numerical ability, honesty, attention to detail','11/02/2026','1'),(14,'Banking','Branch Manager','ICICI','Full Time','3','3','Graduate','Shirala','18000-25000','Branch Managers are responsible for the overall performance of a bank branch.','icici.jpg','Leadership, banking experience, problem-solving','11/02/2026','1'),(15,'Banking','Credit Analyst','SBI','Full Time','2','2','Post Graduate','Sangli','20000-28000','Credit Analysts analyze financial data to decide whether a customer is eligible for a loan.','sbi.jpg','Strong analytical skills, finance knowledge','11/02/2026','1'),(16,'Banking','Branch Manager','HDFC','Full Time','1','2','Post Graduate','Pune','25000-38000','Branch Managers are responsible for the overall performance of a bank branch.','HDFC.jpg','Leadership, banking experience, problem-solving','11/02/2026','1'),(17,'Teaching','Higher Secondary Teacher (PGT/TGT)','Shivaji Univarcity','Full Time','31','5','Post Graduate','Kolhapur','25000-40000','PGT/TGT teachers handle advanced subjects for senior classes in schools','teaching.jpg','Post-graduation in subject, B.Ed., teaching experience.','11/02/2026','1'),(18,'Teaching','College Lecturer','DYP','Full Time','18','3','Post Graduate','Pune','22000-30000','Lecturers teach undergraduate students in colleges and universities.','Dy.jpg','Master’s degree, subject expertise, presentation skills.','11/02/2026','1'),(19,'Teaching','Professor','Yashwantrav Chavan Mahavidyalay','Full Time','2','3','Post Graduate','Urun-ishavarpur','15000-22000','Professors teach at universities and also conduct research in their field.','ycc.jpg','PhD degree, research publications, deep subject knowledge.','11/02/2026','1'),(20,'Teaching','Physical Education (PE) Teacher','Yashwantrav Chavan Mahavidyalay','Part Time','1','3','Graduate','Urun-ishavarpur','12000-20000','PE teachers train students in sports, physical fitness, and health education','ycc.jpg','Sports training, physical fitness knowledge','11/02/2026','1'),(21,'Teaching','Computer Teacher','KBP','Full Time','1','1','Graduate','Urun-ishavarpur','18000-22000','Computer teachers educate students about computer basics, programming, and IT skills.','kbp.jpg','Computer knowledge, programming basics, teaching ability.','11/02/2026','1'),(22,'Sales & Marketing','Sales Executive','Tata Consumer Products','Part Time','3','5','Graduate','pune','25000-38000','A Sales Executive is responsible for selling products or services directly to customers, retailers, or businesses. They meet clients, explain product benefits, negotiate prices, and achieve monthly or yearly sales targets. This role often involves fieldwork and building long-term customer relationships.','tata.jpg','Good communication and convincing skills  Confidence and positive attitude  Basic computer knowledge (Excel, email)  Ability to travel for field visits  Target-oriented mindset','11/02/2026','1'),(23,'Sales & Marketing','Marketing Executive','Amul','Part Time','5','2','Graduate','pune','25000-30000','A Marketing Executive promotes products through advertising, events, campaigns, and branding activities. They help increase brand awareness and attract customers.','Amul.jpg','Creativity and communication skills  Knowledge of basic marketing strategies  Social media and online promotion knowledge  Market research ability','11/02/2026','1'),(24,'Sales & Marketing','Digital Marketing Executive','Flipkart','Full Time','10','1','Graduate','Mumbai','25000-40000','Handles online promotion of products through social media, search engines, and websites. Works on ads, content, and brand visibility online.','flipkart.jpg','SEO (Search Engine Optimization) knowledge  Social media marketing skills  Google Ads & Facebook Ads basics  Content writing skills  Basic knowledge of websites','11/02/2026','1'),(25,'Sales & Marketing','Business Development Executive (BDE)','HDFC','Part Time','1','3','Post Graduate','Sangli','50000-67000','Focuses on finding new clients and business opportunities. Builds partnerships and increases company revenue.','HDFC.jpg','Strong communication and negotiation skills  Lead generation knowledge  Email and phone communication skills  Basic CRM software knowledge','11/02/2026','1'),(26,'Sales & Marketing','Sales Manager','Airtel','Full Time','12','3','Post Graduate','Mumbai','50000-60000','Leads a sales team and creates strategies to achieve company sales targets. Monitors team performance and plans expansion.','Airtel.jpg','Sales experience (2–5 years)  Leadership and team-handling skills  Sales planning and reporting  Strong decision-making ability','11/02/2026','1'),(27,'Healthcare','Doctor (Physician)','RML Hospital','Full Time','2','3','Post Graduate','Mumbai','50000-60000','Doctors diagnose illnesses, treat patients, and prescribe medicines. They may work in hospitals, clinics, or private practice.','RML  Hospital.webp','MBBS degree  MD/MS for specialization  Medical license  Strong medical knowledge and patient care skills','11/02/2026','1'),(28,'Healthcare','Nurse','Manipal Hospitals','Part Time','2','3','Post Graduate','Mumbai','12000-15000','Nurses take care of patients, assist doctors, and monitor patient recovery.','Manipal Hospitals.jpg','BSc Nursing or GNM  Nursing registration  Patient care skills','11/02/2026','1');
/*!40000 ALTER TABLE `r_add_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_interview_schedule`
--

DROP TABLE IF EXISTS `r_interview_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_interview_schedule` (
  `interview_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(200) DEFAULT NULL,
  `time` bigint(12) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`interview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_interview_schedule`
--

LOCK TABLES `r_interview_schedule` WRITE;
/*!40000 ALTER TABLE `r_interview_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_interview_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_signup`
--

DROP TABLE IF EXISTS `r_signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_signup` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) DEFAULT NULL,
  `companyname` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `phone_no` bigint(20) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_signup`
--

LOCK TABLES `r_signup` WRITE;
/*!40000 ALTER TABLE `r_signup` DISABLE KEYS */;
INSERT INTO `r_signup` VALUES (1,'Pratik Dattatray Padalkar','TCS','pratik@gmail.com','9970','male',9970962092,'Pune','tcs.jpg');
/*!40000 ALTER TABLE `r_signup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-06 10:14:18
