Return-Path: <linux-leds+bounces-6707-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKc8M1K0cmn5ogAAu9opvQ
	(envelope-from <linux-leds+bounces-6707-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 00:35:46 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE66E8D1
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 00:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E71483009B0D
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 23:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA9F3DC584;
	Thu, 22 Jan 2026 23:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnYElrvU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56273392B89
	for <linux-leds@vger.kernel.org>; Thu, 22 Jan 2026 23:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124943; cv=none; b=LPOdR8l20BeGsTYVAgkmfUePNdkxH/JO9mgBJ1QQdXMMoBJMh4z1P6703dDCMJYF92TqqUCpG0cSqQzSz75ve92sSv/YONXu5lfnqpndsa1PkXRO10dovTghjFQoGy+5VNHReWodMBwoRhQNsKw7fDrNo01pP29pxd0fZBS39cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124943; c=relaxed/simple;
	bh=cWPRbNvyPoxvsJNrZndNo+NPoxEhh4AUG0hzh4pQLLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d+2n1RKQGw5ZD2ECUg8ahGf3cmT3aDRpoqnal4ZEZsIPqwJPSjPnNCL5iQsTnKOiyhP6BVvDbZp3y5I1F2ty5RbxEz1+v1XX5JWrLzefMCkkhZU5P2CEFjukG77dqClLueQA+e/OiolIZ8nJIQKwXVJbJdnOFxRdNgifCRKjGtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnYElrvU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769124933; x=1800660933;
  h=date:from:to:cc:subject:message-id;
  bh=cWPRbNvyPoxvsJNrZndNo+NPoxEhh4AUG0hzh4pQLLw=;
  b=SnYElrvUC1qvyyA+aBLKAf3lX5yKYjH4HHCLedR1xUV9J25F5sLWE5d3
   qVzl0Q8KpKzEooQmvHRBmJC1zRZtGCRc+WFFq1pBUgTZm1X8wpeF4f/Uo
   GgotwgSvjuuv6zZQD4qKEvAeqOtIUKbKIxVO+O2G/Hq4zompeMv+0bEOL
   zVckQCcvAUqpz1y/YmR5UjQ08nBwloQknLAhccHgsYtQ/csEEiVRQmEpF
   H/3zE6KYHjgmv7Jm5aiSWnAebhN43oXBxZu2moMmOx+t9EpqkbMdJF0jb
   gYVH381fy6+fugG+2YeRTmMveMlYo54Bfort47gb6ZH6WAwC2egXnqwDu
   A==;
X-CSE-ConnectionGUID: 6LHgtX3fQ9i/0+d6iczJnw==
X-CSE-MsgGUID: kYYX9SJdTmSXRwR2IoQtwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87953954"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="87953954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 15:35:27 -0800
X-CSE-ConnectionGUID: f0Z3AtA5Q/eURyqPkF9RPQ==
X-CSE-MsgGUID: IDBAAlWvQDCchdXF+ncBTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="237521069"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jan 2026 15:35:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj4Cw-00000000TLS-26ju;
	Thu, 22 Jan 2026 23:35:22 +0000
Date: Fri, 23 Jan 2026 07:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 3/17] ERROR: modpost:
 "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
Message-ID: <202601230708.wwFMOXZp-lkp@intel.com>
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
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	TAGGED_FROM(0.00)[bounces-6707-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 3BDE66E8D1
X-Rspamd-Action: no action

Hi Steffen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   68d2a846952f81cd01331fffdec9a67299b22319
commit: 51f7560294c911e9394357a903ffa28eebe4b253 [3/17] leds: Add support for TI LP5860 LED driver chip
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260123/202601230708.wwFMOXZp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230708.wwFMOXZp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230708.wwFMOXZp-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/leds/rgb/leds-lp5860-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/rgb/leds-lp5860-core.o
>> ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
>> ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

