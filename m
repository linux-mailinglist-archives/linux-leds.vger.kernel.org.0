Return-Path: <linux-leds+bounces-2225-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B85C92BEF9
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2024 17:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD43D1F242E4
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2024 15:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63F519D89E;
	Tue,  9 Jul 2024 15:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CU8ElfN5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03619D89D
	for <linux-leds@vger.kernel.org>; Tue,  9 Jul 2024 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720540720; cv=none; b=j3UqPbR2G+R2/3+nYu6fTjLrb2yagKerfAjGO/RjsNca4MtE2ueRKY5vbJ5BmwB1PcqM3RUfOFPKPPHjAkwYUeRq2+kjjLdV8aRgTJDG/XKSYmKhOwRn5U/RwNDklU+mm5CubRvKgU4ZF/c9FVeFU9c1a0hKTXRz7VnK3MDkXTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720540720; c=relaxed/simple;
	bh=WcM3XtJpC23p/eycXG9yt83ylI33UeksYD/uyggtCAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVpW8pdEFG7D0gksuK1o0bRyWGaW5lzqNNJbzY2nzIrWOw9OWn6k+ArwXD54hpTPkRFLjXQZwYPMKyzqAuyvZ1cKdPea22M1/N3FEuIMhOrI8pAuX396unIP5DGwNevYN7oInNps8gGyR0YUyU1Kehm2d+aMQvUUsU12ZWBCrSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CU8ElfN5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720540719; x=1752076719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WcM3XtJpC23p/eycXG9yt83ylI33UeksYD/uyggtCAs=;
  b=CU8ElfN5sQ9shj7RuN1HzQLpQXaNjXFyAl3T2W3wgbCwmAexsBHPzn0G
   up8XmYCabbByxJYNNNDXCs5/CvqXRql8U2Vie8IGd3cZwkKbmhX8V3MB+
   XQ/PH45Km7CrGz/3+oPhbHLoi3DSgGAjcyVYiRpU9NoXWoFxOXsQQf5xa
   aj8rQYyqtrA18qFRFQUETM5h4isZI5xQCOXy8tGSIAqpgqZMG/BXOr1sY
   yqBm2z6HSHsXpa6DE9WIUP6FaVyjvcEMlZgfjJnWA2W22IkDh9VTpZs/M
   LoiyCs1nSqPCp7xzA7KKvYmhWjO33Wokp7IqNMA3R9bH9Yl92WMOSgpIA
   Q==;
X-CSE-ConnectionGUID: EkB4U+AcTTaMSX9YtY2qww==
X-CSE-MsgGUID: Fb45IUddQQ+GYwa/xcNpbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17913361"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="17913361"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 08:58:38 -0700
X-CSE-ConnectionGUID: jjciNo+TRbKSM/+5Xb30Wg==
X-CSE-MsgGUID: m7dbOsfATUil5PUcJHnNVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="47783294"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jul 2024 08:58:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRDEg-000Wom-1Y;
	Tue, 09 Jul 2024 15:58:34 +0000
Date: Tue, 9 Jul 2024 23:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 61/62]
 drivers/leds/leds-lp55xx-common.c:798:17: warning: unused variable 'ret'
Message-ID: <202407092320.CLSkqq2U-lkp@intel.com>
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240709/202407092320.CLSkqq2U-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092320.CLSkqq2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407092320.CLSkqq2U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_led_brightness':
   drivers/leds/leds-lp55xx-common.c:276:33: error: macro "guard" passed 2 arguments, but takes just 1
     276 |         guard(mutex, &chip->lock);
         |                                 ^
   In file included from drivers/leds/leds-lp55xx-common.c:13:
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:276:9: error: 'guard' undeclared (first use in this function)
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
>> drivers/leds/leds-lp55xx-common.c:798:17: warning: unused variable 'ret' [-Wunused-variable]
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
   include/linux/cleanup.h:163: note: macro "guard" defined here
     163 | #define guard(_name) \
         | 
   drivers/leds/leds-lp55xx-common.c:901:9: error: 'guard' undeclared (first use in this function)
     901 |         guard(mutex, &chip->lock);
         |         ^~~~~


vim +/ret +798 drivers/leds/leds-lp55xx-common.c

8913c2c1472885 Christian Marangi 2024-06-26  789  
8913c2c1472885 Christian Marangi 2024-06-26  790  ssize_t lp55xx_store_engine_leds(struct device *dev,
8913c2c1472885 Christian Marangi 2024-06-26  791  				 struct device_attribute *attr,
8913c2c1472885 Christian Marangi 2024-06-26  792  				 const char *buf, size_t len, int nr)
8913c2c1472885 Christian Marangi 2024-06-26  793  {
8913c2c1472885 Christian Marangi 2024-06-26  794  	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
8913c2c1472885 Christian Marangi 2024-06-26  795  	struct lp55xx_chip *chip = led->chip;
8913c2c1472885 Christian Marangi 2024-06-26  796  	struct lp55xx_engine *engine = &chip->engines[nr - 1];
8913c2c1472885 Christian Marangi 2024-06-26  797  	u16 mux = 0;
8913c2c1472885 Christian Marangi 2024-06-26 @798  	ssize_t ret;
8913c2c1472885 Christian Marangi 2024-06-26  799  
8913c2c1472885 Christian Marangi 2024-06-26  800  	if (lp55xx_mux_parse(chip, buf, &mux, len))
8913c2c1472885 Christian Marangi 2024-06-26  801  		return -EINVAL;
8913c2c1472885 Christian Marangi 2024-06-26  802  
efd0d1cbb8c5dd Christian Marangi 2024-06-27  803  	guard(mutex, &chip->lock);
8913c2c1472885 Christian Marangi 2024-06-26  804  
8913c2c1472885 Christian Marangi 2024-06-26  805  	chip->engine_idx = nr;
8913c2c1472885 Christian Marangi 2024-06-26  806  
8913c2c1472885 Christian Marangi 2024-06-26  807  	if (engine->mode != LP55XX_ENGINE_LOAD)
efd0d1cbb8c5dd Christian Marangi 2024-06-27  808  		return -EINVAL;
8913c2c1472885 Christian Marangi 2024-06-26  809  
8913c2c1472885 Christian Marangi 2024-06-26  810  	if (lp55xx_load_mux(chip, mux, nr))
efd0d1cbb8c5dd Christian Marangi 2024-06-27  811  		return -EINVAL;
8913c2c1472885 Christian Marangi 2024-06-26  812  
efd0d1cbb8c5dd Christian Marangi 2024-06-27  813  	return len;
8913c2c1472885 Christian Marangi 2024-06-26  814  }
8913c2c1472885 Christian Marangi 2024-06-26  815  EXPORT_SYMBOL_GPL(lp55xx_store_engine_leds);
8913c2c1472885 Christian Marangi 2024-06-26  816  

:::::: The code at line 798 was first introduced by commit
:::::: 8913c2c14728851f110e0d439d5bb2360c767cd2 leds: leds-lp55xx: Generalize sysfs engine_leds

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

