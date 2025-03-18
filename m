Return-Path: <linux-leds+bounces-4307-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC0A671A7
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 11:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36A1D1638B7
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 10:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AB2208960;
	Tue, 18 Mar 2025 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k099dM24"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4882F206F3F;
	Tue, 18 Mar 2025 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294492; cv=none; b=UZOK0WlCUSvmWB/3410qzNS3UElk9aT6rgWApxy9URgEjSz0A1IgoTAABkodNCSZCx7Jx1oweQUYnJBT9HqpKYf1BFGaJwchDEpXHTW2p31ZsbIsVklEKwhMiB91la0tJVie/EyC+pwUvAn1W6bf2Z937CUHYYBMBGdHtA661tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294492; c=relaxed/simple;
	bh=aOjgQK7Ude80JfmikgpQVtFWBZtq85DlKjHiQLOg0YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbE5Ypsu2woMrXMo271K9nDzUFhWCML6I1q9u9dc4GxLVMGfxgZkneEWz2zYcomfC2pJcsc4TmULeFeBk0PBc3NyZHXFLLj7wgESKQQqYaS4ru9NIwdGmRaFhavjbSQievi3xzOe0bIQfyTmjcWytri9l97yf40F305USBH2br8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k099dM24; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742294490; x=1773830490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aOjgQK7Ude80JfmikgpQVtFWBZtq85DlKjHiQLOg0YA=;
  b=k099dM24GWpYxTc9h2pE1Qgco0pMlLqbf0gmkEgmJ4jzv3/8UH8aziXQ
   CTpHxIYrRINxodEMPVhxhlcFqJBsvHkzinWksFV0gZi1XJj/OgZPFQm5v
   ExOGmgUNb98diniXo+zbtl61wv7RjzC/HwkwuxUp8eUkq67WyyNqcG3iz
   ifzaioiAUWqpHW2/8gERY5RqQk9pWXI2Rc6QQjCZsrb/CkoYbOTAz73OX
   awluvxCn8sruaVaGr0+eaCwVC8oYlPXJvfAC+SjBKLD+of7rfiDRPTUKW
   ef7KSDDT8ncawlyv4N7m0w0ADjBDyX/ses8LDXkqsVO5+yH4Ws3HfWadU
   w==;
X-CSE-ConnectionGUID: JDYfnDXqQACrZ6Ikg0M6BQ==
X-CSE-MsgGUID: +MynRS48QI+onKlTuoNQAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="47315403"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="47315403"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:41:30 -0700
X-CSE-ConnectionGUID: euXp82s9S3yMC/+STDo4lA==
X-CSE-MsgGUID: 3iwXdJFWQq+PDsarHJGZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="159390807"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2025 03:41:27 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuUNw-000Dfn-1q;
	Tue, 18 Mar 2025 10:41:24 +0000
Date: Tue, 18 Mar 2025 18:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Matthias Fend <matthias.fend@emfend.at>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthias Fend <matthias.fend@emfend.at>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
Message-ID: <202503181835.693ZAgp6-lkp@intel.com>
References: <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>

Hi Matthias,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthias-Fend/dt-bindings-leds-add-Texas-Instruments-TPS6131x-flash-LED-driver/20250318-154318
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250318-leds-tps6131x-v2-2-bc09c7a50b2e%40emfend.at
patch subject: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver
reproduce: (https://download.01.org/0day-ci/archive/20250318/202503181835.693ZAgp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181835.693ZAgp6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

