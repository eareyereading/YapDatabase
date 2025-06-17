Pod::Spec.new do |s|
	s.name         = "YapDatabase"
	s.version      = "4.0"
	s.summary      = "A collection/key/value store built atop sqlite for iOS & Mac."
	s.homepage     = "https://github.com/yapstudios/YapDatabase"
	s.license      = 'MIT'

	s.author = {
		"Robbie Hanson" => "robbiehanson@deusty.com"
	}
	s.source = {
		:git => "https://github.com/yapstudios/YapDatabase.git",
		:tag => s.version.to_s
	}

	s.osx.deployment_target = '10.12'
	s.ios.deployment_target = '10.0'
	s.tvos.deployment_target = '10.0'
	s.watchos.deployment_target = '3.0'

	s.swift_version = '5.0'

	s.libraries = 'c++'

	# https://github.com/CocoaPods/CocoaPods/issues/9292
#	s.exclude_files = 'Docs/**/*.html'
#	s.resources = '!Docs/**/*'
#	s.resources = !'Docs/**/*'
#	s.resources = '!(Docs/**/*)'
#	s.resources = '[!D]*'
#	s.resources = '[!D]*/**/*'

	s.default_subspecs = 'Standard'

	# There are 2 primary flavors you can choose from:
	#
	# - "Standard" uses the builtin version of sqlite3
	# - "SQLCipher" uses a version of sqlite3 compiled with SQLCipher included
	#
	# If you want to encrypt your database, you should choose "SQLCipher".
	# For more information about setting up encryption, see the wiki article:
	# https://github.com/yapstudios/YapDatabase/wiki/Encryption
	#
	# Additionaly, you can choose between:
	#
	# - Objective-C with Swift extensions (the default)
	# - Objective-C only
	# 
	# Examples:
	# If you wanted to import ALL of YapDatabase:
	#
	# pod 'YapDatabase'                <- Uses Standard, including Swift extensions
	# pod 'YapDatabase/Standard-ObjC'  <- All of YapDatabase, excluding Swift extensions
	# pod 'YapDatbaase/SQLCipher'      <- All of YapDatabase, with SQLCipher & Swift extensions
	# pod 'YapDatbaase/SQLCipher-ObjC' <- All of YapDatabase, with SQLCipher, excluding Swift extensions
	#
	# In addition to this, you can optionally import ONLY the 'Core' of YapDatabase,
	# and then pick-and-choose which individual extensions you want.
	# This is helpful if you only use a few extensions,
	# of if you're concerned about app-size or additional imports.
	#
	# To do so, you just need to be more explicit in your Podfile:
	#
	# // pod 'YapDatabase/Standard'                     <- This would import EVERYTHING
	# pod 'YapDatabase/Standard/Core'                   <- Only the YapDatabase core
	# pod 'YapDatabase/Standard/Extensions/AutoView'    <- Just AutoView   (+dependencies= Core, View)
	# pod 'YapDatabase/Standard/Extensions/RTreeIndex'  <- Just RTreeIndex (+dependencies= Core)
	#
	# This works exactly the same way if you're using the SQLCipher flavor:
	# 
	# // pod 'YapDatabase/SQLCipher'                    <- This would import EVERYTHING
	# pod 'YapDatabase/SQLCipher/Core'                  <- Only the YapDatabase core
	# pod 'YapDatabase/SQLCipher/Extensions/AutoView'   <- Just AutoView   (+dependencies= Core, View)
	# pod 'YapDatabase/SQLCipher/Extensions/RTreeIndex' <- Just RTreeIndex (+dependencies= Core)
	#
	# Enjoy, and remember to check the wiki for more information / documentation:
	# https://github.com/yapstudios/YapDatabase/wiki

	####################################################################################################

	s.subspec 'Standard-ObjC' do |ss|
		ss.source_files = 'YapDatabase/Sources/YapDatabase/Core/**/*.{h,m,mm,c}', 'YapDatabase/Sources/YapDatabase/Extensions/**/*.{h,m,mm,c}', 'YapDatabase/Sources/YapDatabase/Utilities/**/*.{h,m,mm,c}', 'YapDatabase/Sources/YapDatabase/Internal/**/*.{h,m,mm,c}', 'YapDatabase/Sources/YapDatabase/privateInclude/*.h', 'YapDatabase/Sources/YapDatabase/include/*.h'
		ss.private_header_files = 'YapDatabase/Sources/YapDatabase/privateInclude/*.h'
		ss.library = 'sqlite3'
		ss.ios.framework   = 'SystemConfiguration'

	end # Standard

	s.subspec 'Standard' do |ss|
		ss.dependency 'YapDatabase/Standard-ObjC'

		ss.source_files = 'YapDatabase/Sources/YapDatabaseSwift/**/*.swift'
		ss.ios.framework   = 'SystemConfiguration'

	end # Standard

end
