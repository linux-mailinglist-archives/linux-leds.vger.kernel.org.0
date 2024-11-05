Return-Path: <linux-leds+bounces-3274-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A61909BC3D9
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 04:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4041F21AB8
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 03:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB98185924;
	Tue,  5 Nov 2024 03:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcF7TQHm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C99183CDD;
	Tue,  5 Nov 2024 03:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730777167; cv=none; b=LOjHl8OoNb7c5t3HV0yhbCHv4k+UFSCFrYb9NcetBf0CHKztBZ9yQQljp/dpTX3KDbhI+pGfDXmYafb2+6ZFRKoJ4qf+s47tDohYVAtUFhnom97uVSadPeLbW5oPoNzeTQJL7lVwqfu6Ob7CYLKzZ20eZMaXJOHWAQxYISsTIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730777167; c=relaxed/simple;
	bh=H3V8QZZl/ANZDQGwjdKAQwgsQgaEeVu8bl2VnMkliGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I48NQcd0gFfhrC10q8gVJ4FlxpeHbrr/5IQgn6NZ1+3Ik+MGSBwf/U3QT1IzttFRVG7fYFjh87rKX7EN+QMoNpXPSPDpXKZkX/R8EdbW7erxqLrKImdPBm7IVydIXHrmvx+pNJ450iSqQTNEamLSGmgx9wfu2PIFqST8v6n2q/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcF7TQHm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730777166; x=1762313166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=H3V8QZZl/ANZDQGwjdKAQwgsQgaEeVu8bl2VnMkliGo=;
  b=VcF7TQHmYPE9TQ84fVnX6SL9QgLzVbOjfm7eegMHU1ebqO0DxBJToNrd
   vjREW+uX6sKLF/H3xB8GsXpTwSdlUb5YaN3/lR1yqOJIYBIyIe4ujvSXU
   Im5rKwhSVHF7rCipBf93k7vTJKacObGsqigQqPn8qOTdcp78qPaC+Dz4A
   PJtan95YOlNeNCLJwSoovuRF0yToR4tY7ovc79WS7EqysSK/M3TYd+z1/
   cyMVqZOsJl8awxZRX2d39PtltD2jSeKZdJJLA4LWbQWiAQU0eeZsjNiP/
   CQjsO/f+1wawB6Uspje77U15Hr2LwuKqUsnvJBBrqIUp9nR7E/2yCRfqV
   g==;
X-CSE-ConnectionGUID: bzsdvfzIR5uJPtfSUOQsLg==
X-CSE-MsgGUID: LDIgHQcrS8mo6yd/FMDiGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55906226"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="55906226"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:26:05 -0800
X-CSE-ConnectionGUID: KWHu0FwZTgCqktjXEqHSsA==
X-CSE-MsgGUID: fh5TW4D9QFiGV+bTPr4gmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="87788402"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 19:26:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ACc-000lYH-2e;
	Tue, 05 Nov 2024 03:25:58 +0000
Date: Tue, 5 Nov 2024 11:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH leds v5 07/12] leds: turris-omnia: Notify sysfs on MCU
 global LEDs brightness change
Message-ID: <202411051138.jzDE6sBH-lkp@intel.com>
References: <20241104141924.18816-8-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104141924.18816-8-kabel@kernel.org>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc6]
[cannot apply to lee-leds/for-leds-next robh/for-next next-20241104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Beh-n/turris-omnia-mcu-interface-h-Move-command-execution-function-to-global-header/20241104-223435
base:   linus/master
patch link:    https://lore.kernel.org/r/20241104141924.18816-8-kabel%40kernel.org
patch subject: [PATCH leds v5 07/12] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
config: arm-randconfig-003-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051138.jzDE6sBH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051138.jzDE6sBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051138.jzDE6sBH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_cmd_set_color':
>> include/linux/turris-omnia-mcu-interface.h:275:(.text+0x5a): undefined reference to `omnia_cmd_write_read'
   arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_cmd_read_u16':
   include/linux/turris-omnia-mcu-interface.h:311:(.text+0xaa): undefined reference to `omnia_cmd_write_read'
   arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `gamma_correction_show':
   include/linux/turris-omnia-mcu-interface.h:311:(.text+0x1a2): undefined reference to `omnia_cmd_write_read'
   arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `omnia_cmd_write_u8':
   include/linux/turris-omnia-mcu-interface.h:275:(.text+0x1c8): undefined reference to `omnia_cmd_write_read'
   arm-linux-gnueabi-ld: drivers/leds/leds-turris-omnia.o: in function `brightness_show':
   include/linux/turris-omnia-mcu-interface.h:311:(.text+0x4c2): undefined reference to `omnia_cmd_write_read'


vim +275 include/linux/turris-omnia-mcu-interface.h

9f74fe5691025f Marek Behún 2024-11-04  267  
9f74fe5691025f Marek Behún 2024-11-04  268  int omnia_cmd_write_read(const struct i2c_client *client,
9f74fe5691025f Marek Behún 2024-11-04  269  			 void *cmd, unsigned int cmd_len,
9f74fe5691025f Marek Behún 2024-11-04  270  			 void *reply, unsigned int reply_len);
9f74fe5691025f Marek Behún 2024-11-04  271  
9f74fe5691025f Marek Behún 2024-11-04  272  static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
9f74fe5691025f Marek Behún 2024-11-04  273  				  unsigned int len)
9f74fe5691025f Marek Behún 2024-11-04  274  {
9f74fe5691025f Marek Behún 2024-11-04 @275  	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
9f74fe5691025f Marek Behún 2024-11-04  276  }
9f74fe5691025f Marek Behún 2024-11-04  277  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

