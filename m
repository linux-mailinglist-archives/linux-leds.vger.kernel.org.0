Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092ED1C48DD
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 23:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgEDVSt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 17:18:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:20056 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726291AbgEDVSt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 4 May 2020 17:18:49 -0400
IronPort-SDR: Wt8WZn5408eWAAqiEkLELxSrHt8BoYkGheIG7BWO96vsE3GTK2s5X53wJzPZgvvh+6NA4wxEjR
 kyYeApbrh3dw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 14:18:48 -0700
IronPort-SDR: sYeQx0a0gQVBS/v9cdNBZ0JhFJqfWuG0tO2fVanG8W0o6eY5lRQU+L52s4hrAx0hbjt0nDPPTe
 nGrPPRDdSj5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,353,1583222400"; 
   d="scan'208";a="304291629"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 May 2020 14:18:46 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jViUA-000HuC-8G; Tue, 05 May 2020 05:18:46 +0800
Date:   Tue, 5 May 2020 05:18:28 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     kbuild-all@lists.01.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v24 02/16] leds: multicolor: Introduce a multicolor class
 definition
Message-ID: <202005050509.ulcDbkZ2%lkp@intel.com>
References: <20200503123215.6449-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200503123215.6449-3-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

I love your patch! Yet something to improve:

[auto build test ERROR on pavel-linux-leds/for-next]
[also build test ERROR on robh/for-next linus/master j.anaszewski-leds/for-next v5.7-rc4 next-20200504]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v24/20200505-031241
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: parisc-allnoconfig
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=parisc  allnoconfig
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/leds/Kconfig:33:error: recursive dependency detected!
>> drivers/leds/Kconfig:33: symbol LEDS_CLASS_MULTI_COLOR depends on LEDS_CLASS_MULTI_COLOR
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

vim +33 drivers/leds/Kconfig

    16	
    17	config LEDS_CLASS
    18		tristate "LED Class Support"
    19		help
    20		  This option enables the LED sysfs class in /sys/class/leds.  You'll
    21		  need this to do anything useful with LEDs.  If unsure, say N.
    22	
    23	config LEDS_CLASS_FLASH
    24		tristate "LED Flash Class Support"
    25		depends on LEDS_CLASS
    26		help
    27		  This option enables the flash LED sysfs class in /sys/class/leds.
    28		  It wraps LED Class and adds flash LEDs specific sysfs attributes
    29		  and kernel internal API to it. You'll need this to provide support
    30		  for the flash related features of a LED device. It can be built
    31		  as a module.
    32	
  > 33	config LEDS_CLASS_MULTI_COLOR
    34		tristate "LED MultiColor LED Class Support"
    35		depends on LEDS_CLASS
    36		depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
    37		help
    38		  This option enables the multicolor LED sysfs class in /sys/class/leds.
    39		  It wraps LED class and adds multicolor LED specific sysfs attributes
    40		  and kernel internal API to it. You'll need this to provide support
    41		  for multicolor LEDs that are grouped together. This class is not
    42		  intended for single color LEDs. It can be built as a module.
    43	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
