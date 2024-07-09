Return-Path: <linux-leds+bounces-2224-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B04892BE3A
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2024 17:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A50CB21B60
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2024 15:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67CA43147;
	Tue,  9 Jul 2024 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfOw2uRm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3D219CD0A
	for <linux-leds@vger.kernel.org>; Tue,  9 Jul 2024 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538739; cv=none; b=IRemr4qlDN0G+NQKPR8pcKGdSG5QhB5muJGGK3hi6Jv5kB2nLymjz6iRPkZa5u3AtsWPQsb4WWDGgfxv7tmX4r64TBC7pu+1v780toYGm+Wkb5jo2v8WzMYpS9axhzytuPslT7uqHmXrpDmtpdNuO6sA/YMpbua3xT2psvTa1Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538739; c=relaxed/simple;
	bh=mKYpsNwqxWEzmvTYQkktMzGi4xMtOiAFdOcQS5BzKP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tHrOOkwZuOBD5u1TzgGVVOBK7LoIsYjLwHsQq0wqvRZYeIgP5USepmro2w9D5CB0u8VO5T4Ka4tZu1kapAujA7vCsXGyZ4+Hlw+8lAPlMDNWhwNxPy+JI5yXQCkndHTe6T43BQaFRtC7/gDZ1WazOT0yYEnBF1mgdyMuLoRdw08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfOw2uRm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720538737; x=1752074737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKYpsNwqxWEzmvTYQkktMzGi4xMtOiAFdOcQS5BzKP0=;
  b=PfOw2uRmElz9NdZwhxcBXH8jdc10hopaw6BMrnpCHI8ImlQ8QQ4ca9+3
   UYDBWydvhDMEP2Dtssj+Wo7h2nb77MjZlgutWM14tjcKVU1pqNJS0k2YY
   MDgsPmNVEkKpaZRq6AQFuvcMKNSEU9TlJBV+tnOsZfeyPT4t7mX4YaPae
   9BtNolEpDNwl+GMbjkfHkTmPBEWSvu7evzyG4D6dFg2V8VTbWVJCmrwE7
   hdTnl9OwrmWlepJ3FYZGcPRyM/6FOPkyyIROh8JT0zBjzslPYTeU44sw0
   TfUDwUdHH4a2CcaNF8Zj3Nc3K9xjQCHPTfzQhShvYhzAgXSHibGeIfPiI
   g==;
X-CSE-ConnectionGUID: NfT2hkb5T3CJQLoKHKjVeg==
X-CSE-MsgGUID: 1BDGqjhvRPGqfEjH6ZWS0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="43225132"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="43225132"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 08:25:37 -0700
X-CSE-ConnectionGUID: AFmjwkf+QBGFCaac6XJsHg==
X-CSE-MsgGUID: K+hauEa8TTiAiZerKWPAnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="47675363"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2024 08:25:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRCij-000WnU-1m;
	Tue, 09 Jul 2024 15:25:33 +0000
Date: Tue, 9 Jul 2024 23:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 61/62] drivers/leds/leds-lp5521.c:189:33:
 error: macro "guard" passed 2 arguments, but takes just 1
Message-ID: <202407092352.NAcaYfjI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   b9bd590268485652b928110b5543057543b5d02b
commit: efd0d1cbb8c5dd1049922e839fa7d85811facd53 [61/62] leds: leds-lp55xx: Convert mutex lock/unlock to guard API
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240709/202407092352.NAcaYfjI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092352.NAcaYfjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407092352.NAcaYfjI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/leds-lp5521.c: In function 'lp5521_selftest':
>> drivers/leds/leds-lp5521.c:189:33: error: macro "guard" passed 2 arguments, but takes just 1
     189 |         guard(mutex, &chip->lock);
         |                                 ^
   In file included from drivers/leds/leds-lp5521.c:12:
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
>> drivers/leds/leds-lp5521.c:189:9: error: 'guard' undeclared (first use in this function)
     189 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp5521.c:189:9: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/leds/leds-lp5523.c: In function 'lp5523_selftest':
>> drivers/leds/leds-lp5523.c:192:33: error: macro "guard" passed 2 arguments, but takes just 1
     192 |         guard(mutex, &chip->lock);
         |                                 ^
   In file included from drivers/leds/leds-lp5523.c:12:
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
>> drivers/leds/leds-lp5523.c:192:9: error: 'guard' undeclared (first use in this function)
     192 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp5523.c:192:9: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/leds/leds-lp5562.c: In function 'lp5562_led_brightness':
>> drivers/leds/leds-lp5562.c:175:33: error: macro "guard" passed 2 arguments, but takes just 1
     175 |         guard(mutex, &chip->lock);
         |                                 ^
   In file included from drivers/leds/leds-lp5562.c:10:
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
>> drivers/leds/leds-lp5562.c:175:9: error: 'guard' undeclared (first use in this function)
     175 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp5562.c:175:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/leds/leds-lp5562.c: In function 'lp5562_store_pattern':
   drivers/leds/leds-lp5562.c:272:33: error: macro "guard" passed 2 arguments, but takes just 1
     272 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp5562.c:272:9: error: 'guard' undeclared (first use in this function)
     272 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp5562.c: In function 'lp5562_store_engine_mux':
   drivers/leds/leds-lp5562.c:324:33: error: macro "guard" passed 2 arguments, but takes just 1
     324 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp5562.c:324:9: error: 'guard' undeclared (first use in this function)
     324 |         guard(mutex, &chip->lock);
         |         ^~~~~
--
   drivers/leds/leds-lp5569.c: In function 'lp5569_selftest':
>> drivers/leds/leds-lp5569.c:400:33: error: macro "guard" passed 2 arguments, but takes just 1
     400 |         guard(mutex, &chip->lock);
         |                                 ^
   In file included from drivers/leds/leds-lp5569.c:7:
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
>> drivers/leds/leds-lp5569.c:400:9: error: 'guard' undeclared (first use in this function)
     400 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp5569.c:400:9: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_led_brightness':
>> drivers/leds/leds-lp55xx-common.c:276:33: error: macro "guard" passed 2 arguments, but takes just 1
     276 |         guard(mutex, &chip->lock);
         |                                 ^
   In file included from drivers/leds/leds-lp55xx-common.c:13:
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
>> drivers/leds/leds-lp55xx-common.c:276:9: error: 'guard' undeclared (first use in this function)
     276 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c:276:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_multicolor_brightness':
   drivers/leds/leds-lp55xx-common.c:291:33: error: macro "guard" passed 2 arguments, but takes just 1
     291 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:291:9: error: 'guard' undeclared (first use in this function)
     291 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c: In function 'led_current_store':
   drivers/leds/leds-lp55xx-common.c:409:33: error: macro "guard" passed 2 arguments, but takes just 1
     409 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:409:9: error: 'guard' undeclared (first use in this function)
     409 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c: In function 'run_engine_store':
   drivers/leds/leds-lp55xx-common.c:637:33: error: macro "guard" passed 2 arguments, but takes just 1
     637 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:637:9: error: 'guard' undeclared (first use in this function)
     637 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_engine_mode':
   drivers/leds/leds-lp55xx-common.c:676:33: error: macro "guard" passed 2 arguments, but takes just 1
     676 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:676:9: error: 'guard' undeclared (first use in this function)
     676 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_engine_load':
   drivers/leds/leds-lp55xx-common.c:704:33: error: macro "guard" passed 2 arguments, but takes just 1
     704 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:704:9: error: 'guard' undeclared (first use in this function)
     704 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_engine_leds':
   drivers/leds/leds-lp55xx-common.c:803:33: error: macro "guard" passed 2 arguments, but takes just 1
     803 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:803:9: error: 'guard' undeclared (first use in this function)
     803 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c:798:17: warning: unused variable 'ret' [-Wunused-variable]
     798 |         ssize_t ret;
         |                 ^~~
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_show_master_fader':
   drivers/leds/leds-lp55xx-common.c:827:33: error: macro "guard" passed 2 arguments, but takes just 1
     827 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:827:9: error: 'guard' undeclared (first use in this function)
     827 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_master_fader':
   drivers/leds/leds-lp55xx-common.c:851:33: error: macro "guard" passed 2 arguments, but takes just 1
     851 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:851:9: error: 'guard' undeclared (first use in this function)
     851 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_show_master_fader_leds':
   drivers/leds/leds-lp55xx-common.c:870:33: error: macro "guard" passed 2 arguments, but takes just 1
     870 |         guard(mutex, &chip->lock);
         |                                 ^
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:870:9: error: 'guard' undeclared (first use in this function)
     870 |         guard(mutex, &chip->lock);
         |         ^~~~~
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_master_fader_leds':
   drivers/leds/leds-lp55xx-common.c:901:33: error: macro "guard" passed 2 arguments, but takes just 1
     901 |         guard(mutex, &chip->lock);
         |                                 ^


vim +/guard +189 drivers/leds/leds-lp5521.c

   180	
   181	static ssize_t lp5521_selftest(struct device *dev,
   182				       struct device_attribute *attr,
   183				       char *buf)
   184	{
   185		struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
   186		struct lp55xx_chip *chip = led->chip;
   187		int ret;
   188	
 > 189		guard(mutex, &chip->lock);
   190	
   191		ret = lp5521_run_selftest(chip, buf);
   192	
   193		return sysfs_emit(buf, "%s\n", ret ? "FAIL" : "OK");
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

