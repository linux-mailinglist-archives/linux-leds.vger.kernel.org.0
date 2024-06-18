Return-Path: <linux-leds+bounces-1995-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7979590CB9F
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 14:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C4B71C211F9
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 12:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D9282D6D;
	Tue, 18 Jun 2024 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFUyCilU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D28E46557;
	Tue, 18 Jun 2024 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718713494; cv=none; b=Hg2bomzN2CeP3JdYK8w1KyqgyHy+sFRKmiD3aHv8ivS5i22NIfVbANvIpmZoU/jZCKlNXfGMejIlYiflmtwYalVc5Y9kg6XjfjtyPQ8J73KI0IXtnXrGKL5RgublMkncqnW3fMw1tiIAoyEcGTRsmyvwjr/kAuQHqAHrNurOqqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718713494; c=relaxed/simple;
	bh=o7SwzaL//wOaTtBrzy+LvyipfRZrFJ3fWNXXisi3+aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7ocA6m9wMVyN9tOjrkGsWU6OI8e50AVDFnyVw8Xdi5q782D5StI0QVr8klLxuPf3huvK7+Kc5IR8mOD/JLvc/QRMqIWcDlUvcfbxRUFR5rqZ4Emi4+j9HrnMw6yN58LirThC2IxjURM3YDWjlkralCJc6LaK9PQtIAaawAuTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFUyCilU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718713493; x=1750249493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o7SwzaL//wOaTtBrzy+LvyipfRZrFJ3fWNXXisi3+aM=;
  b=JFUyCilUCH1W+foz5WcEm+ljD392yHc5EBfqggc+j3DLVWCuMw3i1E14
   2pHLdofUM2OcWK5Tv3Uofm5Ie/hLXBjxu3UWMLXHnlo8jRUzwTV6qBck5
   GZu45CQe6nwwoeZdJZYKQfZVg+3V/D8fjSeVyusNAGgDDFWys2Fo0Rxcg
   dM9FsUBQy+zcd/wIS06Xac39wp/oH80CUNBMsgyZ7z5ss8+NVSCCJialY
   vIqCBENB8KHoY+AxBABzmP78xUVKhwjYjQZkNi+6ke1VUbbWPVgvK4u3I
   JO0v2/+33NuSLSsd4NMeAA5OLDK2sg2mwyo4T/954nx/qOrZSfrvkzL5N
   Q==;
X-CSE-ConnectionGUID: Txuk331pToybs8kZge+zZA==
X-CSE-MsgGUID: lhhvniJgRaSPpxfmJPZyJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15348918"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15348918"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 05:24:52 -0700
X-CSE-ConnectionGUID: m9OktrGURPeOhr6uyCNYMQ==
X-CSE-MsgGUID: NAkiw1SDSPmfVTMbRqovZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="46076739"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jun 2024 05:24:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJXtI-0005Ur-1e;
	Tue, 18 Jun 2024 12:24:48 +0000
Date: Tue, 18 Jun 2024 20:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	pavel@ucw.cz, lee@kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/2] leds: Add LED1202 I2C driver
Message-ID: <202406181953.mXAkCdSy-lkp@intel.com>
References: <ZnCoBAG2TNiIz1xE@admins-Air>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnCoBAG2TNiIz1xE@admins-Air>

Hi Vicentiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on robh/for-next linus/master v6.10-rc4 next-20240617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vicentiu-Galanopulo/leds-Add-LED1202-I2C-driver/20240618-052035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/ZnCoBAG2TNiIz1xE%40admins-Air
patch subject: [PATCH v1 2/2] leds: Add LED1202 I2C driver
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240618/202406181953.mXAkCdSy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406181953.mXAkCdSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181953.mXAkCdSy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/leds/leds-led1202.c:7:
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/kernel.h:396:10: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     396 |          BUILD_BUG_ON_ZERO((perms) > 0777) +                                    \
         |          ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:221:26: note: in expansion of macro 'VERIFY_OCTAL_PERMISSIONS'
     221 |                  .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },             \
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:158:52: note: in expansion of macro '__ATTR'
     158 |         struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
         |                                                    ^~~~~~
   drivers/leds/leds-led1202.c:373:8: note: in expansion of macro 'DEVICE_ATTR'
     373 | static DEVICE_ATTR(led_device_regsdump, 0x00444, ll1202_show_all_registers,
         |        ^~~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/kernel.h:399:10: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     399 |          BUILD_BUG_ON_ZERO((((perms) >> 3) & 4) < ((perms) & 4)) +              \
         |          ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:221:26: note: in expansion of macro 'VERIFY_OCTAL_PERMISSIONS'
     221 |                  .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },             \
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:158:52: note: in expansion of macro '__ATTR'
     158 |         struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
         |                                                    ^~~~~~
   drivers/leds/leds-led1202.c:373:8: note: in expansion of macro 'DEVICE_ATTR'
     373 | static DEVICE_ATTR(led_device_regsdump, 0x00444, ll1202_show_all_registers,
         |        ^~~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/kernel.h:396:10: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     396 |          BUILD_BUG_ON_ZERO((perms) > 0777) +                                    \
         |          ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:221:26: note: in expansion of macro 'VERIFY_OCTAL_PERMISSIONS'
     221 |                  .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },             \
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:158:52: note: in expansion of macro '__ATTR'
     158 |         struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
         |                                                    ^~~~~~
   drivers/leds/leds-led1202.c:375:8: note: in expansion of macro 'DEVICE_ATTR'
     375 | static DEVICE_ATTR(patt_sequence_repetition, 0x00444 | 0x00200,
         |        ^~~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/kernel.h:399:10: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     399 |          BUILD_BUG_ON_ZERO((((perms) >> 3) & 4) < ((perms) & 4)) +              \
         |          ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:221:26: note: in expansion of macro 'VERIFY_OCTAL_PERMISSIONS'
     221 |                  .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },             \
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:158:52: note: in expansion of macro '__ATTR'
     158 |         struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
         |                                                    ^~~~~~
   drivers/leds/leds-led1202.c:375:8: note: in expansion of macro 'DEVICE_ATTR'
     375 | static DEVICE_ATTR(patt_sequence_repetition, 0x00444 | 0x00200,
         |        ^~~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/kernel.h:396:10: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     396 |          BUILD_BUG_ON_ZERO((perms) > 0777) +                                    \
         |          ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:221:26: note: in expansion of macro 'VERIFY_OCTAL_PERMISSIONS'
     221 |                  .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },             \
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:158:52: note: in expansion of macro '__ATTR'
     158 |         struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
         |                                                    ^~~~~~
   drivers/leds/leds-led1202.c:378:8: note: in expansion of macro 'DEVICE_ATTR'
     378 | static DEVICE_ATTR(current_mA, 0x00444, ll1202_show_channel_mA_current, NULL);
         |        ^~~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/kernel.h:399:10: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     399 |          BUILD_BUG_ON_ZERO((((perms) >> 3) & 4) < ((perms) & 4)) +              \
         |          ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:221:26: note: in expansion of macro 'VERIFY_OCTAL_PERMISSIONS'
     221 |                  .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },             \
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:158:52: note: in expansion of macro '__ATTR'
     158 |         struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
         |                                                    ^~~~~~
   drivers/leds/leds-led1202.c:378:8: note: in expansion of macro 'DEVICE_ATTR'
     378 | static DEVICE_ATTR(current_mA, 0x00444, ll1202_show_channel_mA_current, NULL);
         |        ^~~~~~~~~~~


vim +16 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10   6  
bc6245e5efd70c Ian Abbott       2017-07-10   7  #ifdef __CHECKER__
bc6245e5efd70c Ian Abbott       2017-07-10   8  #define BUILD_BUG_ON_ZERO(e) (0)
bc6245e5efd70c Ian Abbott       2017-07-10   9  #else /* __CHECKER__ */
bc6245e5efd70c Ian Abbott       2017-07-10  10  /*
bc6245e5efd70c Ian Abbott       2017-07-10  11   * Force a compilation error if condition is true, but also produce a
8788994376d84d Rikard Falkeborn 2019-12-04  12   * result (of value 0 and type int), so the expression can be used
bc6245e5efd70c Ian Abbott       2017-07-10  13   * e.g. in a structure initializer (or where-ever else comma expressions
bc6245e5efd70c Ian Abbott       2017-07-10  14   * aren't permitted).
bc6245e5efd70c Ian Abbott       2017-07-10  15   */
8788994376d84d Rikard Falkeborn 2019-12-04 @16  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
527edbc18a70e7 Masahiro Yamada  2019-01-03  17  #endif /* __CHECKER__ */
527edbc18a70e7 Masahiro Yamada  2019-01-03  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

