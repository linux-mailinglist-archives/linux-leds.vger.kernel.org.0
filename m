Return-Path: <linux-leds+bounces-8787-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GV27IjqMQmo89gkAu9opvQ
	(envelope-from <linux-leds+bounces-8787-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 17:16:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F0D6DC879
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 17:16:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=chGXcSAC;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8787-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8787-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AA6C30F70ED
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0527F428465;
	Mon, 29 Jun 2026 15:05:59 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13885425CEA;
	Mon, 29 Jun 2026 15:05:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745558; cv=none; b=gdeK2xVKoCeW3gQ2XV9ks2RC84lKGkwxsAi5Mjbd5Bv3K2pmvsBTcveaMBGH/dCxMJ1uB2KQhHnAYXALUSTqx2Qj7mEwLKLAncTcn3naTZ7oRIO9/gUX8QCxR14vlTVw8JSKtZdsmPc0k+O6m+dArfNfPD8r8g4OSE6OLp+x05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745558; c=relaxed/simple;
	bh=bRzbfqhpmyPBejcqj+nwbdIhOPnJWKOjULbc34cXygA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKkqM5XO0E9eqJyYf1XmUznSzM2MnWFxu5hTFRhynGsKKiprFpxJKPNR2iOEU+nqHQr6XutahD8ZB6nQm57YJ/xhGtEfwIj5Ym2tlL+lk1sYDDLxIeX6QyO17onp2OY+WJxYm5PrEOFbozhw0ef52MArnnqbnhJ4MhaffFNAbUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chGXcSAC; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782745558; x=1814281558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bRzbfqhpmyPBejcqj+nwbdIhOPnJWKOjULbc34cXygA=;
  b=chGXcSACjVyD3z0ZvXqHhy11GlDtHNGerOdd0+4BchCaUhCKuhPmchH7
   5uKN27M6Q2/Z+sk23jxAFqXE9irA4elo7r30rRYYPIpUlipHiCHYTF285
   UXvBbzAWT0ZXHPC0hA3bFHSx6a5VUDHl46lNV6UcTj+uQjLots6SeBmLi
   gDOXpipwmy8PVdIBpcCOpWaynbEo+3Zz8MOq09nqMji0f4yckKCPcwuJQ
   5c/o5FwbnSYPrtbbWaXFuBzdEbJ4nW8E8rTLzT+w0i1vVQR7wfEIZ1w5d
   j+Hjl+92fNvT7E1vbK4nmM/mv8kECvPQZuH+lR1NafxUR03a2b45zMsLx
   g==;
X-CSE-ConnectionGUID: MwZCIE/rT/WVoP6GPiZv5w==
X-CSE-MsgGUID: UtKtu1UGQueCHJfr+n2kUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87345561"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="87345561"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:05:57 -0700
X-CSE-ConnectionGUID: F9SgGtAaQISMDE7JwrAHgQ==
X-CSE-MsgGUID: f67Jl0g/RaaF/FFb2vzCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="252128943"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Jun 2026 08:05:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weDYQ-000000007Uj-2oSU;
	Mon, 29 Jun 2026 15:05:46 +0000
Date: Mon, 29 Jun 2026 23:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	kernel@oss.qualcomm.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH v3] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
Message-ID: <202606292317.3IsR1hhQ-lkp@intel.com>
References: <20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8787-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp,pattern.data:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05F0D6DC879

Hi Fenglin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5]

url:    https://github.com/intel-lab-lkp/linux/commits/Fenglin-Wu/leds-rgb-leds-qcom-lpg-Fix-LED-color-balancing-in-HW-pattern-mode/20260629-180250
base:   1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
patch link:    https://lore.kernel.org/r/20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799%40oss.qualcomm.com
patch subject: [PATCH v3] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260629/202606292317.3IsR1hhQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606292317.3IsR1hhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606292317.3IsR1hhQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/rgb/leds-qcom-lpg.c:1203:3: error: cannot jump from this goto statement to its label
    1203 |                 goto free_pattern;
         |                 ^
   drivers/leds/rgb/leds-qcom-lpg.c:1216:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1216 |         guard(mutex)(&lpg->lock);
         |         ^
   include/linux/cleanup.h:422:2: note: expanded from macro 'guard'
     422 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:303:3: note: expanded from macro 'CLASS'
     303 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:39:1: note: expanded from here
      39 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:45:1: note: expanded from here
      45 | __UNIQUE_ID_unlock_324
         | ^
   drivers/leds/rgb/leds-qcom-lpg.c:1216:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:422:15: note: expanded from macro 'guard'
     422 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:165:2: note: expanded from macro '__UNIQUE_ID'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:33:1: note: expanded from here
      33 | __UNIQUE_ID_guard_323
         | ^
   1 error generated.


vim +1203 drivers/leds/rgb/leds-qcom-lpg.c

  1177	
  1178	static int lpg_pattern_mc_set(struct led_classdev *cdev,
  1179				      struct led_pattern *led_pattern, u32 len,
  1180				      int repeat)
  1181	{
  1182		struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
  1183		struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
  1184		struct lpg *lpg = led->lpg;
  1185		struct lpg_channel *chan;
  1186		struct lpg_pattern pattern;
  1187		unsigned int triled_mask = 0;
  1188		unsigned int lo_idx;
  1189		unsigned int hi_idx;
  1190		unsigned int scale;
  1191		unsigned int i, j;
  1192		int ret;
  1193	
  1194		ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
  1195		if (ret < 0)
  1196			return ret;
  1197	
  1198		/* Allocate buffer for the per-channel scaled pattern copy */
  1199		struct led_pattern *scaled __free(kfree) =
  1200				   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
  1201		if (!scaled) {
  1202			ret = -ENOMEM;
> 1203			goto free_pattern;
  1204		}
  1205	
  1206		for (i = 0; i < led->num_channels; i++)
  1207			triled_mask |= led->channels[i]->triled_mask;
  1208		triled_set(lpg, triled_mask, 0);
  1209	
  1210		led_mc_calc_color_components(mc, LED_FULL);
  1211	
  1212		/*
  1213		 * Each channel gets its own LUT block scaled by subled_info[i].brightness
  1214		 * so the pattern respects the configured colour balance.
  1215		 */
  1216		guard(mutex)(&lpg->lock);
  1217	
  1218		for (i = 0; i < led->num_channels; i++) {
  1219			chan = led->channels[i];
  1220			scale = mc->subled_info[i].brightness;
  1221	
  1222			for (j = 0; j < pattern.len; j++) {
  1223				scaled[j].brightness = DIV_ROUND_CLOSEST(
  1224					(u32)pattern.data[j].brightness * scale, LED_FULL);
  1225				scaled[j].delta_t = pattern.data[j].delta_t;
  1226			}
  1227	
  1228			if (lpg->lut_base)
  1229				ret = lpg_lut_store(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
  1230			else
  1231				ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
  1232	
  1233			if (ret < 0) {
  1234				/* Free LUT slots already allocated for previous channels */
  1235				while (i-- > 0) {
  1236					chan = led->channels[i];
  1237					lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
  1238					chan->pattern_lo_idx = 0;
  1239					chan->pattern_hi_idx = 0;
  1240				}
  1241	
  1242				goto free_pattern;
  1243			}
  1244	
  1245			chan->ramp_tick_ms = pattern.delta_t;
  1246			chan->ramp_ping_pong = pattern.ping_pong;
  1247			chan->ramp_oneshot = repeat != -1;
  1248			chan->ramp_lo_pause_ms = pattern.lo_pause;
  1249			chan->ramp_hi_pause_ms = pattern.hi_pause;
  1250			chan->pattern_lo_idx = lo_idx;
  1251			chan->pattern_hi_idx = hi_idx;
  1252		}
  1253	
  1254	free_pattern:
  1255		kfree(pattern.data);
  1256		if (ret < 0)
  1257			return ret;
  1258	
  1259		lpg_brightness_set(led, cdev, mc->subled_info);
  1260	
  1261		return 0;
  1262	}
  1263	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

