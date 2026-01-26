Return-Path: <linux-leds+bounces-6757-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP+wD6X8dmk1aAEAu9opvQ
	(envelope-from <linux-leds+bounces-6757-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 06:33:25 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 893B7842A6
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 06:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 297813006385
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 05:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094AB2264CA;
	Mon, 26 Jan 2026 05:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHZTjYSm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93321DF965;
	Mon, 26 Jan 2026 05:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769405600; cv=none; b=MGRVDtR9TvzQeg0s2eG0n6v30YuDMMKrXENdoM95ct9+qAc6ziE1X9+HmkMhdipDuhjmsnrvT5IBuzw2O34TmHJNZLP+7v0CmTJcQagsvZttVwphynVrwcuKONRQTz/mH2e74PebEULn/HHOkkB56vJ/IrjagGPLJ3Gh8EJbnLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769405600; c=relaxed/simple;
	bh=4aqjgCu5SeNEXBLFBJX2EQq64BfaRXnKoDhZ2dmnO24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1zZbXAfUFAzvC2erR9mc+sFELHxquhJIdhbVNLVSB2hOoaEhi4rZaMyHt/QQ18g6/rJDOuheBvbN8EEIUrmyvAslwN73YfcxfT5mCgvrWWKPY7uBpFh0IDSJUmNu3U5dj2xOxwkcSspyuehzZpFSNcPtM7lS+kQI/9A0PXxPWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHZTjYSm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769405600; x=1800941600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4aqjgCu5SeNEXBLFBJX2EQq64BfaRXnKoDhZ2dmnO24=;
  b=DHZTjYSm3qB+m2T98VCm1mAb4SbMcqqYHOhNV85iGUpJDaU/eRIhkcWc
   NT6mwryCCTrjlXrfjDvDrTzi1JfWA5rXOJTJj2961dNjMq3STXjypljsw
   sNUvyZSSRaYeADOD4HNoItmtrQG0FwBji/BGqLLrP8y9fkrwGFfuuxrrm
   +eBKhxu1LqXwK2B2BOLt78OW3bOKGWkHv8jkqRdEz6M1YsYHz0HdHQR6A
   ruEyPfoZWtPXEl8lt5BgaU8njDDjbZETDS3mCL3oAcJ2gh4slJoVe1/jP
   2yvgve7DCY+y8MW+RWqN++qfYns5BahtoG/gVX3mQANd97N4XfMoTJUBu
   Q==;
X-CSE-ConnectionGUID: arrl0kI5R5mAxugB92oKng==
X-CSE-MsgGUID: PaTWRcbKTrCtwlwauTG5wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="87997200"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="87997200"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 21:33:20 -0800
X-CSE-ConnectionGUID: FetV0OGiTmqyAW2Q7MrL8g==
X-CSE-MsgGUID: pjFNdMPoS7mUDhCi/p7OYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207625118"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 25 Jan 2026 21:33:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkFDu-000000001RR-1sPW;
	Mon, 26 Jan 2026 05:33:14 +0000
Date: Mon, 26 Jan 2026 06:32:40 +0100
From: kernel test robot <lkp@intel.com>
To: Edelweise Escala <edelweise.escala@analog.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Edelweise Escala <edelweise.escala@analog.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Message-ID: <202601260612.NJz5tr4d-lkp@intel.com>
References: <20260126-ltc3220-driver-v4-1-c59517206c24@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-ltc3220-driver-v4-1-c59517206c24@analog.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6757-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 893B7842A6
X-Rspamd-Action: no action

Hi Edelweise,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8856d7fe1758937ac528770f552ec58c388c255b]

url:    https://github.com/intel-lab-lkp/linux/commits/Edelweise-Escala/dt-bindings-leds-Add-LTC3220-18-channel-LED-Driver/20260126-081329
base:   8856d7fe1758937ac528770f552ec58c388c255b
patch link:    https://lore.kernel.org/r/20260126-ltc3220-driver-v4-1-c59517206c24%40analog.com
patch subject: [PATCH v4 1/2] dt-bindings: leds: Add LTC3220 18 channel LED Driver
reproduce: (https://download.01.org/0day-ci/archive/20260126/202601260612.NJz5tr4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260612.NJz5tr4d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-mdp.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

