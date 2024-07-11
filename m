Return-Path: <linux-leds+bounces-2268-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5D92F2A7
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 01:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF266282D36
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 23:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D2C150997;
	Thu, 11 Jul 2024 23:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wxok5Wd7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D75447F7F
	for <linux-leds@vger.kernel.org>; Thu, 11 Jul 2024 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720740959; cv=none; b=Wp63FKrHuOXA1OMHyGAfdbRSWpODS1YXh5CUvSMWUaD87A1b/RR6MFaZngF9eunYNJmVXaphV3LCdxuu0oa9KYkt92piOU4wx7XFBhiKvKGORMvbeFdMHs2gD2eeok3SfY3oU3sqTOQd0qRroh94FVnOIrijDTxFBkaXQDY1glU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720740959; c=relaxed/simple;
	bh=qHjVZoTwSz2GKMmWckCQHBB1pwcGiH35g8AL+WK3yOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXMUWAUMI6Ziv5MKsyPz/N4mew+XtsX5gqkvZpwnHMUQCi37Wx2xgq02IC31IRDiZmGJO9WhxgQkW14zHCiJWDd660Sc1yXzXoOTRTuu7jqFqyP1zevqNywFxkPY/Psub3ZJ348O17wCcFpWhEl0E+w+kDr96NceWlLMRyTylZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wxok5Wd7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720740958; x=1752276958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qHjVZoTwSz2GKMmWckCQHBB1pwcGiH35g8AL+WK3yOU=;
  b=Wxok5Wd7eJXQEn2Adn2TgCPJPEitfwNf6KtoTsYeXfInsRpQxGYh5loi
   euZ7wfOaey2m+gg+LxE63MnPSAleNsg9r5EY+Qq/KOO+3+Nf6/wpiVK3h
   J6OJ9ZwqIqP5wyY38j3WszcS7KAfq+95YIUiUluD2arThN87xNOFEuweE
   sfD83WYEr+gEl20Rsv4LAJjxK8UR3tpHiiSvMev4e9k9Qv85zEIUU86K9
   T0fHLwX9esSdDcIWnK10wJocP5ygqVfCsStrP+GKe590G6/Bjv+JWPz1N
   Xw5tOIeHDbA3SuxPBkAE9nwdU2pJx8NMW9ru+R6cirfv/BvbdM2CdPlyI
   A==;
X-CSE-ConnectionGUID: zLLySv6eR7qt2RTfng2ByQ==
X-CSE-MsgGUID: ClpZdENgQDyJid8jyiTEPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35707123"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="35707123"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 16:35:57 -0700
X-CSE-ConnectionGUID: Favjr+KtTfqIBlXg5WX/tA==
X-CSE-MsgGUID: 3uLIb1asRke8IlrC3hA7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="53115306"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2024 16:35:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS3KL-000a4I-0Z;
	Thu, 11 Jul 2024 23:35:53 +0000
Date: Fri, 12 Jul 2024 07:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 65/65] drivers/leds/leds-lp5569.c:204:52:
 error: passing argument 3 of 'lp55xx_read' from incompatible pointer type
Message-ID: <202407120702.K20luS0E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   d9cc80b1c9b40a33c022e125b7f9555813c7f385
commit: d9cc80b1c9b40a33c022e125b7f9555813c7f385 [65/65] leds: leds-lp5569: Enable chip after chip configuration
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240712/202407120702.K20luS0E-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120702.K20luS0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120702.K20luS0E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/leds/leds-lp5569.c:11:
   drivers/leds/leds-lp5569.c: In function 'lp5569_post_init_device':
>> drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_read' from incompatible pointer type [-Wincompatible-pointer-types]
     204 |                           chip, LP5569_REG_STATUS, &val);
         |                                                    ^~~~
         |                                                    |
         |                                                    int *
   include/linux/iopoll.h:46:28: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                            ^~~~
   In file included from drivers/leds/leds-lp5569.c:20:
   drivers/leds/leds-lp55xx-common.h:229:62: note: expected 'u8 *' {aka 'unsigned char *'} but argument is of type 'int *'
     229 | extern int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
         |                                                          ~~~~^~~
>> drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_read' from incompatible pointer type [-Wincompatible-pointer-types]
     204 |                           chip, LP5569_REG_STATUS, &val);
         |                                                    ^~~~
         |                                                    |
         |                                                    int *
   include/linux/iopoll.h:51:36: note: in definition of macro 'read_poll_timeout'
      51 |                         (val) = op(args); \
         |                                    ^~~~
   drivers/leds/leds-lp55xx-common.h:229:62: note: expected 'u8 *' {aka 'unsigned char *'} but argument is of type 'int *'
     229 | extern int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
         |                                                          ~~~~^~~


vim +/lp55xx_read +204 drivers/leds/leds-lp5569.c

   171	
   172	static int lp5569_post_init_device(struct lp55xx_chip *chip)
   173	{
   174		int ret;
   175		int val;
   176	
   177		val = LP5569_DEFAULT_CONFIG;
   178		val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
   179		ret = lp55xx_write(chip, LP5569_REG_MISC, val);
   180		if (ret)
   181			return ret;
   182	
   183		if (chip->pdata->clock_mode == LP55XX_CLOCK_INT) {
   184			/* Internal clock MUST be configured before CLK output */
   185			ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
   186						 LP5569_INTERNAL_CLK,
   187						 LP5569_INTERNAL_CLK);
   188			if (ret)
   189				return ret;
   190	
   191			ret = lp55xx_update_bits(chip, LP5569_REG_IO_CONTROL,
   192						 LP5569_CLK_OUTPUT,
   193						 LP5569_CLK_OUTPUT);
   194			if (ret)
   195				return ret;
   196		}
   197	
   198		ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
   199		if (ret)
   200			return ret;
   201	
   202		read_poll_timeout(lp55xx_read, ret, !(val & LP5569_STARTUP_BUSY),
   203				  LP5569_STARTUP_SLEEP, LP5569_STARTUP_SLEEP * 10, false,
 > 204				  chip, LP5569_REG_STATUS, &val);
   205	
   206		return lp5569_init_program_engine(chip);
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

