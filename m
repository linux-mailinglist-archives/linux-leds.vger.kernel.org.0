Return-Path: <linux-leds+bounces-3770-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B90D0A12BB6
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jan 2025 20:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14D281889B0D
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jan 2025 19:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D4A1D618E;
	Wed, 15 Jan 2025 19:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOpXFj+K"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42A01990C5;
	Wed, 15 Jan 2025 19:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736969085; cv=none; b=iBUoYK24a/+BBw8Scoc9C06aR6alU6pxWoZ4YgpyOwFN0OQkVPkzyT0ynechnVtP8kGfJ5CtaF1glxaPMvcgmZiR6CB2RDJLZXZ1tE9A/Ix8DSoHnQ6iUAPBcaw6Mc4bxHXHKNAZ6PFxcZmHk+/PLiipPnlPed1w2BMsh/cTWhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736969085; c=relaxed/simple;
	bh=H6xUj7nnrVMTbud0sZ3tqjo4aygmlDBeA4scog+cQNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=asMqkYV9MTZxXkuAofLAWvrvnKEn9sITjstQFK4+nDuL+5jza2svZ0emkBfws2zpmA8fe1KElAKtJX8FM5H9Lieex7zHhDh39z7MOK6DstzWS9ZBJ5/2PIVvU22CJRCwEWJf4nsN1mEIxd5QcLMIPtisVmAGzMRnin1LfYQnhw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOpXFj+K; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736969084; x=1768505084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H6xUj7nnrVMTbud0sZ3tqjo4aygmlDBeA4scog+cQNk=;
  b=UOpXFj+KL/caCtB3YZg1AENTIPAYWqUb6xpLmaR+soyT64Fn2QlDGgHH
   IJTwt0LE3pcIbQ+eY5VY43I3T3/7g7eYr+BrQcoO5gjWeGksY658LEC/d
   /CwATnHEl5ds71fxymlJjw7NJp6sXhA3Bl1nH7SqcsU0ZPm+cB4/E5w1X
   Da0bpLCwCandyUZpdQYLkNkFp52MwBbH89M2smZuu1EwhxqsJVxypkNUL
   iv76f/lIkeZHW2ZY2XZ/aCppm9F98tMSnbmbpmbKJlsu8pGEdv8FEh1Os
   G0ViiGZly1Rclt2nXcrQvsR9DmWW4x49s33ZuVNTsbiQvJnubmqKtDe6p
   Q==;
X-CSE-ConnectionGUID: 2WfqCqBrSDWbY6/Qz/XszA==
X-CSE-MsgGUID: TDxdVusQTO2+4Tc4hsMMiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48715359"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="48715359"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 11:24:44 -0800
X-CSE-ConnectionGUID: ILBdaIorRuy9DY60njFqjA==
X-CSE-MsgGUID: OObBibV6SGW6uoIp23/BxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105083260"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jan 2025 11:24:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY90J-000QkZ-1d;
	Wed, 15 Jan 2025 19:24:39 +0000
Date: Thu, 16 Jan 2025 03:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org
Subject: [lee-leds:for-leds-next 26/28] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
Message-ID: <202501160322.jk8PObOP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   daefd7fbd544671ad0b9c2a815d7f5e3d2f0365c
commit: e14d879292b0f7755c0d51b82a19b30859bb080a [26/28] leds: lp8864: Add support for Texas Instruments LP8864, LP8864S, LP8866 LED-backlights
reproduce: (https://download.01.org/0day-ci/archive/20250116/202501160322.jk8PObOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160322.jk8PObOP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

