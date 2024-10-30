Return-Path: <linux-leds+bounces-3204-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A329B6DBE
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2024 21:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69580282017
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2024 20:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F731D1732;
	Wed, 30 Oct 2024 20:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCgyMKza"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618D41BD9EF;
	Wed, 30 Oct 2024 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730320481; cv=none; b=IcSJtZAa/Bznti2O/vf8WiepnraaXPqiYwRGjQQNHuZUgumvBKCbPxUDhWpXiLXd2tVckPDl0XvMxopB5mmYhtTCiVfVYm7U0Ydoyk01Cco9AS8wuB9E8U3CyuoNCpZKISeQbWfQ3predTb14y1/73ijXYolr04PLsinh3DhcVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730320481; c=relaxed/simple;
	bh=EJJO/HKqSPcRZoRs7N53d81QbG0Ckyd+9nHPbb89Xo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj0h9vvc90aKQt1NCsjU9iQoiHhttstJ2HbKBBnDYfSjvzPIyb+whxjwuVYlRCC4QPjk20APvCFsLqOEhSOk56+aL55QDHMyGkGi4fZk+rvSoK2MmwmgfQZFoDEnXBksU2cX8Z7mMk1amMvXGrvx0Ycx9TDHjig+5ny7y1p9pwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCgyMKza; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730320479; x=1761856479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EJJO/HKqSPcRZoRs7N53d81QbG0Ckyd+9nHPbb89Xo4=;
  b=hCgyMKza1YpBJDioBdWMTrI9Xpi/JObdWpcrPUT8dZBD78AC/kiXnpfQ
   WZ5HldmXNgt95VE0DPsLJxuFGyOslIr7JVAoM0rhKJ9gvOciOpXXGo9CX
   ALZDzBuhW7SsweFG3DuOgLGS28wdGdF33JGu3F8H4WnOUDQ7Idg1TKuJz
   8WqjLacJA8ap4mkPL30hO2kQ4aJeX7OUq9wjD32t9CJezG2SspSAg0xTm
   8bieq/ddz4LGFY0zAt261/iq6CLFlomT4/keuSusXMTJDDBh/GRIeM7YO
   3JtnfuTCppPQOSPbCRSzenjIFrUErdNEtdc7kdrl5tuhPOWfI/6GUubS1
   A==;
X-CSE-ConnectionGUID: rq8AyO69RfyRJ2C3Lwuevg==
X-CSE-MsgGUID: iJxNQOrSRLaALWjYm8NYEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="41440268"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="41440268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 13:34:38 -0700
X-CSE-ConnectionGUID: Yes14h7CQ0qGk6qKs+ijyg==
X-CSE-MsgGUID: OLkSKFVoQCC7m3bRKRunng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="83247480"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2024 13:34:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6FOg-000fHY-1u;
	Wed, 30 Oct 2024 20:34:30 +0000
Date: Thu, 31 Oct 2024 04:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@ucw.cz>,
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
Subject: Re: [PATCH leds v4 07/12] leds: turris-omnia: Notify sysfs on MCU
 global LEDs brightness change
Message-ID: <202410310400.K6KRpgOx-lkp@intel.com>
References: <20241029135621.12546-8-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029135621.12546-8-kabel@kernel.org>

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc5]
[cannot apply to lee-leds/for-leds-next robh/for-next next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Beh-n/turris-omnia-mcu-interface-h-Move-command-execution-function-to-global-header/20241029-215858
base:   linus/master
patch link:    https://lore.kernel.org/r/20241029135621.12546-8-kabel%40kernel.org
patch subject: [PATCH leds v4 07/12] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
config: x86_64-kismet-CONFIG_TURRIS_OMNIA_MCU_GPIO-CONFIG_LEDS_TURRIS_OMNIA-0-0 (https://download.01.org/0day-ci/archive/20241031/202410310400.K6KRpgOx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241031/202410310400.K6KRpgOx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310400.K6KRpgOx-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TURRIS_OMNIA_MCU_GPIO when selected by LEDS_TURRIS_OMNIA
   WARNING: unmet direct dependencies detected for TURRIS_OMNIA_MCU_GPIO
     Depends on [n]: CZNIC_PLATFORMS [=y] && TURRIS_OMNIA_MCU [=y] && GPIOLIB [=n] && OF [=y]
     Selected by [y]:
     - LEDS_TURRIS_OMNIA [=y] && NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=y] && I2C [=y] && (MACH_ARMADA_38X || COMPILE_TEST [=y]) && OF [=y] && TURRIS_OMNIA_MCU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

