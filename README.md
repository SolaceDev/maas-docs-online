# maas-docs-online
Solace Cloud Public Documentations


## To Get Build the docs

You must have Python 2.7 and Virtual Env install on your machine

*  Go to docs directory and run the following:

`$ cd docs`

`$ virtualenv _venv`

`$ source ./_venv/bin/activate`

* Install Python dependencies

`$ pip install -r docs/requirements.txt`

* Generate the docs

`$ make html`

`$ open ./_build/html/index.html` 

* Ror Auto load, go to docs and:

`$ sphinx-autobuild . ./_build/html`
