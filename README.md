# PrairieLearn Overview

[PrairieLearn documentation](https://prairielearn.readthedocs.io/en/latest/)

## Q & A

Could we still do jupyter notebooks? How hard would it be to rewrite test code?
- PL "Workspaces" (Docker containers) can run JupyterLab with notebooks 
- Can choose which files e.g. notebooks are pulled from the Workspace for grading
- If using Workspaces, will need to write custom grading scripts. Possibly just run nbgrader on collected notebook like we do already, will need to configure nbgrader and format grade information/feedback after it runs so that PL can show it to the student.

Could we have students click a link from canvas to load into a notebook in class? How would their experience change?
- Use PL "Workspaces" as mentioned before, will use our custom Docker images so JupyterLab experience will be the same
- LTI support is in early beta (started development in Nov 2023) so its documentation is lacking for Canvas integration, may not have feature to have direct links
- Log in using CWL is mainly supported, they will choose from a list of assignments on their homepage

How would exams work?
- Can either create individual questions or spawn a JupyterLab session, individual questions are probably more reliable and less taxing to hardware during an exam
- If using individual questions, can have them be randomized using parameters
- Individual autograded questions will need their own grading code that use PL's R or python autograders
- Individual questions are created in a single directory, create exams by pulling from this question pool
- Exam can have manually graded/autograded questions, autograded questions can have immediate feedback or not
- Start/close times are set through config file, can define which students are allowed to take an exam (Stu # if CWL / Canvas ID if LTI)
- Can have different access rules for certain students (e.g. CFA extra time, different start/close times)
- If accidentally closed, students can reopen and continue
- Can configure so that feedback and grade is hidden after exam

Can an exam be run with LockDown browser? How will proctoring work?
- LockdownBrowser offically only supports Canvas Quizzes
- A workaround is to create a Canvas quiz with a question link that redirects a student's LockdownBrowser to PrairieLearn. Would need to allow LockdownBrowser to [access external web domains](https://support.respondus.com/hc/en-us/articles/4409604275867-Accessing-external-web-domains-in-LockDown-Browser).
	- This method does not appear to be a recommended use case _"Please be aware that instructors should not try to specify the domain of the LMS or a domain for another learning management system. Specifying the domain of the LMS itself or permitting a student to log in to one LMS, then access a second LMS to take an exam, will result in errors and is unsupported."_
	- Appears to be for use with e-books and other single page resources
	- Would need to test if LockdownBrowser allows PL to function properly
- Some MDS courses use CBTF (Computer Based Testing Facilities) which restrict students to certain domains, students also scan their UBC cards for access. [Example](https://ubc-mds.github.io/resources_pages/quiz/)
	- Space is limited to two rooms under the CS building. Not enough space for DSCI 100.

How would assignments work?
- Likely have to move manually graded questions out of notebook into their own individual questions if using Workspaces (TAs can't use nbgrader UI anymore)
- Autograding done with custom grading scripts
- Manual grading done through PrairieLearn UI
- Late reg extensions will have to be done in PrairieLearn (pull reg dates from Canvas and then input to PrairieLearn?)
- Total size of returned feedback cannot exceed 1MB in size e.g. plots (some feedback files ~50MB in size)
- If using CWL log in, grade upload is done with CSV at end of term. Supposedly LTI automatic grade upload to Canvas is possible but in early beta. Also applies to exams.

Can we control software environment with docker like we do now? 
- Can specify custom docker image to use in Workspace and in grading scripts

Is it possible to use R or just python?
- PL has R (https://github.com/PrairieLearn/pl-r-helpers) and python autograders and also support for custom docker images in Workspaces

## Benefits:
- Eventual LTI 1.3 support allows for automatic uploading of grades to Canvas and direct links to assignments
	- Some useful LTI 1.3 config info from Jupyter LTIAuthenticator docs https://ltiauthenticator.readthedocs.io/en/latest/lti13/getting-started.html
- Can configure randomized question variants with parameters
- "Workspaces" (Docker containers) allow us to run custom Docker images with JupyterLab
- If self-hosted, will no longer need separate student and instructor servers, everyone logs into the same PrairieLearn instance
- PrairieLearn UI for basic admin, editing course materials, manual grading, to check student work, assignment progress, grading progress, etc.
- Runs off of a single GitHub repository (private)
- Provides exam functionality 
- Can build solution and rubric into manually graded questions for graders
- Instant feedback for autograded questions

## Potential Issues:
- LTI 1.3 support is in early beta, potential bugs and missing features (documentation is light, just started development Nov 2023) 
	- Currently CWL authentication is possible through Shibboleth? (SAML2), but no automatic grade upload, grade upload is done by CSV at end of term
- Integrating CWL login if self-hosted could be a [long process](https://confluence.it.ubc.ca/display/SH3E/Integration+Process+Steps)
- Rework automatic late reg extensions, need Canvas reg dates to update due dates in PL (probably needs a script)
- Complex course directory structure with multiple config files
- May have to split coding and manual grading questions if using Workspaces
- Feedback returned in PL limited to 1MB (some feedback files >50MB)
- Steeper learning curve for developing/troubleshooting assignments/questions (each question needs an info.json, question.html, server.py)
	- Need to learn [custom PL HTML elements](https://prairielearn.readthedocs.io/en/latest/elements/) for creating questions
- No exam anti-cheat 
- Documentation for self-hosting is light overall and no support is available