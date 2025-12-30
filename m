Return-Path: <linux-leds+bounces-6505-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEDDCEA0E9
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 16:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A34A73019861
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 15:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5FC31814F;
	Tue, 30 Dec 2025 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWbCDAsn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A1A31A805;
	Tue, 30 Dec 2025 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767108321; cv=none; b=dfPBn7uIx53tNlQKv7+DeswLBd0bscoBon9leyj3E8UQK4wWxwPvX5Ptz5ZSNBcTe1C0pHw2Dc3E1oXe+YwktpBA5Derq52+PF3vJJeXMiOT6pA+8QfKstSO/7iM6tNO+jG+B6HsLqNcbd7OP0B0yFdlfktBcvhHw2co8DPU57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767108321; c=relaxed/simple;
	bh=ZqbA6nUDnUdFyV4LkDbBdEmO08Welgfq/XwaU5W57iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmSU7JfnPnx3vjH4HrU4/N0XfhgroNA0DSTNYTsLmHkzsHyvZrkLRfC3RdGKtDoCfXQIeTupz4Rd/8Rae+b1G7T0lH3dbUj1oFYaeh8n0mtPDhJ0/qU8FI9vcLPYXLcufewEo2RLFPj3SvmnEdATPN8jhR16oI5+R1V6ffmFm8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWbCDAsn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767108319; x=1798644319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZqbA6nUDnUdFyV4LkDbBdEmO08Welgfq/XwaU5W57iU=;
  b=lWbCDAsnMdCHx10caKDoYUVKL4hQ5gBMNnyyTxoYdjAgHAxbTBMf+8vT
   o+/if7jOq1cKiiDdlZbQemho/ou6SIxgFzKdwM+hUJ3FKEYg2cQ0sZaON
   QFjsqaXynmfkdJNp1pd2wlW2C6hCEbPmzcD2zk8dZW00Q+WzkAsaf7T6v
   kH8CHimOWbaJcDm94Nkxr+EYNd2/PFrWgztom1mTl6XH3CR2UmXIslgaq
   dTtgCY3MH1y0Ph3KOe+vOXtfMYQ5MYt0ViXIV40sFxKLT2b9UQ0kftRg1
   MvtP4kblFfBC4TroQTpEGIzyTMrWvyDKXcuJ9g39YRJDADOyTTaouuPyH
   g==;
X-CSE-ConnectionGUID: RV78GvlfT3qeEb2kvacI9w==
X-CSE-MsgGUID: G0A+rswvQ+2IKq5mnmlZGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79329352"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="79329352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 07:25:18 -0800
X-CSE-ConnectionGUID: FOHDo+n2Scak+p1mvWsoRw==
X-CSE-MsgGUID: Xe81eXFPTgeuETYn6SPEGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="200450116"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Dec 2025 07:25:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vabay-000000007yG-1nDQ;
	Tue, 30 Dec 2025 15:25:12 +0000
Date: Tue, 30 Dec 2025 16:24:42 +0100
From: kernel test robot <lkp@intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 5/7] leds: Add driver documentation for
 leds-group-virtualcolor
Message-ID: <202512301647.ZJAvxMiU-lkp@intel.com>
References: <20251230003250.1197744-6-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230003250.1197744-6-professorjonny98@gmail.com>

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-leds-add-function-virtual_status-to-led-common-properties/20251230-083649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251230003250.1197744-6-professorjonny98%40gmail.com
patch subject: [PATCH v4 5/7] leds: Add driver documentation for leds-group-virtualcolor
reproduce: (https://download.01.org/0day-ci/archive/20251230/202512301647.ZJAvxMiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301647.ZJAvxMiU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/i2c-atr.h
   WARNING: No kernel-doc for file ./include/linux/i2c-atr.h
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
>> Documentation/leds/leds-group-virtualcolor.rst:319: WARNING: Inline emphasis start-string without end-string. [docutils]
   ERROR: Cannot find file ./include/linux/livepatch.h
   WARNING: No kernel-doc for file ./include/linux/livepatch.h
   ERROR: Cannot find file ./include/linux/seqlock.h
   WARNING: No kernel-doc for file ./include/linux/seqlock.h
   ERROR: Cannot find file ./include/linux/damon.h
--
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/leds/leds-group-virtualcolor.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +319 Documentation/leds/leds-group-virtualcolor.rst

   317	
   318	``enable_debugfs`` (bool, default: y if CONFIG_DEBUG_FS)
 > 319	    Enable debugfs diagnostics interface at /sys/kernel/debug/leds-group-virtualcolor-*/
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

