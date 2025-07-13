Return-Path: <linux-leds+bounces-5052-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BC3B02E7D
	for <lists+linux-leds@lfdr.de>; Sun, 13 Jul 2025 04:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A4F5189CA53
	for <lists+linux-leds@lfdr.de>; Sun, 13 Jul 2025 02:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC301487F4;
	Sun, 13 Jul 2025 02:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENiO7lkT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1488F35955;
	Sun, 13 Jul 2025 02:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752375417; cv=none; b=r3klYXjXNOQ3d7AFa/zsi9UU8b39gJzsIXshtVUC1+q+tFIpcghqXAbC7xUGsH2foOot6nqH9clTmXaVWu0ObXud88ro0h9rU0xXKgLU4YKSnZg/3aQ6fkG0AK40Sqgj5CO+D5syzWD6ME9hM54Kyy47CDI8pc0RykkM4JiO++A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752375417; c=relaxed/simple;
	bh=8AUdy6h2+tSJPoNWDDMjqTgiCiyybhkNqT4U/lGwP5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSLTAidsSQRXQHqJJoskPY9zWJKlfX178Bb8ZMdcWJAIYUM6HL4Im8szGYEFkwj+dHa/YhDiI0j+U/OO0ZS3e04Cc71ueFbqI9JkmYF8hPmGmqsRVxtwzVpAQUcY5qOzWyUvIOjOxIJRDtt2FfSOnkfoDf4sFuY9Oe9ODzrzrvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENiO7lkT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752375415; x=1783911415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8AUdy6h2+tSJPoNWDDMjqTgiCiyybhkNqT4U/lGwP5k=;
  b=ENiO7lkTAv5GuHJQHHFHCwu4WdkMQxCoKnvD9W21DvSmjz+Aq3fH20ZK
   LXBSof1wXaBqppAuamaBQAqhV75dAekZ7kh7pMN+XTpW3qunZ/AHJPzww
   TWRC6vk0nIeNNs5IX4ztOEzcPmFJokxzMhgoRPTkAzOSOzDy0kSfhfK3E
   0pjaunFRPubBETTwBDausa15hUTKeOFkIC59o1OKRbKBK+4waUwjlUsLE
   MHVdZOUfoIdyOAxqNomarLIqMSCZNcFFr1/zRklWV1n1Qe0g1SqS8WkO3
   zLBYRd+Pig2NHBBT0fLPHwzco0Kz1RHlyb9SRvIq0Ua+iM1z/AUjCXU0f
   Q==;
X-CSE-ConnectionGUID: 38BYc9tZRI+nm9Zb+uOcgQ==
X-CSE-MsgGUID: SjkSxoa+RTWNOzvvUUIQGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54698958"
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="54698958"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 19:56:54 -0700
X-CSE-ConnectionGUID: OFqr8q+OQm+u78ezxoQBjQ==
X-CSE-MsgGUID: A19bfi6uRmqU8JOuzVL4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="156746292"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2025 19:56:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uamtU-0007ql-2C;
	Sun, 13 Jul 2025 02:56:48 +0000
Date: Sun, 13 Jul 2025 10:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net,
	cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	rdunlap@infradead.org, alok.a.tiwari@oracle.com,
	linux-leds@vger.kernel.org, lee@kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH 2/3] platform/x86: Add Uniwill laptop driver
Message-ID: <202507131049.84GJKlqK-lkp@intel.com>
References: <20250712112310.19964-3-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712112310.19964-3-W_Armin@gmx.de>

Hi Armin,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Armin-Wolf/platform-x86-Add-Uniwill-WMI-driver/20250712-192556
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20250712112310.19964-3-W_Armin%40gmx.de
patch subject: [PATCH 2/3] platform/x86: Add Uniwill laptop driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250713/202507131049.84GJKlqK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131049.84GJKlqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131049.84GJKlqK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/uniwill/uniwill-laptop.c: In function 'uniwill_get_property':
>> drivers/platform/x86/uniwill/uniwill-laptop.c:1060:23: error: implicit declaration of function 'power_supply_get_property_direct'; did you mean 'power_supply_get_property'? [-Werror=implicit-function-declaration]
    1060 |                 ret = power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PRESENT, &prop);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       power_supply_get_property
   cc1: some warnings being treated as errors


vim +1060 drivers/platform/x86/uniwill/uniwill-laptop.c

  1048	
  1049	static int uniwill_get_property(struct power_supply *psy, const struct power_supply_ext *ext,
  1050					void *drvdata, enum power_supply_property psp,
  1051					union power_supply_propval *val)
  1052	{
  1053		struct uniwill_data *data = drvdata;
  1054		union power_supply_propval prop;
  1055		unsigned int regval;
  1056		int ret;
  1057	
  1058		switch (psp) {
  1059		case POWER_SUPPLY_PROP_HEALTH:
> 1060			ret = power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PRESENT, &prop);
  1061			if (ret < 0)
  1062				return ret;
  1063	
  1064			if (!prop.intval) {
  1065				val->intval = POWER_SUPPLY_HEALTH_NO_BATTERY;
  1066				return 0;
  1067			}
  1068	
  1069			ret = power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_STATUS, &prop);
  1070			if (ret < 0)
  1071				return ret;
  1072	
  1073			if (prop.intval == POWER_SUPPLY_STATUS_UNKNOWN) {
  1074				val->intval = POWER_SUPPLY_HEALTH_UNKNOWN;
  1075				return 0;
  1076			}
  1077	
  1078			ret = regmap_read(data->regmap, EC_ADDR_BAT_ALERT, &regval);
  1079			if (ret < 0)
  1080				return ret;
  1081	
  1082			if (regval) {
  1083				/* Charging issue */
  1084				val->intval = POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
  1085				return 0;
  1086			}
  1087	
  1088			val->intval = POWER_SUPPLY_HEALTH_GOOD;
  1089			return 0;
  1090		case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
  1091			ret = regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &regval);
  1092			if (ret < 0)
  1093				return ret;
  1094	
  1095			val->intval = clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 100);
  1096			return 0;
  1097		default:
  1098			return -EINVAL;
  1099		}
  1100	}
  1101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

