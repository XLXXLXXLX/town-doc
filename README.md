0. if you've just cloned this repo, run `npm install` in `${project_root}/honkit`
1. run `npx honkit build . ..\output\public\` in `${project_root}/honkit`. 
    This will generate static files from the md files into `${project_root}/output`

2. run `git add --all && git commit -m "update" && git push -u hostinger master` in `${root}/output`. 
    This will push the generated files to the remote repository on the server. And then a git hook will automatically deploy the generated files to the expected location on the server.# town-doc
