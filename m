Return-Path: <linux-leds+bounces-4422-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A4A7D10F
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 00:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D166016BD14
	for <lists+linux-leds@lfdr.de>; Sun,  6 Apr 2025 22:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC0E218AAB;
	Sun,  6 Apr 2025 22:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHeaFYL2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A08191461;
	Sun,  6 Apr 2025 22:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743978913; cv=none; b=i/6q1H/oTKj1v9gyIAWcDIBbOCBhwtZNp74+0VfiPHQDBTCDLhyU2xaaUJVO61OSlYAJDWafZINOHsg0qYs11X8PDubQ66PXLhVV93Jp3uTeIGZz0BH7v8BBdT4nVyupuTmRYo/hmUeg3yXdpuNALgegKIX8rseR09AlVqD/bIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743978913; c=relaxed/simple;
	bh=wHB6K7GjES8Ge4y26halYh4iZ5lye8n0dDMhabj4FIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3CHmzh3rXPgX/ixsqOYnCH64xFn8X2eZP25Z8mAZ6G8XQTWg0mQ+gpe3wjh9JYoGuxq5BY5dyFwrRAjzyO0RfKsqNsJuT99CYPP7UM4mFCMzO+/7tpZgNh04ZbYgCARDzcnpQ9tX/EKsgjng2MgfZgtuYS7dTGxuuo8l//TeKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHeaFYL2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743978910; x=1775514910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wHB6K7GjES8Ge4y26halYh4iZ5lye8n0dDMhabj4FIk=;
  b=MHeaFYL24i8dFrt4axlD9yyJY4iXtQ2GpiA/BgOg1nrWMt3M3wKvdhzP
   GUg45TAZNAMcfAxGo2ZaYwj1zKKyhPgqORQGrDWADurXkDRx/Dx6KajdD
   rZqohuCZc5c0wVyLBoIvooxDQBKatDnCC6qYcubFkCVwBXJmS+mVIVZwi
   KgtsJn8o6YGReN9KHu/8m+w8LhEz7vZO3ts1Bmws+zRKpRpKGL6Vd38qP
   u56GH5EZypdX6k2umPlRsN+3MS31UOK31Ckrnrorj4uI/f4fIgRmvK6m8
   i5rRMZhr2qSvI2J4QD0yhGGlb0AbyKPru/CeZelgkcOnUIVgYPmBWznh/
   Q==;
X-CSE-ConnectionGUID: lr1kuQ8DS76SQN4BJvXAfQ==
X-CSE-MsgGUID: UBjD4HLzSTWIIuknTuKHZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="67827221"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="67827221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 15:35:09 -0700
X-CSE-ConnectionGUID: KbjzzFMbS86tjnzodMgrwQ==
X-CSE-MsgGUID: iDnMJQF2R+a3ye1yUly2dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127661435"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Apr 2025 15:35:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1Ya0-0002nX-0W;
	Sun, 06 Apr 2025 22:35:04 +0000
Date: Mon, 7 Apr 2025 06:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Tran <trannamatk@gmail.com>, pavel@kernel.org, lee@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: Re: [PATCH v4 2/5] leds: add TI/National Semiconductor LP5812 LED
 Driver
Message-ID: <202504070613.iMGdlcfg-lkp@intel.com>
References: <20250405183246.198568-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405183246.198568-3-trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next v6.14]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-add-TI-National-Semiconductor-LP5812-LED-Driver/20250406-023621
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250405183246.198568-3-trannamatk%40gmail.com
patch subject: [PATCH v4 2/5] leds: add TI/National Semiconductor LP5812 LED Driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250407/202504070613.iMGdlcfg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504070613.iMGdlcfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504070613.iMGdlcfg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-lp5812.c:544:13: warning: 'lp5812_dump_regs' defined but not used [-Wunused-function]
     544 | static void lp5812_dump_regs(struct lp5812_chip *chip, u16 from_reg, u16 to_reg)
         |             ^~~~~~~~~~~~~~~~
>> drivers/leds/leds-lp5812.c:364:12: warning: 'lp5812_update_bit' defined but not used [-Wunused-function]
     364 | static int lp5812_update_bit(struct lp5812_chip *chip, u16 reg, u8 mask, u8 val)
         |            ^~~~~~~~~~~~~~~~~


vim +/lp5812_dump_regs +544 drivers/leds/leds-lp5812.c

   363	
 > 364	static int lp5812_update_bit(struct lp5812_chip *chip, u16 reg, u8 mask, u8 val)
   365	{
   366		int ret;
   367		u8 tmp;
   368	
   369		ret = lp5812_read(chip, reg, &tmp);
   370		if (ret)
   371			return ret;
   372	
   373		tmp &= ~mask;
   374		tmp |= val & mask;
   375	
   376		return lp5812_write(chip, reg, tmp);
   377	}
   378	
   379	static int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val)
   380	{
   381		int ret = 0;
   382	
   383		if (!reg_val)
   384			return -1;
   385	
   386		ret = lp5812_read(chip, chip->regs->tsd_config_status_reg, reg_val);
   387	
   388		return ret;
   389	}
   390	
   391	static int lp5812_update_regs_config(struct lp5812_chip *chip)
   392	{
   393		int ret;
   394		u8 reg_val; /* save register value */
   395	
   396		/* Send update command to update config setting */
   397		ret = lp5812_write(chip, chip->regs->update_cmd_reg, UPDATE_CMD_VAL);
   398		if (ret)
   399			return ret;
   400		/* check if the configuration is proper */
   401		ret = lp5812_read_tsd_config_status(chip, &reg_val);
   402		if (ret == 0)
   403			return (int)(reg_val & 0x01);
   404	
   405		return ret;
   406	}
   407	
   408	static int lp5812_read_lod_status(struct lp5812_chip *chip, int led_number, u8 *val)
   409	{
   410		int ret = 0;
   411		u16 reg = 0;
   412		u8 reg_val = 0;
   413	
   414		if (!val)
   415			return -1;
   416	
   417		if (led_number < 0x8)
   418			reg = LOD_STAT_1_REG;
   419		else
   420			reg = LOD_STAT_2_REG;
   421	
   422		ret = lp5812_read(chip, reg, &reg_val);
   423		if (ret)
   424			return ret;
   425	
   426		*val = (reg_val & (1 << (led_number % 8))) ? 1 : 0;
   427	
   428		return ret;
   429	}
   430	
   431	static int lp5812_read_lsd_status(struct lp5812_chip *chip, int led_number, u8 *val)
   432	{
   433		int ret = 0;
   434		u16 reg = 0;
   435		u8 reg_val = 0;
   436	
   437		if (!val)
   438			return -1;
   439	
   440		if (led_number < 0x8)
   441			reg = LSD_STAT_1_REG;
   442		else
   443			reg = LSD_STAT_2_REG;
   444	
   445		ret = lp5812_read(chip, reg, &reg_val);
   446		if (ret)
   447			return ret;
   448	
   449		*val = (reg_val & (1 << (led_number % 8))) ? 1 : 0;
   450	
   451		return ret;
   452	}
   453	
   454	static int lp5812_read_auto_pwm_value(struct lp5812_chip *chip, int led_number,
   455			u8 *val)
   456	{
   457		int ret = 0;
   458		u16 reg = 0;
   459		u8 reg_val = 0;
   460	
   461		reg = AUTO_PWM_BASE_ADDR + led_number;
   462	
   463		ret = lp5812_read(chip, reg, &reg_val);
   464		if (ret)
   465			return ret;
   466	
   467		*val = reg_val;
   468	
   469		return ret;
   470	}
   471	
   472	static int lp5812_read_aep_status(struct lp5812_chip *chip, int led_number, u8 *val)
   473	{
   474		int ret = 0;
   475		u16 reg;
   476		u8 reg_val;
   477	
   478		switch (led_number / 2) {
   479		case 0:
   480			reg = AEP_STATUS_0_REG; // LED_0 and LED_1
   481			break;
   482		case 1:
   483			reg = AEP_STATUS_1_REG; // LED_2 and LED_3
   484			break;
   485		case 2:
   486			reg = AEP_STATUS_2_REG; // LED_A0 and LED_A1
   487			break;
   488		case 3:
   489			reg = AEP_STATUS_3_REG; // LED_A2 and LED_B0
   490			break;
   491		case 4:
   492			reg = AEP_STATUS_4_REG; // LED_B1 and LED_B2
   493			break;
   494		case 5:
   495			reg = AEP_STATUS_5_REG; // LED_C0 and LED_C1
   496			break;
   497		case 6:
   498			reg = AEP_STATUS_6_REG; // LED_C2 and LED_D0
   499			break;
   500		case 7:
   501			reg = AEP_STATUS_7_REG; // LED_D1 and LED_D2
   502			break;
   503		default:
   504			return -EINVAL;
   505		}
   506	
   507		ret = lp5812_read(chip, reg, &reg_val);
   508		if (ret)
   509			return ret;
   510	
   511		*val = (led_number % 2) ? ((reg_val >> 3) & 0x07) : (reg_val & 0x07);
   512	
   513		return ret;
   514	}
   515	
   516	static int lp5812_enable_disable(struct lp5812_chip *chip, int enable)
   517	{
   518		return lp5812_write(chip, chip->regs->enable_reg, (u8)enable);
   519	}
   520	
   521	static int lp5812_reset(struct lp5812_chip *chip)
   522	{
   523		return lp5812_write(chip, chip->regs->reset_reg, RESET_REG_VAL);
   524	}
   525	
   526	static int lp5812_fault_clear(struct lp5812_chip *chip, u8 value)
   527	{
   528		u8 reg_val;
   529	
   530		if (value == 0)
   531			reg_val = LOD_CLEAR_VAL;
   532		else if (value == 1)
   533			reg_val = LSD_CLEAR_VAL;
   534		else if (value == 2)
   535			reg_val = TSD_CLEAR_VAL;
   536		else if (value == 3)
   537			reg_val = FAULT_CLEAR_ALL;
   538		else
   539			return -EINVAL;
   540	
   541		return lp5812_write(chip, chip->regs->fault_clear_reg, reg_val);
   542	}
   543	
 > 544	static void lp5812_dump_regs(struct lp5812_chip *chip, u16 from_reg, u16 to_reg)
   545	{
   546		u16 reg_addr;
   547		u8 reg_val;
   548	
   549		for (reg_addr = from_reg; reg_addr <= to_reg; reg_addr++)
   550			lp5812_read(chip, reg_addr, &reg_val);
   551	}
   552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

