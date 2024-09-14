Return-Path: <linux-leds+bounces-2724-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA6978EF9
	for <lists+linux-leds@lfdr.de>; Sat, 14 Sep 2024 09:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 145261F24245
	for <lists+linux-leds@lfdr.de>; Sat, 14 Sep 2024 07:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4D113AA31;
	Sat, 14 Sep 2024 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKMehX95"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B731328B6;
	Sat, 14 Sep 2024 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726300315; cv=none; b=YGV9YBomYbWVkByzMB5Abtj7sSoZEHzeo/0+uzZo1uKqFjog27yX1EjprPSrxjV64HSJeWP6FBRS8JnoHfsmmSHwhXgAO0R78KFFJFykq3B7PPXUJYKP1hInyha3PkO/krseE+H6oBCvZ1yF6YGcgo9Buh4Z6BwbdjeIS7ei1QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726300315; c=relaxed/simple;
	bh=OKnTmCysulXKbT4ZKNh5klyTLSHK15YdICCeMSP/N9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHuZSxo3hXn1f2rBL+liSdVX95mNAUI1fYG7oM6I2IhNNZ6IcSfggtZzlekO4oCwWlm61Qnw3Vj04XYWSv3x1WvveLE3EaBxEKl9t0VEOgWtjaCfaAz/Nr/j0GAvtA3/Hm7dk2g5ELyDkm7JqIigl8QXRa8TmBgNjugFi2Qb6ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKMehX95; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726300313; x=1757836313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OKnTmCysulXKbT4ZKNh5klyTLSHK15YdICCeMSP/N9o=;
  b=nKMehX95PfBPxIKH33lHFb1DOn+fLhmhPG7nx6Eo+YQG9+xx6Vg4PhSD
   d/0khWzUD53IlBEgjkrkppFqcPcJHkNxFp53SNf2TpcmXcxZOPks5wH08
   d6UG0k1trPayTa5VEprQNaOzOC63Jp187U9ssqOPwh7YsckeWPc/lAoGV
   dnhLL8tVcyOFGsjFXXqZCjpPMAEsb4TMIAhOG9OOxYoIquyyfqqX7DVVw
   VNyZJnJeEo9Tr0+gni84iDbUBwfeIbhZIB+3XDbhpXHAkYPM5/0M001RW
   Ra+aDAlpJpnD4WGu4h6AV0MxznVgJgog30bDm+GxDmZDIW+reDBuiUajd
   g==;
X-CSE-ConnectionGUID: y8GOsAwoTrKhcpTUf11cSg==
X-CSE-MsgGUID: LOw0O1IETP+8JtZHT3Fodg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25329334"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25329334"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 00:51:53 -0700
X-CSE-ConnectionGUID: ZqZxkgsFSfejP6fPpLpfSA==
X-CSE-MsgGUID: 5pLASHcsRF6ca0W7KIuHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68666216"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Sep 2024 00:51:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spNZK-0007Vq-1y;
	Sat, 14 Sep 2024 07:51:46 +0000
Date: Sat, 14 Sep 2024 15:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH leds v3 02/11] leds: turris-omnia: Use command execution
 functions from the MCU driver
Message-ID: <202409141525.4s6yDTJw-lkp@intel.com>
References: <20240913123103.21226-3-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913123103.21226-3-kabel@kernel.org>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240913]
[also build test ERROR on v6.11-rc7]
[cannot apply to lee-leds/for-leds-next robh/for-next linus/master v6.11-rc7 v6.11-rc6 v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Beh-n/turris-omnia-mcu-interface-h-Move-command-execution-function-to-global-header/20240913-203320
base:   next-20240913
patch link:    https://lore.kernel.org/r/20240913123103.21226-3-kabel%40kernel.org
patch subject: [PATCH leds v3 02/11] leds: turris-omnia: Use command execution functions from the MCU driver
config: i386-buildonly-randconfig-002-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141525.4s6yDTJw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141525.4s6yDTJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141525.4s6yDTJw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "omnia_cmd_write_read" [drivers/leds/leds-turris-omnia.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

