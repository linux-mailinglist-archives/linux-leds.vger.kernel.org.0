Return-Path: <linux-leds+bounces-1676-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 952DD8C7C7F
	for <lists+linux-leds@lfdr.de>; Thu, 16 May 2024 20:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2D9BB2330C
	for <lists+linux-leds@lfdr.de>; Thu, 16 May 2024 18:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8E3157E69;
	Thu, 16 May 2024 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmZjpOzb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81493157A63;
	Thu, 16 May 2024 18:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883682; cv=none; b=ZdkuryAksccLna0soRAfecfR6lhQ4f3LLbeE7+iJQt9lhqe+w6CcRnrg9cAsZMLQKbubwPWHOTTjvJ6FX0cAf+TMP+c9gXMbQtF1XikGysikth46FHCC9VnzSiVv/+QsRh1gi1GdS22qtzUZ0BjgnV1eUJAn2DeShe0djjEVLVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883682; c=relaxed/simple;
	bh=0/9olHLvYDoHrGBkA5EHwSUR2SCwjq+ab6+57OAXHsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nr0KRUu3moQJCMjDRJ0Uwnd54vQTLjHThbpVxVwtwF/NWWmBy1J2MAcAvFFGwSdjinYr0qNlDD7H+OSel6KWFLjLanQUlVWpbBJni6hZgN11loJmxPBOAU/xYGBMgUdumYPIfiKo1MA8b++QsahKuJzqfYswRPWBLGO7EdyMerc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmZjpOzb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715883680; x=1747419680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/9olHLvYDoHrGBkA5EHwSUR2SCwjq+ab6+57OAXHsg=;
  b=hmZjpOzbCt32X/X9aKo4oUOArOCoY+FJpu4lzHtSn8twOGbqhewrbWyz
   O1RuWB1/QQbCKnqV9d2UyKOqPuvaT0sUKLlBgHja6FTY2kylnY8MIjo0b
   NN6FSrKnknIXmdXcboS4L0DgtCCARsQ31q+UOWaztpfeANvTDdjfg3Tf8
   DL8RgDH5yxF+L4YZq8IeOSStQs6AXPOLRCQFPG/Eb3TMFYJ+BPzj6pYi+
   VQHyrxKU0NsA29YSGr2ccSl7vglh3ztbI5pJdI6DCj3s8Qe7YP1t7C7qY
   j8vha53I+wtL/DWtGjQHzBTA/6yi/o3HudlyhOokC4Smyh/zZBIyoBdb5
   w==;
X-CSE-ConnectionGUID: BdBhqug7SG+zHBBuSn8Hbw==
X-CSE-MsgGUID: 3W4N2WjMSdu4Rg3CxQ7O5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29525831"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="29525831"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 11:21:20 -0700
X-CSE-ConnectionGUID: ZYpvJN5iSoanieGmRaOKtA==
X-CSE-MsgGUID: nPaCDbGQR3S5pW8A54Shmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="31349897"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2024 11:21:16 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7fj7-000EZf-28;
	Thu, 16 May 2024 18:21:13 +0000
Date: Fri, 17 May 2024 02:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH 3/3] leds: leds-lp5569: Add support for Texas Instruments
 LP5569
Message-ID: <202405170244.MEWiW9it-lkp@intel.com>
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
[also build test ERROR on robh/for-next linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-leds-lp55xx-Add-new-ti-lp5569-compatible/20240515-223434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20240515143129.31557-3-ansuelsmth%40gmail.com
patch subject: [PATCH 3/3] leds: leds-lp5569: Add support for Texas Instruments LP5569
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240517/202405170244.MEWiW9it-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405170244.MEWiW9it-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405170244.MEWiW9it-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/leds-lp5569.c: In function 'lp5569_post_init_device':
>> drivers/leds/leds-lp5569.c:169:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     169 |         val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
         |                ^~~~~~~~~~
   drivers/leds/leds-lp5569.c: In function 'lp5569_load_engine':
>> drivers/leds/leds-lp5569.c:41:41: error: implicit declaration of function 'FIELD_PREP_CONST' [-Werror=implicit-function-declaration]
      41 | #define   LP5569_MODE_LOAD_ENG          FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x1)
         |                                         ^~~~~~~~~~~~~~~~
   drivers/leds/leds-lp5569.c:195:15: note: in expansion of macro 'LP5569_MODE_LOAD_ENG'
     195 |         val = LP5569_MODE_LOAD_ENG << LP5569_MODE_ENGn_SHIFT(idx);
         |               ^~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-lp5569.c: In function 'lp5569_init_program_engine':
>> drivers/leds/leds-lp5569.c:321:18: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     321 |         status = FIELD_GET(LP5569_ENG_STATUS_MASK, status);
         |                  ^~~~~~~~~
   drivers/leds/leds-lp5569.c: In function 'show_master_fader_leds':
>> drivers/leds/leds-lp5569.c:904:27: error: implicit declaration of function 'FIELD_MAX'; did you mean 'IPL_MAX'? [-Werror=implicit-function-declaration]
     904 |                 if (val > FIELD_MAX(LP5569_FADER_MAPPING_MASK)) {
         |                           ^~~~~~~~~
         |                           IPL_MAX
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +169 drivers/leds/leds-lp5569.c

    29	
    30	#define LP5569_REG_EXEC_CTRL		0x01
    31	/*
    32	 * Program Memory Operations
    33	 * Same Mask for each engine for both mode and exec
    34	 * ENG1	GENMASK(3, 2)
    35	 * ENG2	GENMASK(5, 4)
    36	 * ENG3	GENMASK(7, 6)
    37	 */
    38	#define LP5569_MODE_ENG_MASK		GENMASK(1, 0)
    39	#define   LP5569_MODE_ENG_SHIFT		2
    40	#define   LP5569_MODE_DISABLE_ENG	FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x0)
  > 41	#define   LP5569_MODE_LOAD_ENG		FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x1)
    42	#define   LP5569_MODE_RUN_ENG		FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x2)
    43	#define   LP5569_MODE_HALT_ENG		FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x3)
    44	
    45	#define   LP5569_MODE_ENGn_SHIFT(n)	(LP5569_MODE_ENG_SHIFT + (2 * (3 - (n))))
    46	#define   LP5569_MODE_ENGn_MASK(n)	(LP5569_MODE_ENG_MASK << LP5569_MODE_ENGn_SHIFT(n))
    47	#define   LP5569_MODE_ENGn_GET(n, mode)	\
    48		(((mode) >> LP5569_MODE_ENGn_SHIFT(n)) & LP5569_MODE_ENG_MASK)
    49	
    50	#define LP5569_REG_OP_MODE		0x02
    51	#define   LP5569_EXEC_ENG_MASK		GENMASK(1, 0)
    52	#define   LP5569_EXEC_ENG_SHIFT		2
    53	#define   LP5569_EXEC_HOLD_ENG		FIELD_PREP_CONST(LP5569_EXEC_ENG_MASK, 0x0)
    54	#define   LP5569_EXEC_STEP_ENG		FIELD_PREP_CONST(LP5569_EXEC_ENG_MASK, 0x1)
    55	#define   LP5569_EXEC_RUN_ENG		FIELD_PREP_CONST(LP5569_EXEC_ENG_MASK, 0x2)
    56	#define   LP5569_EXEC_ONCE_ENG		FIELD_PREP_CONST(LP5569_EXEC_ENG_MASK, 0x3)
    57	
    58	#define   LP5569_EXEC_ENGn_SHIFT(n)	(LP5569_EXEC_ENG_SHIFT + (2 * (3 - (n))))
    59	#define   LP5569_EXEC_ENGn_MASK(n)	(LP5569_EXEC_ENG_MASK << LP5569_EXEC_ENGn_SHIFT(n))
    60	
    61	#define LP5569_REG_ENABLE_LEDS_MSB	0x04
    62	#define LP5569_REG_ENABLE_LEDS_LSB	0x05
    63	#define LP5569_REG_LED_CTRL_BASE	0x07
    64	#define   LP5569_FADER_MAPPING_MASK	GENMASK(7, 5)
    65	#define LP5569_REG_LED_PWM_BASE		0x16
    66	#define LP5569_REG_LED_CURRENT_BASE	0x22
    67	#define LP5569_REG_MISC			0x2F
    68	#define   LP5569_AUTO_INC		BIT(6)
    69	#define   LP5569_PWR_SAVE		BIT(5)
    70	#define   LP5569_CP_MODE_MASK		GENMASK(4, 3)
    71	#define   LP5569_PWM_PWR_SAVE		BIT(2)
    72	#define   LP5569_INTERNAL_CLK		BIT(0)
    73	#define LP5569_REG_MISC2		0x33
    74	#define   LP5569_LED_SHORT_TEST		BIT(4)
    75	#define   LP5569_LED_OPEN_TEST		BIT(3)
    76	#define LP5569_REG_STATUS		0x3C
    77	#define   LP5569_MASK_BUSY		BIT(7)
    78	#define   LP5569_STARTUP_BUSY		BIT(6)
    79	#define   LP5569_ENGINE_BUSY		BIT(5)
    80	#define   LP5569_ENGINE1_INT		BIT(2)
    81	#define   LP5569_ENGINE2_INT		BIT(1)
    82	#define   LP5569_ENGINE3_INT		BIT(0)
    83	#define   LP5569_ENG_STATUS_MASK	(LP5569_ENGINE1_INT | LP5569_ENGINE2_INT | \
    84						 LP5569_ENGINE3_INT)
    85	#define LP5569_REG_IO_CONTROL		0x3D
    86	#define   LP5569_CLK_OUTPUT		BIT(3)
    87	#define LP5569_REG_RESET		0x3F
    88	#define   LP5569_RESET			0xFF
    89	#define LP5569_REG_MASTER_FADER_BASE	0x46
    90	#define LP5569_REG_CH1_PROG_START	0x4B
    91	#define LP5569_REG_CH2_PROG_START	0x4C
    92	#define LP5569_REG_CH3_PROG_START	0x4D
    93	#define LP5569_REG_PROG_PAGE_SEL	0x4F
    94	#define LP5569_REG_PROG_MEM		0x50
    95	#define LP5569_REG_LED_FAULT1		0x81
    96	#define   LP5569_LED_FAULT8		BIT(0)
    97	#define LP5569_REG_LED_FAULT2		0x82
    98	#define   LP5569_LED_FAULT7		BIT(7)
    99	#define   LP5569_LED_FAULT6		BIT(6)
   100	#define   LP5569_LED_FAULT5		BIT(5)
   101	#define   LP5569_LED_FAULT4		BIT(4)
   102	#define   LP5569_LED_FAULT3		BIT(3)
   103	#define   LP5569_LED_FAULT2		BIT(2)
   104	#define   LP5569_LED_FAULT1		BIT(1)
   105	#define   LP5569_LED_FAULT0		BIT(0)
   106	
   107	#define LP5569_MAX_LEDS			9
   108	
   109	#define LP5569_PROGRAM_PAGES		16
   110	#define LP5569_PROGRAM_LENGTH		32	/* bytes */
   111	/* Memory is used like this:
   112	 * 0x00 engine 1 program
   113	 * 0x10 engine 2 program
   114	 * 0x20 engine 3 program
   115	 * 0x30 engine 1 muxing info
   116	 * 0x40 engine 2 muxing info
   117	 * 0x50 engine 3 muxing info
   118	 */
   119	#define LP5569_ENG1_PROG_ADDR		0x0
   120	#define LP5569_ENG2_PROG_ADDR		0x10
   121	#define LP5569_ENG3_PROG_ADDR		0x20
   122	#define LP5569_ENG1_MUX_ADDR		0x30
   123	#define LP5569_ENG2_MUX_ADDR		0x40
   124	#define LP5569_ENG3_MUX_ADDR		0x50
   125	
   126	/* Memory Page Selection */
   127	#define LP5569_PAGE_ENG_OFFSET		0
   128	#define LP5569_PAGE_ENG(n)		(((n) - 1) + LP5569_PAGE_ENG_OFFSET)
   129	#define LP5569_PAGE_MUX_OFFSET		3
   130	#define LP5569_PAGE_MUX(n)		(((n) - 1) + LP5569_PAGE_MUX_OFFSET)
   131	
   132	#define LEDn_STATUS_FAULT(n, status)	((status) >> (n) & BIT(0))
   133	#define LED_ACTIVE(mux, led)		(!!((mux) & (0x0001 << (led))))
   134	
   135	#define LP5569_DEFAULT_CONFIG \
   136		(LP5569_AUTO_INC | LP5569_PWR_SAVE | LP5569_PWM_PWR_SAVE)
   137	
   138	enum lp5569_chip_id {
   139		LP5569,
   140	};
   141	
   142	static int lp5569_init_program_engine(struct lp55xx_chip *chip);
   143	
   144	static inline void lp5569_wait_opmode_done(void)
   145	{
   146		usleep_range(1000, 2000);
   147	}
   148	
   149	static void lp5569_set_led_current(struct lp55xx_led *led, u8 led_current)
   150	{
   151		led->led_current = led_current;
   152		lp55xx_write(led->chip, LP5569_REG_LED_CURRENT_BASE + led->chan_nr,
   153			     led_current);
   154	}
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
   195		val = LP5569_MODE_LOAD_ENG << LP5569_MODE_ENGn_SHIFT(idx);
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

