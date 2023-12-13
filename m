Return-Path: <linux-leds+bounces-349-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D878108FE
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 05:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F6B1C20E59
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 04:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2BAC126;
	Wed, 13 Dec 2023 04:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTTAofCK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45472CE;
	Tue, 12 Dec 2023 20:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702440607; x=1733976607;
  h=date:from:to:cc:subject:message-id;
  bh=DySq/P2u34ETi6VtKGLzLebRvg7X37ashfOppXnocBA=;
  b=NTTAofCKj0jVBKakuywGPZBolePu65rRc3pLI1Ki10PmvISAOQb9pj5o
   TaveznAKQEsM7yrAiEuvmroWBLOxQ/pxgVmVCLf4LshvTeGHS5CCeLKAT
   wgRULHSdEokb9tE7Dd5cHo4+GsXzODRgS47ch7RVlseM8Q3NZzDGdPPSb
   TEHLXsBH51nrBq1LkwPpZ1Tlsj11tUr/pVPYJWgMi/cdb5lM2QL99+Qnp
   e8DHiBXcVp7005QK/Vm1rd1pxaRCG9rNAa/IeBVnMDwYlJgJrZZTCSBXA
   pJg93w9WR3fpoDaJTU3qhjz406k0KwdXnWh9MYL2bMB0jNxcLySDXDnBC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1766873"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1766873"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 20:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="947035443"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="947035443"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2023 20:10:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDGZM-000K3H-2z;
	Wed, 13 Dec 2023 04:10:00 +0000
Date: Wed, 13 Dec 2023 12:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 alsa-devel@alsa-project.org, linux-alpha@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-leds@vger.kernel.org,
 ntfs3@lists.linux.dev, patches@opensource.cirrus.com,
 sparclinux@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 abb240f7a2bd14567ab53e602db562bb683391e6
Message-ID: <202312131229.xRLy6uuw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: abb240f7a2bd14567ab53e602db562bb683391e6  Add linux-next specific files for 20231212

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202312121926.GC7OYtbZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312130153.eBbUNFQa-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- alpha-randconfig-r113-20231212
|   |-- arch-alpha-mm-fault.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|   |-- sound-soc-codecs-cs42l43.c:sparse:sparse:symbol-cs42l43_hp_ilimit_clear_work-was-not-declared.-Should-it-be-static
|   `-- sound-soc-codecs-cs42l43.c:sparse:sparse:symbol-cs42l43_hp_ilimit_work-was-not-declared.-Should-it-be-static
|-- arc-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-003-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-004-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-r133-20231212
|   |-- fs-ntfs3-ntfs.h:sparse:sparse:static-assertion-failed:sizeof(struct-ATTR_LIST_ENTRY)
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- arm64-randconfig-002-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- arm64-randconfig-003-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- arm64-randconfig-004-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-003-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-004-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-005-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-003-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-004-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-006-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-053-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-061-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-randconfig-062-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-randconfig-141-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- mips-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- mips-decstation_defconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- nios2-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-r051-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-randconfig-r131-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- parisc-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-tty-serial-8250_parisc.o
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- parisc-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- parisc-randconfig-002-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-tty-serial-8250_parisc.o
|-- parisc-randconfig-r132-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-r062-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-r112-20231212
|   |-- lib-raid6-altivec4.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-__preempt_count_sub(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-__preempt_count_sub(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-toplevel-unative_t
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc-randconfig-r123-20231212
|   |-- fs-ntfs3-ntfs.h:sparse:sparse:static-assertion-failed:sizeof(struct-ATTR_LIST_ENTRY)
|   |-- lib-raid6-altivec4.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-toplevel-unative_t
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc64-randconfig-001-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- riscv-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-s390-block-dasd_diag_mod.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-s390-block-dasd_eckd_mod.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-s390-block-dasd_fba_mod.o
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-defconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-randconfig-r121-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- sparc-allmodconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc-allnoconfig
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc-defconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc-randconfig-001-20231212
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   |-- (.init.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-symbol-leon_smp_cpu_startup-defined-in-.text-section-in-arch-sparc-kernel-trampoline_32.o
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc-randconfig-r122-20231212
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- sparc64-allmodconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc64-allyesconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc64-defconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc64-randconfig-001-20231212
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc64-randconfig-002-20231212
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-pagecv_flag-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-allnoconfig
|   `-- Warning:MAINTAINERS-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-display-panel-synaptics-r63353.yaml
|-- x86_64-buildonly-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-buildonly-randconfig-004-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- x86_64-buildonly-randconfig-005-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-012-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-014-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-071-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-072-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-075-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-102-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-161-20231212
|   |-- lib-zstd-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
`-- xtensa-randconfig-002-20231212
    |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
    `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
clang_recent_errors
|-- arm-defconfig
|   |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:at91_poweroff_probe-(section:.text)-at91_wakeup_status-(section:.init.text)
|   `-- WARNING:modpost:vmlinux:section-mismatch-in-reference:at91_shdwc_probe-(section:.text)-at91_wakeup_status-(section:.init.text)
|-- arm64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-randconfig-002-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-fs-exportfs-exportfs.o
|-- i386-allmodconfig
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-allyesconfig
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-011-20231212
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-014-20231212
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-015-20231212
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-016-20231212
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- powerpc-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-randconfig-121-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-randconfig-122-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
`-- x86_64-randconfig-123-20231212
    `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer

elapsed time: 1455m

configs tested: 178
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20231212   gcc  
arc                   randconfig-002-20231212   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                   randconfig-001-20231212   gcc  
arm                   randconfig-002-20231212   gcc  
arm                   randconfig-003-20231212   gcc  
arm                   randconfig-004-20231212   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231212   gcc  
arm64                 randconfig-002-20231212   gcc  
arm64                 randconfig-003-20231212   gcc  
arm64                 randconfig-004-20231212   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231212   gcc  
csky                  randconfig-002-20231212   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231212   clang
hexagon               randconfig-002-20231212   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231212   gcc  
i386         buildonly-randconfig-002-20231212   gcc  
i386         buildonly-randconfig-003-20231212   gcc  
i386         buildonly-randconfig-004-20231212   gcc  
i386         buildonly-randconfig-005-20231212   gcc  
i386         buildonly-randconfig-006-20231212   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231212   gcc  
i386                  randconfig-002-20231212   gcc  
i386                  randconfig-003-20231212   gcc  
i386                  randconfig-004-20231212   gcc  
i386                  randconfig-005-20231212   gcc  
i386                  randconfig-006-20231212   gcc  
i386                  randconfig-011-20231212   clang
i386                  randconfig-012-20231212   clang
i386                  randconfig-013-20231212   clang
i386                  randconfig-014-20231212   clang
i386                  randconfig-015-20231212   clang
i386                  randconfig-016-20231212   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231212   gcc  
loongarch             randconfig-002-20231212   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                         db1xxx_defconfig   gcc  
mips                     decstation_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231212   gcc  
nios2                 randconfig-002-20231212   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231212   gcc  
parisc                randconfig-002-20231212   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20231212   gcc  
powerpc               randconfig-002-20231212   gcc  
powerpc               randconfig-003-20231212   gcc  
powerpc64             randconfig-001-20231212   gcc  
powerpc64             randconfig-002-20231212   gcc  
powerpc64             randconfig-003-20231212   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231212   gcc  
riscv                 randconfig-002-20231212   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231212   clang
s390                  randconfig-002-20231212   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20231212   gcc  
sh                    randconfig-002-20231212   gcc  
sh                          rsk7269_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231212   gcc  
sparc64               randconfig-002-20231212   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231212   gcc  
um                    randconfig-002-20231212   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231212   gcc  
x86_64       buildonly-randconfig-002-20231212   gcc  
x86_64       buildonly-randconfig-003-20231212   gcc  
x86_64       buildonly-randconfig-004-20231212   gcc  
x86_64       buildonly-randconfig-005-20231212   gcc  
x86_64       buildonly-randconfig-006-20231212   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231212   clang
x86_64                randconfig-002-20231212   clang
x86_64                randconfig-003-20231212   clang
x86_64                randconfig-004-20231212   clang
x86_64                randconfig-005-20231212   clang
x86_64                randconfig-006-20231212   clang
x86_64                randconfig-011-20231212   gcc  
x86_64                randconfig-012-20231212   gcc  
x86_64                randconfig-013-20231212   gcc  
x86_64                randconfig-014-20231212   gcc  
x86_64                randconfig-015-20231212   gcc  
x86_64                randconfig-016-20231212   gcc  
x86_64                randconfig-071-20231212   gcc  
x86_64                randconfig-072-20231212   gcc  
x86_64                randconfig-073-20231212   gcc  
x86_64                randconfig-074-20231212   gcc  
x86_64                randconfig-075-20231212   gcc  
x86_64                randconfig-076-20231212   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20231212   gcc  
xtensa                randconfig-002-20231212   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

