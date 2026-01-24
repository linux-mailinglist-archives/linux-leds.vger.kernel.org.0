Return-Path: <linux-leds+bounces-6724-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI85JOg1dGlx3QAAu9opvQ
	(envelope-from <linux-leds+bounces-6724-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 24 Jan 2026 04:00:56 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0708D7C44D
	for <lists+linux-leds@lfdr.de>; Sat, 24 Jan 2026 04:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2BF93014975
	for <lists+linux-leds@lfdr.de>; Sat, 24 Jan 2026 03:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418401FDE14;
	Sat, 24 Jan 2026 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHlcxpk4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC81F4174;
	Sat, 24 Jan 2026 03:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769223654; cv=none; b=VN1Dp5SYyDxS8+1FpllcLKvTqk4XG/uF9WkWs3i+f2N9kq46jVh+XKMRIs/04BaxkEJT3CYRMrR1j+7y/44i9T2+pSwHGHDCXTyz+7hYEc6gG0n/m53jCa6pjNTj4RIypmHbVuHqa/G3RBEDBPhEmbkP7+gYWMxJovzuiNk01Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769223654; c=relaxed/simple;
	bh=V72vmmuemW0S45jNX9xnuwSaJ4Wy6copTCbD6oSRsMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=riGomDhlTB0n7d/V1B4c625dZDg8INgcDS50rSVtBlfo6QipamjRN0WZwPTsdJH5CKgefwVvWd8d4PGsGiMoCsKw9zYGY9mhwwF2e/NOn1uwOz9+Qhf2fJzCNctuzko35NRO5wOfJ/wiUOrqlObM1nhCcHKmE9u2suH7rpO3g4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHlcxpk4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769223652; x=1800759652;
  h=date:from:to:cc:subject:message-id;
  bh=V72vmmuemW0S45jNX9xnuwSaJ4Wy6copTCbD6oSRsMw=;
  b=GHlcxpk476ZuvmHfmcQKZQVWzW2veGuTRYqUOFkteftKYCRmctnrJtd2
   v2xg8zk3jlk6ClW1CLbgdNWXxEXhLRAXBEFzWSdt9x+g2L6EN8bFKuk2E
   NzEOjR/1quqcmVliI7+Ocypo8aZl+Qvnkxqt0+3NeQeaiNfu5GDl/66dJ
   ZkYhMoAubF/h5InvtKj0ppp0wJyUEu/wnMNY7iASHQ5YHzMr/wolVSfvo
   M6WOjBG1snb1MsOGcZqZ2dx6xXhB3Atalbfx97Tf6FNm/eSJirHaAWHG1
   w8P2bwoByi2sUjU+P6OuqVQVRMJV9j9c+Y38crmHs/NKR15d64jWbLB4s
   Q==;
X-CSE-ConnectionGUID: LiUZk3IQQJmFbQxxylLDRg==
X-CSE-MsgGUID: 76B49Bg6SoeSBuzFBfC7XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70640741"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70640741"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 19:00:52 -0800
X-CSE-ConnectionGUID: ZPeLk8uVRmW3o9xoxHWXwQ==
X-CSE-MsgGUID: wRxE5EdBSYWTKZdAYeZJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207426910"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jan 2026 19:00:50 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjTtI-000000000s1-2kNK;
	Sat, 24 Jan 2026 03:00:48 +0000
Date: Sat, 24 Jan 2026 04:00:01 +0100
From: kernel test robot <lkp@intel.com>
To: Nam Tran <trannamatk@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org
Subject: [lee-leds:for-leds-next 15/17] htmldocs: Warning:
 Documentation/leds/leds-lp5812.rst references a file that doesn't exist:
 Documentation/ABI/testing/sysfs-class-led-multicolor.rst
Message-ID: <202601240332.xYBnAAII-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6724-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 0708D7C44D
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   68d2a846952f81cd01331fffdec9a67299b22319
commit: 974d724e58fd2eee0fe46299901deae6fa9ebad1 [15/17] docs: leds: Document TI LP5812 LED driver
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601240332.xYBnAAII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240332.xYBnAAII-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arch/arm/keystone/overview.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/keystone/keystone.txt
   Warning: Documentation/devicetree/bindings/mfd/da9055.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/da9055.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
>> Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

