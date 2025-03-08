Return-Path: <linux-leds+bounces-4199-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DA8A57A02
	for <lists+linux-leds@lfdr.de>; Sat,  8 Mar 2025 12:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1E018916C9
	for <lists+linux-leds@lfdr.de>; Sat,  8 Mar 2025 11:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D575F1B4F0A;
	Sat,  8 Mar 2025 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Doaf1JKG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3881B422A;
	Sat,  8 Mar 2025 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741433540; cv=none; b=fQ2R2MFtuEJ2u1M3ZxtWkYh4FE1Ji/QdQ0IXOu/lvR4z7CTzQow0c4Ki3MkwrFkU5GwXbkXtExgveJRzs0AGttVTVlqKYHOJTVODgYbtMtyOSwCb31uOWtAovYh5qkWU8fSJ5zbQZEv2uQOiEDbGVn2BGZOjc8Ktzj1nfC9QkiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741433540; c=relaxed/simple;
	bh=WTuvM09TTfGQtR8Kh/S05MbAEWQJ5BhtR9jdP0p2JWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m13UNBEkOoCNo7HMJkVuV5FdIFIctCjF53qt54m7TDGjH80JrxDjAqmFEQqKFM//aoq+zeyuYb4FYsZwZAU3vZD/eFCsMhk8DC/a7AuqZZYhLw/THj1zZQknBAmtICIuvMp4ua3pL4BQiKNwmQzy9oiCnxIAc3tDkjUZ5vv1BCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Doaf1JKG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741433539; x=1772969539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WTuvM09TTfGQtR8Kh/S05MbAEWQJ5BhtR9jdP0p2JWs=;
  b=Doaf1JKGSLeYHgtxbhKNlbn5Eavfxw8CYoo0dcJyjrjgqKiYvZYeqYKo
   g7+30XYrsTDRz74rXlYxfeMS9eFkzTUcQdGxNGmkU9HMfO3hYLIqHeSxq
   TT8nx2dhDdq+032gb4kfiDEx0jPL+8ciQEfaOyBBaRhX+WwdWyV7jADGi
   +d5vMpf/okm1dJZmjGkJESnvgNRAOjBxVl5T4ppVTkCiGkdOWLOi8r8w5
   i3Tm8/gG3ETYWsTJtmgGWw2JARZQy1o+XciCWJwaMF8LP/sRLFLf0uEUW
   E8hLOZImI5kSPpNKWDvHoAWT4vHadotJ0PtUquiHP9LxkeqHipSCacCZi
   w==;
X-CSE-ConnectionGUID: 0yGtZLlKTK6w/k1Dive1yg==
X-CSE-MsgGUID: EI/A39RqR0GGaAGwkbzj9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46259558"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="46259558"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 03:32:19 -0800
X-CSE-ConnectionGUID: GcdaE6nQQpq+KQgULM1SIg==
X-CSE-MsgGUID: 3yhlv52fT6CeGryrgvJlDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="119724208"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2025 03:32:14 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqsPb-0001qn-2d;
	Sat, 08 Mar 2025 11:32:11 +0000
Date: Sat, 8 Mar 2025 19:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org, pavel@ucw.cz,
	danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <202503081939.UtJzrbfX-lkp@intel.com>
References: <20250306140947.580324-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-7-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-backlight/for-backlight-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Rework-fb_blank/20250306-221554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250306140947.580324-7-tzimmermann%40suse.de
patch subject: [PATCH v3 06/11] backlight: Replace fb events with a dedicated function call
config: x86_64-randconfig-005-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081939.UtJzrbfX-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081939.UtJzrbfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081939.UtJzrbfX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: backlight_notify_blank
   >>> referenced by fb_backlight.c:47 (drivers/video/fbdev/core/fb_backlight.c:47)
   >>>               drivers/video/fbdev/core/fb_backlight.o:(fb_bl_notify_blank) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: backlight_notify_blank_all
   >>> referenced by fb_backlight.c:49 (drivers/video/fbdev/core/fb_backlight.c:49)
   >>>               drivers/video/fbdev/core/fb_backlight.o:(fb_bl_notify_blank) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

