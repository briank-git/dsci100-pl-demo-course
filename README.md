# PrairieLearn Overview


## Benefits:
- Eventual LTI 1.3 support allows for automatic uploading of grades to Canvas
- Can configure randomized question variants with parameters
- No need for separate student and instructor servers (if self hosted), everyone logs into the same PrairieLearn instance
- UI for basic admin, editing course materials, manual grading, to check student work, assignment progress, grading progress, etc.
- Runs off of a single GitHub repository
- Provides exam functionality
- Build solution and rubric into manually graded questions for graders


## Potential Issues:
- LTI 1.3 support is in early beta, potential bugs and missing features (documentation is light, just started development Nov 2023) 
	• Currently authentication is possible through Shibboleth? (SAML2), grade upload by CSV, if uploading to Canvas will have to reconcile Stu # or Name with Canvas ID
	• Some useful LTI 1.3 config info from Jupyter LTIAuthenticator docs https://ltiauthenticator.readthedocs.io/en/latest/lti13/getting-started.html
- Automatic late reg extensions
- Complex course directory structure and multiple config files
- May have to split coding and manual grading questions if using Workspace (JupyterLab)
- Steeper learning curve for developing/troubleshooting assignments/questions (each need info.json, question.html, server.py)

## Q & A

Could we still do jupyter notebooks? How hard would it be to rewrite test code?
- PL "Workspaces" (Docker container) can run JupyterLab with notebooks 
- Can choose which files e.g. notebooks are pulled from the Workspace for grading
- If using Workspaces, will need to write custom grading scripts. Possibly just run nbgrader on collected notebook like we do already, will need to configure nbgrader and format grade information/feedback after it runs so that PL can show it to the student.

Could we have students click a link from canvas to load into a notebook in class? How would their experience change?
- Use PL "Workspaces" as mentioned before, will use our custom Docker images so JupyterLab experience will be the same
- LTI support is in early beta (started development in Nov 2023) so its documentation is lacking for Canvas integration, may not have feature to have direct links
- Log in using CWL is mainly supported, they will see a list of assignments on their homepage

How would exams work?
- Can either create individual questions or spawn a JupyterLab session, individual questions may be more reliable and less taxing to hardware
- Individual autograded questions will need their own grading code
- Exam can have manually graded/autograded questions, autograded questions can have immediate feedback or not
- Start/close times are set through config file, can define which students are allowed to take an exam (Stu # if CWL / Canvas ID if LTI)
- Can have different access rules for certain students (e.g. CFA extra time, different start/close times)
- If accidentally closed, students can reopen and continue

How would assignments work?
- Probably have to move manually graded questions out of notebook if using Workspaces (TAs can't use nbgrader UI anymore)
- Autograding done with custom grading scripts
- Manual grading done through PrairieLearn UI
- Late reg extensions will have to be done in PrairieLearn (pull reg dates from Canvas and then input to PrairieLearn?)
- Total size of returned feedback cannot exceed 1MB in size e.g. plots
- If using CWL log in, grade upload is done with CSV at end of term. Supposedly LTI automatic grade upload to Canvas is possible but in early beta. Also applies to exams.
10:14
10:14
Can we control software environment with docker like we do now? 
- Can specify custom docker image to use in Workspace and grading scripts

Is it possible to use R or just python?
They have R (https://github.com/PrairieLearn/pl-r-helpers) and python autograders and support for custom docker images in Workspaces![image](https://github.com/briank-git/dsci100-pl-demo-course/assets/59274601/ebd707b9-ba0a-406e-bb6e-ced0bd541d72)
