Return-Path: <linux-leds+bounces-3522-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6169E8A03
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 04:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58A5B164838
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 03:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1341553BC;
	Mon,  9 Dec 2024 03:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfC+8GJA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF3155325;
	Mon,  9 Dec 2024 03:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733716330; cv=none; b=Bk+puyUjWJegGL1Rw/5eGWJ10TjIWI1ncwOJhm22iEAb333+6wvAzcw5e71RlHx9Xkqzs0hjKXfrGaLyjZMVfFsQwUjjU0n8utmCqTRLa1QNfDxu6PnH3hgPuZPUVB8551S6xYCc+Jy3lTEZKbEQMFTFu8rLckBeN/1SEv22De4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733716330; c=relaxed/simple;
	bh=YuoC4uqSmc3wJVKeMeSTSV3DE3gZxiW5N310Ppia3gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvPaObxWzJBzIg+F8bTVgFaTim3rUzZb1eNXxiiFLnLPPZZyXGi760UeDYDOeCq7MQmjcu1rpBVLd1yRaMeP0e/Yv/j3Ctej+kROb1oCz09eG3NPO8G0LMdirvv1MvlJFCNeEOFxJtyt/XO4/zbtjf/XTH1ByTwerpHPjq0VHzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfC+8GJA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733716329; x=1765252329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YuoC4uqSmc3wJVKeMeSTSV3DE3gZxiW5N310Ppia3gc=;
  b=OfC+8GJAOtWTxlOdbHhtXuoQU8IywRP2ixCHrcaPqQth1Rc8llKGN2hm
   i7ItvG0d6Cw6Elk5EpfQWm9cOd9E7s9B2Np0PUZDYCi8UGI1mH5txovQv
   80CUewVryWjWJ7bfbi11+zyEzYLfnTTXfEtZx8wdHZ2c078MKsm21mP5d
   g3BdAoxAMzCJXgL0zWslj6rI00KPe2qcJAvkMN1dpXjpR5b5tNGxFHkdE
   GDTlIg2LT/NR3DzcRYPeSuoBqUBfQu7zwSTL49kaWdP7tW2D1Y3DQjSx2
   ewhgqTJhTBfLjI8OMwtLTK0PKKXTiNOd4ShmVCn1uebEEmSJHSWsamYqw
   A==;
X-CSE-ConnectionGUID: 8LmN7YbkQUmfQbNJzuTR8g==
X-CSE-MsgGUID: MB26PqZ6Q3KhyV+p8XGc2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37928662"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37928662"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:52:08 -0800
X-CSE-ConnectionGUID: 61mX5yYjSXSM468V+JKzcA==
X-CSE-MsgGUID: SAu8U3K1RMygi8HUgCDklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99898167"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2024 19:52:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUoS-0003kr-16;
	Mon, 09 Dec 2024 03:52:00 +0000
Date: Mon, 9 Dec 2024 11:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Chan <towinchenmi@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Message-ID: <202412070751.g7TFM5AI-lkp@intel.com>
References: <20241206172735.4310-4-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172735.4310-4-towinchenmi@gmail.com>

Hi Nick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Chan/dt-bindings-leds-backlight-apple-dwi-bl-Add-bindings-for-Apple-DWI-backlight/20241207-013254
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241206172735.4310-4-towinchenmi%40gmail.com
patch subject: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070751.g7TFM5AI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070751.g7TFM5AI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/video/backlight/apple,dwi-bl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

