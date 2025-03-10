deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

DISABLE_SECURE_BOOT = 'Make sure Secure Boot is disabled in BIOS.'
SURFACE_GO_FLASH = '''
	Press and hold the Volume Down button and press the Power button. Release the Power button but keep pressing the Volume Down button until the windows logo disappears.
'''

SURFACE_GO_POWERON = 'Press the Power button.'

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	SURFACE_GO_POWERON
]

module.exports =
	version: 1
	slug: 'surface-go'
	name: 'Microsoft Surface Go'
	arch: 'amd64'
	state: 'new'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_USB
		instructions.EJECT_USB
		instructions.FLASHER_WARNING
		DISABLE_SECURE_BOOT
		SURFACE_GO_FLASH
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/intel-nuc/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/intel-nuc/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/intel-nuc/nodejs/'

	yocto:
		machine: 'surface-go'
		image: 'balena-image-flasher'
		fstype: 'balenaos-img'
		version: 'yocto-dunfell'
		deployArtifact: 'balena-image-flasher-surface-go.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	options: [ networkOptions.group ]

	initialization: commonImg.initialization
