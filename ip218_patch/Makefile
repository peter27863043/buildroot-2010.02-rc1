#
# Copyright (C) 2012 IC Plus Corp.
#
# This program is the confidential and proprietary property of IC Plus
# Corp. and the possession or use of this file requires a witten license
# from IC Plus Corp.
#
# Modified Date : 105.08.05 -001 - Du imgs
#
########################################################################################
## user setting
########################################################################################


	# this string is used to decide to use "O" or "J0" in build/ap/*/Makefile ...
	#	"internal"	: to be used inside RD team
	#	"external"	: to be used outside RD team
RELEASE_TYPE		=internal
#RELEASE_TYPE		=external

	# this string is shown when Linux is up
	# you can choose any string to identify that the boot code is build by your
RELEASE_TAG             =RELEASE_ES

UPLOAD_DIR		=/home/ip218_release/tftp

STEPS_USER_1		= ((rm -f log.K_incr log.F_ap_incr; make K_incr; grep "error:" log.K_incr || make F_ap_incr) && make user3)
STEPS_USER_2		= rm -f log.F_ap_incr; make F_ap_incr; make user3
STEPS_USER_3		= grep "error:" log.K_incr log.F_ap_incr; grep "warning:" log.K_incr log.F_ap_incr

# boot code starting from ram (1) or rom (0)
U_BOOT_FROM_RAM 	=0

# make with verbose info, 1=enable, 0=disable
K_VERBOSE		=1

# setting for UBOOT command (necessary)

# library selection (optional as "uclibc" or "glibc")
# library selection (optional as "uclibc" or "glibc")
F_LIBC			=uclibc

# compression for cpio (optional as "gzip" or "lzma")
F_CPIO_ZIP_METHOD	=gzip

# make with verbose info, 1=enable, 0=disable
F_BB_VERBOSE		=1

# copy only the .ko file (1) or full /lib/modules (0)
F_MODULES_ONLY_KO_FILE	=0

# inline update file (to update IP218_BUILD_INLINE_UPDATE__F_IPV6_ADDR IP218_BUILD_INLINE_UPDATE__F_IPV4_ADDR IP218_BUILD_INLINE_UPDATE__F_MAC_ADDR)
F_INLINE_UPDATE_FILE_LIST	=initramfs/etc/init.d/rcS ap/s_db/src/extension_for_demo/s_db_ext.h

#######################################################################
## RAM / FLASH address
#######################################################################

ifeq (,)

#kernel load address, must same with setting in \linux\arch\mips\icplus\Platform
K_LOAD_ADDRESS		?=80370000

## size/offset of flash segments, in unit of byte and in hex format without leading "0x"

	# UBOOT
F_BURN_UBOOT_OFFSET	?=0
F_BURN_UBOOT_SIZE	?=30000
	# UBOOT env
F_BURN_UE_OFFSET	?=30000
F_BURN_UE_SIZE		?=10000
	# ExtraH image
F_BURN_E_OFFSET		?=40000
F_BURN_E_SIZE		?=10000
	# initramfs
F_BURN_F_OFFSET		?=50000
F_BURN_F_SIZE		?=400000
	# kernel image
F_BURN_K_OFFSET		?=450000
F_BURN_K_SIZE		?=200000
	# kernel size + initramfs size + ExtraH size
F_BURN_EKF_SIZE		?=610000
	# J0 - no used from 105.01.28
F_BURN_J0_OFFSET	?=650000
F_BURN_J0_SIZE		?=50000
	# F0 : FREE SPACE => start= F_BURN_E_OFFSET+F_BURN_EKF_SIZE, size=1~N MB
F_BURN_F0_OFFSET	?=650000
F_BURN_F0_SIZE		?=160000
	# J1
F_BURN_J1_OFFSET	?=7b0000
F_BURN_J1_SIZE		?=50000
	# FWUP ADDR
F_BURN_FWUP_OFFSET	?=800000
	# FWUP IMG SIZE => F_BURN_EKF_SIZE+F_BURN_F0_SIZE
F_BURN_IMG_SIZE		?=770000

	# CRS INFO
F_BURN_CRS_OFFSET	?=fe0000
F_BURN_CRS_SIZE		?=10000

F_JFFS2_MIN_SIZE	?=50000
F_IMAGE_MIN_SIZE	?=10000


## Tftp to DRAM address

	# ramFs entry, as possible from lower address
	# if this changed, uboot's configs/helios.h must be modified too
F_UBOOT_RAM_F_ENTRY	?=80002000

	# kernel entry = K_LOAD_ADDRESS + kernel size (ref System.map)
	# if this changed, uboot's configs/helios.h must be modified too
F_UBOOT_RAM_K_ENTRY	?=80800000

endif

#######################################################################
## first make goal
#######################################################################

.PHONY: help
help:

#######################################################################
## developer user-defined MAC/IP address
##
## step 1 (default IP 148) : use "make K_defc F_defc" to full-compile
## step 2 (default IP 148) : use "make 148" or "make user1" to incr-compile
## step 2 (another IP 60)  : use "make 60" to incr-compile
#######################################################################

ADDR_SEL_LIST	=148 60

.PHONY: $(ADDR_SEL_LIST)
$(ADDR_SEL_LIST):
	make user1 ADDR_SEL=$@

ADDR_SEL		?=148

ifeq ($(ADDR_SEL),148)
F_MAC_ADDR		=66:09:08:11:12:87
F_MAC_ADDR_L4B		=0x08111287
F_MAC_ADDR_H2B		=0x6609
F_IPV4_ADDR		=192.168.2.1
F_IPV6_ADDR		=
endif

ifeq ($(ADDR_SEL),60)
F_MAC_ADDR		=66:29:87:13:74:89
F_MAC_ADDR_L4B		=0x87137489
F_MAC_ADDR_H2B		=0x6609
F_IPV4_ADDR		=192.168.170.60
F_IPV6_ADDR		=
endif

#######################################################################
## include (this must be the lastest one)
#######################################################################

-include svn.subMake/Makefile.major

