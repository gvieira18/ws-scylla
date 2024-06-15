from datetime import date

# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'ws-scylla'
copyright = f"{date.today().year}, Gabriel do Carmo Vieira"
author = 'Gabriel do Carmo Vieira'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'myst_parser',
    'sphinx_favicon',
    'sphinx_sitemap'
]
suppress_warnings = ["myst.header"]
templates_path = ['_templates']
exclude_patterns = []

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'pydata_sphinx_theme'
html_static_path = ['_static']
html_baseurl = 'https://gvieira18.github.io/ws-scylla/'
html_copy_source = False
html_show_sourcelink = False
html_theme_options = {
    'use_edit_page_button': True,
    'show_prev_next': False
}
html_context = {
    "default_mode": "dark",
    "github_user": "gvieira18",
    "github_repo": "ws-scylla",
    "github_version": "develop/docs/source/"
}
favicons = {
    "rel": "icon",
    "href": "images/favicon.svg",
    "type": "image/svg+xml"
}
html_extra_path = ['robots.txt']
sitemap_locales = [None]
sitemap_excludes = [
    "search/",
    "genindex/",
]
