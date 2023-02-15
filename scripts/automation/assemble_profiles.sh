version_tag=$1
for d in ./profiles/* ; do
    profile=$(basename "$d")
    if [ "$profile" != "ROKS_OCP4_TAILORED" ]; then
       echo "Assembling ${profile}" 
       if [ "$1" != "" ]; then 
          trestle author profile-assemble --markdown md_profiles/$profile --output $profile --set-parameters --version $version_tag 
       else
          trestle author profile-assemble --markdown md_profiles/$profile --output $profile --set-parameters
       fi
    else 
       echo "Skipping ${profile}"
    fi 
done
