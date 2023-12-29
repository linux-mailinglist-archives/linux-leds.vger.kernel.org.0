Return-Path: <linux-leds+bounces-505-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0A81FE4F
	for <lists+linux-leds@lfdr.de>; Fri, 29 Dec 2023 09:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FB291F22E4F
	for <lists+linux-leds@lfdr.de>; Fri, 29 Dec 2023 08:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF1D10A1C;
	Fri, 29 Dec 2023 08:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKtKndqA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107010A1B;
	Fri, 29 Dec 2023 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703840024; x=1735376024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rjYo9oP6i1bR7sOWzCgxdIBIM7V7qc09Qiqt4MFB4A=;
  b=JKtKndqAkEq6TNkO6nuAy3DxIu9M5vKuw4XV4tkRglSyRnkq0o6iKL3j
   tu0clEP7NUibDzD99zhUeV6R/xil0gzaMOFwzeCrQwF3tDkVKjvgWJCkH
   pjKVw23stfVMPZNZJ995tA/uYx6KutNWHTAmpWxBj42LD7KT1QwNplaCG
   S7ye313nPspr86GgaRiclQeL2akrvmA8zKNMJ0Ux6sxUvdKKXp7JIt4OY
   QMUCJ84/Z3gOVyJnvx/QIIS1XL5AwgnuqMSh+rtvgTkOTj1lyhHFtpRR+
   IzybfM3TGLzinGgzpxEh7jg+jueKLMZaj5R0j+ZnvN/Y7A1RzT9TGRQw9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="396359565"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="396359565"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 00:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="778768885"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="778768885"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Dec 2023 00:53:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ8cR-000HFn-1t;
	Fri, 29 Dec 2023 08:53:27 +0000
Date: Fri, 29 Dec 2023 16:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: "larry.lai" <larry.lai@yunjingtech.com>, lee@kernel.org,
	andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
	pavel@ucw.cz, krzk@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-leds@vger.kernel.org, GaryWang@aaeon.com.tw,
	musa.lin@yunjingtech.com, jack.chang@yunjingtech.com,
	noah.hung@yunjingtech.com, "larry.lai" <larry.lai@yunjingtech.com>
Subject: Re: [PATCH V8 2/3] pinctrl: Add support pin control for UP board
 CPLD/FPGA
Message-ID: <202312291646.wfn6dxdH-lkp@intel.com>
References: <20231228151544.14408-3-larry.lai@yunjingtech.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228151544.14408-3-larry.lai@yunjingtech.com>

Hi larry.lai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4fe89d07dcc2804c8b562f6c7896a45643d34b2f]

url:    https://github.com/intel-lab-lkp/linux/commits/larry-lai/mfd-Add-support-for-UP-board-CPLD-FPGA/20231228-231750
base:   4fe89d07dcc2804c8b562f6c7896a45643d34b2f
patch link:    https://lore.kernel.org/r/20231228151544.14408-3-larry.lai%40yunjingtech.com
patch subject: [PATCH V8 2/3] pinctrl: Add support pin control for UP board CPLD/FPGA
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231229/202312291646.wfn6dxdH-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312291646.wfn6dxdH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312291646.wfn6dxdH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-upboard.c:709:13: warning: variable length array used [-Wvla]
     709 |         int offset[pctrl->pctldesc->npins];
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:1089:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1089 |                 .ident = BOARD_UP_APL01,
         |                          ^~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:46:27: note: expanded from macro 'BOARD_UP_APL01'
      46 | #define BOARD_UP_APL01                          1
         |                                                 ^
   drivers/pinctrl/pinctrl-upboard.c:1096:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1096 |                 .ident = BOARD_UP_APL01,
         |                          ^~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:46:27: note: expanded from macro 'BOARD_UP_APL01'
      46 | #define BOARD_UP_APL01                          1
         |                                                 ^
   drivers/pinctrl/pinctrl-upboard.c:1103:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1103 |                 .ident = BOARD_UP_APL03,
         |                          ^~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:53:27: note: expanded from macro 'BOARD_UP_APL03'
      53 | #define BOARD_UP_APL03                          9
         |                                                 ^
   drivers/pinctrl/pinctrl-upboard.c:1110:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1110 |                 .ident = BOARD_UP_WHL01,
         |                          ^~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:50:27: note: expanded from macro 'BOARD_UP_WHL01'
      50 | #define BOARD_UP_WHL01                          5
         |                                                 ^
   drivers/pinctrl/pinctrl-upboard.c:1117:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1117 |                 .ident = BOARD_UPX_TGL,
         |                          ^~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:55:26: note: expanded from macro 'BOARD_UPX_TGL'
      55 | #define BOARD_UPX_TGL                           11
         |                                                 ^~
   drivers/pinctrl/pinctrl-upboard.c:1124:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1124 |                 .ident = BOARD_UPN_EHL01,
         |                          ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:57:28: note: expanded from macro 'BOARD_UPN_EHL01'
      57 | #define BOARD_UPN_EHL01                         13
         |                                                 ^~
   drivers/pinctrl/pinctrl-upboard.c:1131:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1131 |                 .ident = BOARD_UPS_EHL01,
         |                          ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:58:28: note: expanded from macro 'BOARD_UPS_EHL01'
      58 | #define BOARD_UPS_EHL01                         BOARD_UPN_EHL01
         |                                                 ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:57:28: note: expanded from macro 'BOARD_UPN_EHL01'
      57 | #define BOARD_UPN_EHL01                         13
         |                                                 ^~
   drivers/pinctrl/pinctrl-upboard.c:1138:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1138 |                 .ident = BOARD_UPX_ADLP01,
         |                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:59:28: note: expanded from macro 'BOARD_UPX_ADLP01'
      59 | #define BOARD_UPX_ADLP01                        15
         |                                                 ^~
   drivers/pinctrl/pinctrl-upboard.c:1145:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1145 |                 .ident = BOARD_UPN_ADLN01,
         |                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:60:28: note: expanded from macro 'BOARD_UPN_ADLN01'
      60 | #define BOARD_UPN_ADLN01                        16
         |                                                 ^~
   drivers/pinctrl/pinctrl-upboard.c:1152:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1152 |                 .ident = BOARD_UPS_ADLP01,
         |                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:61:28: note: expanded from macro 'BOARD_UPS_ADLP01'
      61 | #define BOARD_UPS_ADLP01                        BOARD_UPX_ADLP01
         |                                                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:59:28: note: expanded from macro 'BOARD_UPX_ADLP01'
      59 | #define BOARD_UPX_ADLP01                        15
         |                                                 ^~
   drivers/pinctrl/pinctrl-upboard.c:1159:12: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
    1159 |                 .ident = BOARD_UP_ADLN01,
         |                          ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-upboard.c:62:28: note: expanded from macro 'BOARD_UP_ADLN01'
      62 | #define BOARD_UP_ADLN01                         18
         |                                                 ^~
   drivers/pinctrl/pinctrl-upboard.c:1185:12: error: incompatible pointer to integer conversion assigning to 'int' from 'const char *const' [-Wint-conversion]
    1185 |                 board_id = system_id->ident;
         |                          ^ ~~~~~~~~~~~~~~~~
   1 warning and 12 errors generated.


vim +709 drivers/pinctrl/pinctrl-upboard.c

   705	
   706	static void upboard_alt_func_enable(struct gpio_chip *gc, const char *name, int id)
   707	{
   708		struct upboard_pinctrl *pctrl = container_of(gc, struct upboard_pinctrl, chip);
 > 709		int offset[pctrl->pctldesc->npins];
   710		int i, cnt;
   711		bool input;
   712		int mode;
   713		unsigned int val;
   714	
   715		/* find all pins */
   716		for (i = 0, cnt = 0; i < pctrl->pctldesc->npins; i++) {
   717			if (strstr(pctrl->pctldesc->pins[i].name, name))
   718				offset[cnt++] = i;
   719		}
   720	
   721		/* change to alternate function */
   722		for (i = 0; i < cnt; i++) {
   723			if (pctrl->pins[offset[i]].regs == NULL)
   724				continue;
   725			input = false;
   726			mode = 0; /* default GPIO */
   727			val = readl(pctrl->pins[offset[i]].regs);
   728	
   729			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "I2C") ||
   730			    strstr(pctrl->pctldesc->pins[offset[i]].name, "PINMUX")) {
   731				mode = 1;
   732				switch (id) {
   733				case BOARD_UPN_ADLN01:
   734				case BOARD_UPX_ADLP01:
   735					mode = 2;
   736					break;
   737				default:
   738					break;
   739				}
   740	
   741				val |= mode<<PADCFG0_PMODE_SHIFT;
   742				writel(val, pctrl->pins[offset[i]].regs);
   743				upboard_fpga_request_free(pctrl->pctldev, offset[i]);
   744				continue;
   745			}
   746	
   747			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "UART")) {
   748				mode = 1;
   749				switch (id) {
   750				case BOARD_UPN_EHL01:
   751					mode = 4;
   752					break;
   753				case BOARD_UP_ADLN01:
   754				case BOARD_UPN_ADLN01:
   755				case BOARD_UPX_ADLP01:
   756					mode = 2;
   757					break;
   758				default:
   759					break;
   760				}
   761			}
   762	
   763			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "SPI")) {
   764				mode = 1;
   765				switch (id) {
   766				case BOARD_UP_WHL01:
   767					mode = 3;
   768					break;
   769				case BOARD_UP_ADLN01:
   770				case BOARD_UPN_ADLN01:
   771				case BOARD_UPX_ADLP01:
   772					mode = 7;
   773					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "MOSI")) {
   774						val &= ~PADCFG0_GPIOTXDIS;
   775						val |= PADCFG0_GPIORXDIS;
   776					}
   777	
   778					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "MISO"))
   779						val |= PADCFG0_GPIORXDIS;
   780	
   781					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "CLK")) {
   782						val &= ~PADCFG0_GPIOTXDIS;
   783						val |= PADCFG0_GPIORXDIS;
   784					}
   785					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "CS0"))
   786						val |= PADCFG0_GPIORXDIS;
   787	
   788					if (strstr(pctrl->pctldesc->pins[offset[i]].name, "CS1"))
   789						continue;
   790					break;
   791				default:
   792					break;
   793				}
   794			}
   795	
   796			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "I2S")) {
   797				mode = 1;
   798				switch (id) {
   799				case BOARD_UPX_ADLP01:
   800					mode = 4;
   801					break;
   802				default:
   803					break;
   804				}
   805			}
   806	
   807			val |= mode<<PADCFG0_PMODE_SHIFT;
   808			writel(val, pctrl->pins[offset[i]].regs);
   809	
   810			/* input pins */
   811			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "RX"))
   812				input = true;
   813	
   814			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "CTS"))
   815				input = true;
   816	
   817			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "ADC")) {
   818				input = true;
   819				if (id == BOARD_UP_APL01)
   820					upboard_fpga_request_enable(pctrl->pctldev, NULL, offset[i]);
   821				else
   822					upboard_fpga_request_free(pctrl->pctldev, offset[i]);
   823			}
   824	
   825			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "MISO"))
   826				input = true;
   827	
   828			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "DIN"))
   829				input = true;
   830	
   831			if (strstr(pctrl->pctldesc->pins[offset[i]].name, "SDI"))
   832				input = true;
   833	
   834			upboard_fpga_set_direction(pctrl->pctldev, NULL, offset[i], input);
   835		}
   836	}
   837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

