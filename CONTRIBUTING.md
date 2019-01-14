# How to contribute to a Solace Project

We'd love for you to contribute and welcome your help. Here are some guidelines to follow and tips to get you started.


- [Getting Started](#getting_started)
- [Did you find an issue ?](#issue)
- [Submitting a fix](#submitting)
- [Feature Requests](#features)
- [Questions](#questions) 


## <a name="getting_started"> </a> Getting Started 
Solace Cloud Learn Site is based on [Sphinx](https://www.sphinx-doc.org/en/master/), the Python documentation generator. To get started and test your local changes, before submitting any pull requests, follow the instructions below:

#### Step 1: Install Python 2.7 on your machine
If you're using Mac, follow these [Install Python 2 on your Mac](https://docs.python-guide.org/starting/install/osx/)

#### Step 2: Install VirtualEnv
If you're using Mac, follow these [Install Virtual Environment on your maMacc](https://docs.python-guide.org/dev/virtualenvs/#virtualenvironments-ref)

#### Step 3: After cloning this repo or a fork of this repo (see [Submitting a fix](#submitting)), create a pyhon virtual environment and install the needed dependencies

`$ cd docs`

`$ virtualenv _venv && source ./_venv/bin/activate && pip install -r ./requirements.txt`

#### Step 4: Make your modification and generate the docs, that should take less than 5 seconds

`$ rm -rf _build && make html`

`$ open ./_build/html/index.html` 

You will see your changes in new browser window or tab. Note that the top menu links will not be functioning when built and deployed locally.

For Auto load (to avoid re-generating docs everytime you edit the source):

`$ sphinx-autobuild . ./_build/html`

Note that this method only works for minor edits in existing markdown files.

## <a name="issue"></a> Did you find an issue?

* **Ensure the bug was not already reported** by searching on GitHub under [Issues](https://github.com/SolaceDev/maas-docs-online/issues).

* If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/SolaceDev/maas-docs-online/issues/new). Be sure to include a **title and clear description**, as much relevant information as possible, and a **code sample** or an **executable test case** demonstrating the expected behavior that is not occurring.

## <a name="submitting"></a> Did you write a patch that fixes a bug?

Open a new GitHub pull request with the patch following the steps outlined below. Ensure the PR description clearly describes the problem and solution. Include the relevant issue number if applicable.

Before you submit your pull request consider the following guidelines:

* Search [GitHub](https://github.com/SolaceDev/maas-docs-online) for an open or closed Pull Request
  that relates to your submission. You don't want to duplicate effort.

### Submitting a Pull Request

Please follow these steps for all pull requests. These steps are derived from the [GitHub flow](https://help.github.com/articles/github-flow/).

#### Step 1: Fork

Fork the project [on GitHub](https://github.com/SolaceDev/maas-docs-online) and clone your fork
locally.

```sh
git clone https://github.com/<my-github-repo>/maas-docs-online
```

#### Step 2: Branch

Make your changes on a new git branch in your fork of the repository.

```sh
git checkout -b my-fix-branch master
```

#### Step 3: Commit

Commit your changes using a descriptive commit message.

```sh
git commit -a -m "Your Commit Message"
```

Note: the optional commit `-a` command line option will automatically "add" and "rm" edited files.

#### Step 4: Rebase (if possible) 

Assuming you have not yet pushed your branch to origin, use `git rebase` (not `git merge`) to synchronize your work with the main
repository.

```sh
git fetch upstream
git rebase master
```

If you have not set the upstream, do so as follows:

```sh
git remote add upstream https://github.com/SolaceDev/maas-docs-online
```

If you have already pushed your fork, then do not rebase. Instead merge any changes from master that are not already part of your branch.

#### Step 5: Push

Push your branch to your fork in GitHub:

```sh
git push origin my-fix-branch
```

#### Step 6: Pull Request

In GitHub, send a pull request to `maas-docs-online:master`. 

When fixing an existing issue, use the [commit message keywords](https://help.github.com/articles/closing-issues-via-commit-messages/) to close the associated GitHub issue.

* If we suggest changes then:
  * Make the required updates.
  * Commit these changes to your branch (ex: my-fix-branch)

That's it! Thank you for your contribution!

## <a name="features"></a> **Do you have an ideas for a new feature or a change to an existing one?**

* Open a GitHub [enhancement request issue](https://github.com/SolaceDev/maas-docs-online/issues/new) and describe the new functionality.

##  <a name="questions"></a> Do you have questions about the source code?

* Ask any question about the code or how to use Solace messaging in the [Solace community](http://dev.solace.com/community/).
