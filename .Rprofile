cat("LIBPATHS = ", .libPaths(), "\n")
cat("R.home() = ", R.home(), "\n")
cat("pwd = ", getwd(), "\n")

# set the GITHUB credentials for devtools
Sys.setenv(GITHUB_PAT = system("/opt/homebrew/bin/gh auth token", intern = TRUE))

# set path to homebrew for pandoc et al.
Sys.setenv(PATH = paste("/opt/homebrew/bin", Sys.getenv("PATH"), sep = ":"))

# if (interactive() && Sys.getenv("RSTUDIO") == "") {
#   source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))
# }

## https://kevinushey.github.io/blog/2015/02/02/rprofile-essentials/
options(useFancyQuotes = FALSE)


# autofill package names
utils::rc.settings(ipck = TRUE)

# reduce default size of print to 100 lines
options(max.print = 100)


# warn on partial matches [ ] re-enable if auto_test still stops on errors
options(
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchArgs = TRUE
)

## https://www.r-bloggers.com/fun-with-rprofile-and-customizing-r-startup/

# increase width of prompt if waiting for closing parenthesis
options(prompt = "> ")
options(continue = "... ")
options(assign = "<-")




options(
  # consol width
  width = 140,
  # # scientific notation -----
  # "scipen" = 100L,
  # #"digits" = 4L,

  # install packages faster -----
  Ncpus = 8L,

  # usethis setup -----
  usethis.name = "Harry Eslick",
  usethis.description = list(
    `Authors@R` = paste0('person("Harry", "Eslick",
                     email = "', Sys.getenv("EMAIL"), '",
                     role = c("aut", "cre"))'),
    License = "MIT + file LICENSE",
    Version = "0.0.0.9000"
  )
)

if (interactive()) {
  require(usethis, quietly = TRUE)

  if (!requireNamespace("colorout", quietly=TRUE)) {
    cat("Install [colorout] for pretty terminal output. \n")
    cat(" > install_github('jalvesaq/colorout')")
    } else {
      if (Sys.getenv("RADIAN_VERSION") == ""){
        # Terminal colours ----------------------------------------
        require(colorout)

        colorout::setOutputColors()
        # colorout::setOutputColors(

        #   index    = '\x1b[38;2;76;86;106m',
        #   normal   = '\x1b[38;2;216;222;233m',

        #   number   = '\x1b[38;2;236;239;244m',
        #   negnum   = '\x1b[38;2;180;142;173m',
        #   zero     = '\x1b[38;2;136;192;208m', zero.limit = 0.01,
        #   infinite = '\x1b[38;2;236;239;244m',

        #   string   = '\x1b[38;2;235;203;139m',
        #   date     = '\x1b[38;2;236;239;244m',
        #   const    = '\x1b[38;2;136;192;208m',

        #   true     = '\x1b[38;2;163;190;140m',
        #   false    = '\x1b[38;2;191;97;106m',

        #   warn     = '\x1b[38;2;235;203;139m',
        #   stderror = '\x1b[38;2;191;97;106m', error = '\x1b[38;2;191;97;106m',

        #   verbose  = FALSE
        # )

        # Custom patterns --------------------------------

        # NOTE Do not copy all. Pick what you use/like.

        # _ {data.table} ---------------------------------
        #

        colorout::addPattern('[+]*:',  '\x1b[38;2;143;188;187m')  # Row num
        colorout::addPattern('[0-9]*:',  '\x1b[38;2;143;188;187m')  # Row num
        colorout::addPattern('---',      '\x1b[38;2;76;86;106m')  # Row splitter
        colorout::addPattern('<[a-z]*>', '\x1b[38;2;143;188;187m')  # Col class

        # _ `str` ----------------------------------------

        # Class
        colorout::addPattern(' num ',        '\x1b[38;2;143;188;187m')
        colorout::addPattern(' int ',        '\x1b[38;2;143;188;187m')
        colorout::addPattern(' chr ',        '\x1b[38;2;143;188;187m')
        colorout::addPattern(' Factor ',     '\x1b[38;2;143;188;187m')
        colorout::addPattern(' Ord.factor ', '\x1b[38;2;143;188;187m')
        colorout::addPattern(' logi ',       '\x1b[38;2;143;188;187m')
        colorout::addPattern('function ',    '\x1b[38;2;143;188;187m')
        colorout::addPattern(' dbl ',        '\x1b[38;2;143;188;187m')
        colorout::addPattern(' lgcl ',       '\x1b[38;2;143;188;187m')
        colorout::addPattern(' cplx ',       '\x1b[38;2;143;188;187m')
        # Misc
        colorout::addPattern('$ ',           '\x1b[38;2;76;86;106m')

        # _ `str`, {mlr3} --------------------------------

        # R6 field name
        colorout::addPattern('* [A-z]*:',                      '\x1b[38;2;235;203;139m')
        colorout::addPattern("* [A-z]* [A-z]*:",               '\x1b[38;2;235;203;139m')
        colorout::addPattern("* [A-z]* [A-z]* [A-z]*:",        '\x1b[38;2;235;203;139m')
        colorout::addPattern("* [A-z]* [A-z]* [A-z]* [A-z]*:", '\x1b[38;2;235;203;139m')
    }
    }
}
