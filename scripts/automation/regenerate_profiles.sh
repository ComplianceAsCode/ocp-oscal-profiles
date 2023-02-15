for d in ./profiles/* ; do
    profile=$(basename "$d")
    if [ "$profile" != "ROKS_OCP4_TAILORED" ]; then
       echo "Regenerating ${profile}" 
       trestle author profile-generate --output md_profiles/$profile --name $profile
    else 
       echo "Skipping ${profile}"
    fi 
done
