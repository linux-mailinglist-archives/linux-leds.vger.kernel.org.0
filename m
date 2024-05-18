Return-Path: <linux-leds+bounces-1681-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4638C9130
	for <lists+linux-leds@lfdr.de>; Sat, 18 May 2024 14:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD005B21168
	for <lists+linux-leds@lfdr.de>; Sat, 18 May 2024 12:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7A73AC0F;
	Sat, 18 May 2024 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNFswWBp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21948376E1;
	Sat, 18 May 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716036436; cv=none; b=Kqmh+Xu+3wMsvkEHPYd0WZvkAdoAJqEkhslxukpfhLCQ5ozbxuFRhooMSnyjWNPUR6ARTVhfF2O68tZZarJCE/WTbZXWBnU5mEhvHObnpI+wyMT1LdMdkB+XSAfUDOmbMMYUn/+CjxTve4WZ9etJGtd5yd7iGeheuNzt108t8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716036436; c=relaxed/simple;
	bh=xuz41WZVIrvTI8jLUziuMNmX+Hum6+huPnqQtG6dkyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXmVun+cvjD7jIb2zxTgJcS1LbyF1sC8e0HJl85zBxHU5iKYPiS5lgZ1fgtQDpOLfeKGPFaanPNzWu4eMM8uGTGPTBKe/caJcEiWgnMlku0x7PHqEU32GjWzzvi0+ckdgoBjwY0XOgCOPLOve7KVTDFigxbMCnkwS9dpsdcjyGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNFswWBp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716036435; x=1747572435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xuz41WZVIrvTI8jLUziuMNmX+Hum6+huPnqQtG6dkyY=;
  b=mNFswWBp5XEyXEvYe540h80MfMqESEkpZV5RsQId6Icze/krTYQlhtjV
   mXTint/nUdPiRUxrb9XtDHYQDqK0TQGjSdf/DVja1sp/UZaRtSvMKW53v
   pDNJjZ2qOlaV5Sl9hGOOoTGL5/2cXJDg1Q0/n14dw0xDJGdqywQtfCheS
   ope9vOSCTJ9fOeArh7kko3eUnT4qWafR9HpeHMyzsIAUluVjn0VD1q6tH
   i7WcHfNSSUHSgAYDKxl2y7yZGfIJVMMv5iaLxEGY50HqlYFsWu/lHkupj
   iRwDjpM0gcng0DR0GANfMWMCsNzTT1j0hbgpZ1aT2EPCzgjNmJjPY2I1n
   A==;
X-CSE-ConnectionGUID: JbG4O1RYTcq7biy7VX4Ygg==
X-CSE-MsgGUID: +MJ9eiMxQsmOk5tGQX7dBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12327492"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12327492"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 05:47:14 -0700
X-CSE-ConnectionGUID: Ve0APK95TRi/NxP2mzGFxg==
X-CSE-MsgGUID: UcIFWc++TYWmflmWB2VY3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="36978443"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 May 2024 05:47:10 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8JSu-0002CY-0T;
	Sat, 18 May 2024 12:47:08 +0000
Date: Sat, 18 May 2024 20:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH 3/3] leds: leds-lp5569: Add support for Texas Instruments
 LP5569
Message-ID: <202405182007.uyC8NXfY-lkp@intel.com>
References: <20240515143129.31557-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515143129.31557-3-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on robh/for-next linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-leds-lp55xx-Add-new-ti-lp5569-compatible/20240515-223434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20240515143129.31557-3-ansuelsmth%40gmail.com
patch subject: [PATCH 3/3] leds: leds-lp5569: Add support for Texas Instruments LP5569
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240518/202405182007.uyC8NXfY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182007.uyC8NXfY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182007.uyC8NXfY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/leds/leds-lp5569.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/leds/leds-lp5569.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/leds/leds-lp5569.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/leds/leds-lp5569.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/leds/leds-lp5569.c:169:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     169 |         val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
         |                ^
>> drivers/leds/leds-lp5569.c:195:8: error: call to undeclared function 'FIELD_PREP_CONST'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     195 |         val = LP5569_MODE_LOAD_ENG << LP5569_MODE_ENGn_SHIFT(idx);
         |               ^
   drivers/leds/leds-lp5569.c:41:33: note: expanded from macro 'LP5569_MODE_LOAD_ENG'
      41 | #define   LP5569_MODE_LOAD_ENG          FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x1)
         |                                         ^
   drivers/leds/leds-lp5569.c:262:40: error: call to undeclared function 'FIELD_PREP_CONST'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |                 if (LP5569_MODE_ENGn_GET(i, mode) != LP5569_MODE_LOAD_ENG)
         |                                                      ^
   drivers/leds/leds-lp5569.c:41:33: note: expanded from macro 'LP5569_MODE_LOAD_ENG'
      41 | #define   LP5569_MODE_LOAD_ENG          FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x1)
         |                                         ^
>> drivers/leds/leds-lp5569.c:321:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     321 |         status = FIELD_GET(LP5569_ENG_STATUS_MASK, status);
         |                  ^
   drivers/leds/leds-lp5569.c:601:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     601 |                                  FIELD_PREP(LP5569_CP_MODE_MASK, LP55XX_CP_BOOST),
         |                                  ^
   drivers/leds/leds-lp5569.c:696:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     696 |                                  FIELD_PREP(LP5569_CP_MODE_MASK, LP55XX_CP_BYPASS),
         |                                  ^
   drivers/leds/leds-lp5569.c:903:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     903 |                 val = FIELD_PREP(LP5569_FADER_MAPPING_MASK, val);
         |                       ^
>> drivers/leds/leds-lp5569.c:904:13: error: call to undeclared function 'FIELD_MAX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     904 |                 if (val > FIELD_MAX(LP5569_FADER_MAPPING_MASK)) {
         |                           ^
   drivers/leds/leds-lp5569.c:932:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     932 |                         val = FIELD_PREP(LP5569_FADER_MAPPING_MASK, buf[i] - '0');
         |                               ^
   7 warnings and 9 errors generated.


vim +/FIELD_PREP +169 drivers/leds/leds-lp5569.c

   155	
   156	static int lp5569_post_init_device(struct lp55xx_chip *chip)
   157	{
   158		int ret;
   159		int val;
   160	
   161		ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
   162		if (ret)
   163			return ret;
   164	
   165		/* Chip startup time is 500 us, 1 - 2 ms gives some margin */
   166		usleep_range(1000, 2000);
   167	
   168		val = LP5569_DEFAULT_CONFIG;
 > 169		val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
   170	
   171		if (chip->pdata->clock_mode == LP55XX_CLOCK_INT)
   172			val |= LP5569_INTERNAL_CLK;
   173	
   174		ret = lp55xx_write(chip, LP5569_REG_MISC, val);
   175		if (ret)
   176			return ret;
   177	
   178		if (chip->pdata->clock_mode == LP55XX_CLOCK_INT) {
   179			ret = lp55xx_update_bits(chip, LP5569_REG_IO_CONTROL,
   180						 LP5569_CLK_OUTPUT,
   181						 LP5569_CLK_OUTPUT);
   182			if (ret)
   183				return ret;
   184		}
   185	
   186		return lp5569_init_program_engine(chip);
   187	}
   188	
   189	static void lp5569_load_engine(struct lp55xx_chip *chip)
   190	{
   191		enum lp55xx_engine_index idx = chip->engine_idx;
   192		u8 mask, val;
   193	
   194		mask = LP5569_MODE_ENGn_MASK(idx);
 > 195		val = LP5569_MODE_LOAD_ENG << LP5569_MODE_ENGn_SHIFT(idx);
   196	
   197		lp55xx_update_bits(chip, LP5569_REG_OP_MODE, mask, val);
   198	
   199		lp5569_wait_opmode_done();
   200	}
   201	
   202	static void lp5569_load_engine_and_select_page(struct lp55xx_chip *chip)
   203	{
   204		enum lp55xx_engine_index idx = chip->engine_idx;
   205	
   206		lp5569_load_engine(chip);
   207	
   208		lp55xx_write(chip, LP5569_REG_PROG_PAGE_SEL, LP5569_PAGE_ENG(idx));
   209	}
   210	
   211	static void lp5569_stop_all_engines(struct lp55xx_chip *chip)
   212	{
   213		lp55xx_write(chip, LP5569_REG_OP_MODE, 0);
   214		lp5569_wait_opmode_done();
   215	}
   216	
   217	static void lp5569_stop_engine(struct lp55xx_chip *chip)
   218	{
   219		enum lp55xx_engine_index idx = chip->engine_idx;
   220	
   221		lp55xx_update_bits(chip, LP5569_REG_OP_MODE, LP5569_MODE_ENGn_MASK(idx), 0);
   222	
   223		lp5569_wait_opmode_done();
   224	}
   225	
   226	static void lp5569_turn_off_channels(struct lp55xx_chip *chip)
   227	{
   228		int i;
   229	
   230		for (i = 0; i < LP5569_MAX_LEDS; i++)
   231			lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + i, 0);
   232	}
   233	
   234	static void lp5569_run_engine(struct lp55xx_chip *chip, bool start)
   235	{
   236		int i, ret;
   237		u8 mode;
   238		u8 exec;
   239	
   240		/* stop engine */
   241		if (!start) {
   242			lp5569_stop_engine(chip);
   243			lp5569_turn_off_channels(chip);
   244			return;
   245		}
   246	
   247		/*
   248		 * To run the engine,
   249		 * operation mode and enable register should updated at the same time
   250		 */
   251	
   252		ret = lp55xx_read(chip, LP5569_REG_OP_MODE, &mode);
   253		if (ret)
   254			return;
   255	
   256		ret = lp55xx_read(chip, LP5569_REG_EXEC_CTRL, &exec);
   257		if (ret)
   258			return;
   259	
   260		/* change operation mode to RUN only when each engine is loading */
   261		for (i = LP55XX_ENGINE_1; i <= LP55XX_ENGINE_3; i++) {
   262			if (LP5569_MODE_ENGn_GET(i, mode) != LP5569_MODE_LOAD_ENG)
   263				continue;
   264	
   265			mode &= ~LP5569_MODE_ENGn_MASK(i);
   266			mode |= LP5569_MODE_RUN_ENG << LP5569_MODE_ENGn_SHIFT(i);
   267			exec &= ~LP5569_EXEC_ENGn_MASK(i);
   268			exec |= LP5569_EXEC_RUN_ENG << LP5569_EXEC_ENGn_SHIFT(i);
   269		}
   270	
   271		lp55xx_write(chip, LP5569_REG_OP_MODE, mode);
   272		lp5569_wait_opmode_done();
   273	
   274		lp55xx_write(chip, LP5569_REG_EXEC_CTRL, exec);
   275	}
   276	
   277	static int lp5569_init_program_engine(struct lp55xx_chip *chip)
   278	{
   279		int i;
   280		int j;
   281		int ret;
   282		u8 status;
   283		/* one pattern per engine setting LED MUX start and stop addresses */
   284		static const u8 pattern[][LP5569_PROGRAM_LENGTH] =  {
   285			{ 0x9c, LP5569_ENG1_MUX_ADDR, 0x9c, 0xb0, 0x9d, 0x80, 0xd8, 0x00, 0},
   286			{ 0x9c, LP5569_ENG2_MUX_ADDR, 0x9c, 0xc0, 0x9d, 0x80, 0xd8, 0x00, 0},
   287			{ 0x9c, LP5569_ENG3_MUX_ADDR, 0x9c, 0xd0, 0x9d, 0x80, 0xd8, 0x00, 0},
   288		};
   289	
   290		/* hardcode 32 bytes of memory for each engine from program memory */
   291		ret = lp55xx_write(chip, LP5569_REG_CH1_PROG_START, LP5569_ENG1_PROG_ADDR);
   292		if (ret)
   293			return ret;
   294	
   295		ret = lp55xx_write(chip, LP5569_REG_CH2_PROG_START, LP5569_ENG2_PROG_ADDR);
   296		if (ret)
   297			return ret;
   298	
   299		ret = lp55xx_write(chip, LP5569_REG_CH3_PROG_START, LP5569_ENG3_PROG_ADDR);
   300		if (ret)
   301			return ret;
   302	
   303		/* write LED MUX address space for each engine */
   304		for (i = LP55XX_ENGINE_1; i <= LP55XX_ENGINE_3; i++) {
   305			chip->engine_idx = i;
   306			lp5569_load_engine_and_select_page(chip);
   307	
   308			for (j = 0; j < LP5569_PROGRAM_LENGTH; j++) {
   309				ret = lp55xx_write(chip, LP5569_REG_PROG_MEM + j,
   310						   pattern[i - 1][j]);
   311				if (ret)
   312					goto out;
   313			}
   314		}
   315	
   316		lp5569_run_engine(chip, true);
   317	
   318		/* Let the programs run for couple of ms and check the engine status */
   319		usleep_range(3000, 6000);
   320		lp55xx_read(chip, LP5569_REG_STATUS, &status);
 > 321		status = FIELD_GET(LP5569_ENG_STATUS_MASK, status);
   322	
   323		if (status != LP5569_ENG_STATUS_MASK) {
   324			dev_err(&chip->cl->dev,
   325				"could not configure LED engine, status = 0x%.2x\n",
   326				status);
   327			ret = -1;
   328		}
   329	
   330	out:
   331		lp5569_stop_all_engines(chip);
   332		return ret;
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

