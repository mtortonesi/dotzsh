# Try to get perl5 working
if [ -d ~/perl5 ]
then
  eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
fi
