Return-Path: <linux-leds+bounces-6849-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM9wKdA/hWme+gMAu9opvQ
	(envelope-from <linux-leds+bounces-6849-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 02:11:44 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18870F8E05
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 02:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 698EE3003618
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 01:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A7422D4D3;
	Fri,  6 Feb 2026 01:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhSProag"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A26B2264C0
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 01:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770340301; cv=none; b=XiCZcSIUaj15S3IOwuEO1btxRKDRVGKiQHIwP/RCHI6iDjJipqYnqcXboC0NNcS7FOq0B8WwCLHwVw8/dvRWnE87JE6wjavIETnOkYVVEYvNVeV2TP5Dy8lrXBHABI/4/Ck/bPy5wRlZLDFyLUqW6lSO9+gKgdQ8pfxUvuPBnzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770340301; c=relaxed/simple;
	bh=HFlABrmHq3Spf6ueBFfSIZEq7M+AMpMdM+Gi/bJK2fw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e3MZsKIo72jC+bv4R17aK0PeL0UP43N+3pW0xszye74Qy33c9v2kp7WkY3AAHkznro8gHXn3sV97TZvjrLWsvyxt7gEmsufk8mNM/ryguE/LSIyfRcOhbe///H9UxI6tvENaK9KiAIQ9HrWclrpM+QDRtgD9uJVz3Y3hySeWJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhSProag; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770340301; x=1801876301;
  h=date:from:to:cc:subject:message-id;
  bh=HFlABrmHq3Spf6ueBFfSIZEq7M+AMpMdM+Gi/bJK2fw=;
  b=mhSProagSaSJQsxdPmZiraCM34+Jd83LpC9EG3+qoVxr028xJyoyxAb5
   3hFzqP3YcMd0QyROEpX1+tIeTN2anMTUX1XIr6xSaTTvDANai934rIwkO
   Dknb5eEp0XhiN1/X2cdiNkBEOMDSXVYxcvmw2KwuUVKxKDQ4QBhuO6K1/
   LKEmY4uwkoa7z02l41rGKZV+xDF5LTTibqxCQE8K7EoAJp7M4I3Yj3IDM
   sU847trLgMYNsxLmyk1zNbiGJzZWhg9hW3fWMzNntEdH89AI474brNWj4
   rncOVeoGFjWb8JCVSqVlMjekSHsK3+Z9dyX2MkTbXepr1fjLT91Hdvy2N
   g==;
X-CSE-ConnectionGUID: fS0T4AeHRRGRZVFr0+1xBw==
X-CSE-MsgGUID: PXdXI4TkQXqJP+RRcs+mxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71542670"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71542670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 17:11:40 -0800
X-CSE-ConnectionGUID: MDHOuRBHSNmW9qNv8Lh3iA==
X-CSE-MsgGUID: mca4p+D7Tu+0sAYuJthacg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2026 17:11:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voANk-00000000kLA-1ZaS;
	Fri, 06 Feb 2026 01:11:36 +0000
Date: Fri, 06 Feb 2026 09:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next-next 19/19]
 include/linux/compiler_types.h:630:45: error: call to
 '__compiletime_assert_186' declared with attribute error:
 min(intensity_value[i], led_cdev->max_brightness) signedness error
Message-ID: <202602060923.xIgdQXjI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.95 / 15.00];
	LONG_SUBJ(1.60)[214];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6849-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 18870F8E05
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next-next
head:   129f82752bcecd554936209aac4dbdd888e92224
commit: 129f82752bcecd554936209aac4dbdd888e92224 [19/19] leds: multicolor: Limit intensity to max_brightness of LED
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260206/202602060923.xIgdQXjI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060923.xIgdQXjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060923.xIgdQXjI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/leds/led-class-multicolor.c: In function 'multi_intensity_store':
>> include/linux/compiler_types.h:630:45: error: call to '__compiletime_assert_186' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:611:25: note: in definition of macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/leds/led-class-multicolor.c:51:38: note: in expansion of macro 'min'
      51 |                 intensity_value[i] = min(intensity_value[i],
         |                                      ^~~


vim +/__compiletime_assert_186 +630 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  616  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  617  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  618  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  619  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  620  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  621   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  622   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  623   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  624   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  625   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  626   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  627   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  628   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  629  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @630  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  631  

:::::: The code at line 630 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

