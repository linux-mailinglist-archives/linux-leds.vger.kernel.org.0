Return-Path: <linux-leds+bounces-6850-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OLCCdyGhWmdDAQAu9opvQ
	(envelope-from <linux-leds+bounces-6850-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 07:14:52 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 716C0FA95A
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 07:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4387F30015B6
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 06:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164462F6184;
	Fri,  6 Feb 2026 06:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMrr2EIj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8329AB00
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 06:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770358488; cv=none; b=dKqQUY96Geqz9mzs7SLmVBKK88zk8gs2wt1wK0d//+m22s36+HbUlv2aYQKJbxja48hmtkDuWZhFowEFFuaILN4TqErxuk+iXJu/yF7ex7YwZK/Awaa8zecSPcn4GlCPEJP1pXfj7Lpf3kRrSMOvzaIGQIZUrFSc8YXvpIzKjPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770358488; c=relaxed/simple;
	bh=XlgdOKMlZmRSCpxz/qIiGZXCCGTFSsXDxT2NSP2HiWc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NV30F+eYlrT1C2TNGcb/YF7uzoMaNisL8/HQkIxZX2fLaQ4/q0dJkwtuRN3WT+Q6xf6/iuqBkIV06Jyz5L8lCFho1HDrr8skvS7e0djYrAOJmiTOmO56tS6/Sp9z1afVmOZrgL2XE5mGwy/sLkwFIxFbt2tO/XfFtKIHTUrO0Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMrr2EIj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770358488; x=1801894488;
  h=date:from:to:cc:subject:message-id;
  bh=XlgdOKMlZmRSCpxz/qIiGZXCCGTFSsXDxT2NSP2HiWc=;
  b=jMrr2EIjN0xdiuTsuktJuJcnWK4Vrg3RgGQp5GCP+XLqbBQZLXjT47ls
   z+UfLrtZby9oQ4+xSIjFLnCMTNs1AnthcCxVjGGmExQc4YtOG4OdXvpoV
   tCPQao2vhcSQTqGO5kYx1UcOrpwatKdYyUG3r5qC+Q3hdgLc35LBptbDf
   rxhtqsSlzM4jVNXmL+hVFRq6t3OI+flWH/Ir1CCFek8MXylk9c7ly0Yfn
   E/0xl7np652050XAGDyU7aKQ+46Tsz/IROw16ztippdmJ0oc/F4d7v1gz
   v88QtKR84aYjPKLxeQsljfD/iCgGQouM9UaxnmNRJiG2VuYO1RYR+F/v+
   A==;
X-CSE-ConnectionGUID: +Ddh97W5Rj6AV3cd7xUhFA==
X-CSE-MsgGUID: hkBYNrssTsuF4xHVcx9GaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71743697"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71743697"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 22:14:47 -0800
X-CSE-ConnectionGUID: qHppp+lHQWS4iD7TOLCAZQ==
X-CSE-MsgGUID: +2zZr7O+RXynL6QP4KsgMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="215304535"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2026 22:14:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voF75-00000000kTc-14RJ;
	Fri, 06 Feb 2026 06:14:43 +0000
Date: Fri, 06 Feb 2026 14:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next-next] BUILD REGRESSION
 129f82752bcecd554936209aac4dbdd888e92224
Message-ID: <202602061455.wf4ClWab-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6850-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 716C0FA95A
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next-next
branch HEAD: 129f82752bcecd554936209aac4dbdd888e92224  leds: multicolor: Limit intensity to max_brightness of LED

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202602060923.xIgdQXjI-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202602061003.VsMdbQy5-lkp@intel.com

    include/linux/compiler_types.h:630:45: error: call to '__compiletime_assert_186' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:38: error: call to '__compiletime_assert_176' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:38: error: call to '__compiletime_assert_178' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:38: error: call to '__compiletime_assert_181' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:38: error: call to '__compiletime_assert_207' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:38: error: call to '__compiletime_assert_217' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:38: error: call to '__compiletime_assert_250' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:38: error: call to '__compiletime_assert_279' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:38: error: call to '__compiletime_assert_293' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:38: error: call to '__compiletime_assert_366' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_185' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_186' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_187' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_192' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_196' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_200' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_212' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_222' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_251' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_253' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_287' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_289' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_360' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_389' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_416' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_493' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_524' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_533' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_566' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:649:45: error: call to '__compiletime_assert_642' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:38: error: call to '__compiletime_assert_275' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:38: error: call to '__compiletime_assert_614' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_174' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_177' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_181' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_188' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_197' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_199' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_201' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_203' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_208' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_210' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_212' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_214' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_215' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_218' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_222' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_227' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_238' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_254' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_266' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_332' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_334' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_339' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_396' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_432' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_483' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_537' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_545' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
    include/linux/compiler_types.h:705:45: error: call to '__compiletime_assert_631' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error

Unverified Error/Warning (likely false positive, kindly check if interested):

    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_181' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_189' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_200' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_209' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_210' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_211' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_214' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_216' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_218' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_236' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_274' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_292' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_306' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_322' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_333' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_368' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_371' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_384' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_385' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_390' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_392' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_394' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_431' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_549' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_555' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_557' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_561' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_566' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_616' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_680' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_711' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_712' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_725' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
    drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_781' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arc-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arc-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arc-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arc-randconfig-002-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arc-randconfig-r073-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm-randconfig-002-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm-randconfig-003-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm-randconfig-r072-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm64-defconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm64-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm64-randconfig-002-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm64-randconfig-003-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- arm64-randconfig-004-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- csky-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- csky-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- csky-randconfig-002-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- csky-randconfig-r072-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- csky-randconfig-r121-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- hexagon-allmodconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- hexagon-randconfig-002-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- hexagon-randconfig-r061-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- hexagon-randconfig-r064-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- hexagon-randconfig-r073-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-buildonly-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-buildonly-randconfig-003-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-buildonly-randconfig-005-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-randconfig-011-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-randconfig-012-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-randconfig-015-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-randconfig-016-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-randconfig-r064-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-randconfig-r071-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- i386-randconfig-r112-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- loongarch-allmodconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- loongarch-allyesconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- loongarch-randconfig-r062-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- m68k-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- m68k-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- m68k-randconfig-r072-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- m68k-randconfig-r121-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- m68k-randconfig-r122-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- microblaze-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- mips-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- mips-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- nios2-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- nios2-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- nios2-randconfig-r134-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- openrisc-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- parisc-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- parisc-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- parisc-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- parisc-randconfig-002-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- parisc-randconfig-r062-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- powerpc-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- powerpc-randconfig-002-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- riscv-allmodconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- riscv-allyesconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- s390-allmodconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- s390-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- s390-randconfig-002-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- sh-allmodconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- sh-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- sh-randconfig-002-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- sh-randconfig-r113-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- sparc-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- sparc-randconfig-002-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- sparc64-allmodconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- sparc64-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- sparc64-randconfig-002-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- um-allmodconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- um-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- um-randconfig-001-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- um-randconfig-002-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-allmodconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-allyesconfig
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-buildonly-randconfig-001-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-buildonly-randconfig-002-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-buildonly-randconfig-004-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-buildonly-randconfig-005-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-buildonly-randconfig-006-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-001-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-004-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-011-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-012-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-013-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-014-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-016-20260206
|   `-- drivers-leds-led-class-multicolor.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-071-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-074-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-randconfig-161-20260206
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- x86_64-rhel-9.4-bpf
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
|-- xtensa-allyesconfig
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error
`-- xtensa-randconfig-001-20260206
    `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:min(intensity_value-i-led_cdev-max_brightness)-signedness-error

elapsed time: 725m

configs tested: 220
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260206    gcc-8.5.0
arc                   randconfig-002-20260206    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         axm55xx_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          ep93xx_defconfig    clang-22
arm                          exynos_defconfig    clang-22
arm                       multi_v4t_defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                   randconfig-001-20260206    gcc-8.5.0
arm                   randconfig-002-20260206    gcc-8.5.0
arm                   randconfig-003-20260206    gcc-8.5.0
arm                   randconfig-004-20260206    gcc-8.5.0
arm                           sunxi_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260206    gcc-13.4.0
arm64                 randconfig-002-20260206    gcc-13.4.0
arm64                 randconfig-003-20260206    gcc-13.4.0
arm64                 randconfig-004-20260206    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260206    gcc-13.4.0
csky                  randconfig-002-20260206    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260206    clang-22
hexagon               randconfig-002-20260206    clang-22
i386                             alldefconfig    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260206    clang-20
i386        buildonly-randconfig-002-20260206    clang-20
i386        buildonly-randconfig-003-20260206    clang-20
i386        buildonly-randconfig-004-20260206    clang-20
i386        buildonly-randconfig-005-20260206    clang-20
i386        buildonly-randconfig-006-20260206    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260206    gcc-14
i386                  randconfig-002-20260206    gcc-14
i386                  randconfig-003-20260206    gcc-14
i386                  randconfig-004-20260206    gcc-14
i386                  randconfig-005-20260206    gcc-14
i386                  randconfig-006-20260206    gcc-14
i386                  randconfig-007-20260206    gcc-14
i386                  randconfig-011-20260206    clang-20
i386                  randconfig-012-20260206    clang-20
i386                  randconfig-013-20260206    clang-20
i386                  randconfig-013-20260206    gcc-14
i386                  randconfig-014-20260206    clang-20
i386                  randconfig-015-20260206    clang-20
i386                  randconfig-016-20260206    clang-20
i386                  randconfig-017-20260206    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260206    clang-22
loongarch             randconfig-002-20260206    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    clang-22
mips                  decstation_64_defconfig    clang-22
mips                           ip28_defconfig    gcc-15.2.0
mips                      maltasmvp_defconfig    gcc-15.2.0
mips                        vocore2_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260206    clang-22
nios2                 randconfig-002-20260206    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           alldefconfig    clang-22
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260206    gcc-8.5.0
parisc                randconfig-002-20260206    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 canyonlands_defconfig    clang-22
powerpc                 canyonlands_defconfig    gcc-15.2.0
powerpc                    gamecube_defconfig    clang-22
powerpc                  iss476-smp_defconfig    clang-22
powerpc                   lite5200b_defconfig    gcc-15.2.0
powerpc                 mpc832x_rdb_defconfig    clang-22
powerpc                  mpc866_ads_defconfig    gcc-15.2.0
powerpc                      pmac32_defconfig    clang-22
powerpc               randconfig-001-20260206    gcc-8.5.0
powerpc               randconfig-002-20260206    gcc-8.5.0
powerpc64             randconfig-001-20260206    gcc-8.5.0
powerpc64             randconfig-002-20260206    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260206    clang-22
riscv                 randconfig-002-20260206    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260206    clang-22
s390                  randconfig-002-20260206    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260206    clang-22
sh                    randconfig-002-20260206    clang-22
sh                   sh7724_generic_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260206    gcc-12.5.0
sparc                 randconfig-002-20260206    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260206    gcc-12.5.0
sparc64               randconfig-002-20260206    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260206    gcc-12.5.0
um                    randconfig-002-20260206    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260206    gcc-14
x86_64      buildonly-randconfig-002-20260206    gcc-14
x86_64      buildonly-randconfig-003-20260206    gcc-14
x86_64      buildonly-randconfig-004-20260206    gcc-14
x86_64      buildonly-randconfig-005-20260206    gcc-14
x86_64      buildonly-randconfig-006-20260206    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260206    gcc-14
x86_64                randconfig-002-20260206    gcc-14
x86_64                randconfig-003-20260206    gcc-14
x86_64                randconfig-004-20260206    gcc-14
x86_64                randconfig-005-20260206    gcc-14
x86_64                randconfig-006-20260206    gcc-14
x86_64                randconfig-011-20260206    gcc-14
x86_64                randconfig-012-20260206    gcc-14
x86_64                randconfig-013-20260206    gcc-14
x86_64                randconfig-014-20260206    gcc-14
x86_64                randconfig-015-20260206    gcc-14
x86_64                randconfig-016-20260206    gcc-14
x86_64                randconfig-071-20260206    gcc-14
x86_64                randconfig-072-20260206    gcc-14
x86_64                randconfig-073-20260206    gcc-14
x86_64                randconfig-074-20260206    gcc-14
x86_64                randconfig-075-20260206    gcc-14
x86_64                randconfig-076-20260206    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                  cadence_csp_defconfig    clang-22
xtensa                randconfig-001-20260206    gcc-12.5.0
xtensa                randconfig-002-20260206    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

