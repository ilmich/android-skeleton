#!/bin/sh

CURRENT_DIR=`pwd`

echo "Generate .project"
PROJECT_NAME=`basename $CURRENT_DIR`
cat << EOF > .project
<?xml version="1.0" encoding="UTF-8"?>
<projectDescription>
	<name>$PROJECT_NAME</name>
	<comment></comment>
	<projects>
	</projects>
	<buildSpec>
		<buildCommand>
			<name>com.android.ide.eclipse.adt.ResourceManagerBuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
		<buildCommand>
			<name>com.android.ide.eclipse.adt.PreCompilerBuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
		<buildCommand>
			<name>com.android.ide.eclipse.adt.ApkBuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
	</buildSpec>
	<natures>
		<nature>com.android.ide.eclipse.adt.AndroidNature</nature>
		<nature>org.eclipse.jdt.core.javanature</nature>
	</natures>
</projectDescription>
EOF
echo "Generate .classpath"
cat << EOF > .classpath
<?xml version="1.0" encoding="UTF-8"?>
<classpath>
	<classpathentry kind="src" path="src"/>
	<classpathentry kind="con" path="com.android.ide.eclipse.adt.ANDROID_FRAMEWORK"/>
	<classpathentry exported="true" kind="con" path="com.android.ide.eclipse.adt.LIBRARIES"/>
	<classpathentry exported="true" kind="con" path="com.android.ide.eclipse.adt.DEPENDENCIES"/>
	<classpathentry kind="src" path="gen"/>
	<classpathentry kind="output" path="bin/classes"/>
</classpath>
EOF
echo "Generate project.properties"
cat << EOF > project.properties
target=android-25
EOF
echo "Create symlinks"
if [ ! -e src ]
then
    ln -s app/src/main/java src
fi
if [ ! -e res ]
then
    ln -s app/src/main/res res
fi
if [ ! -e AndroidManifest.xml ]
then
    ln -s app/src/main/AndroidManifest.xml AndroidManifest.xml
fi


