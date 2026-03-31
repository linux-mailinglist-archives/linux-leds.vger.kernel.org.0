Return-Path: <linux-leds+bounces-7610-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP0cJgMVzGmGOAYAu9opvQ
	(envelope-from <linux-leds+bounces-7610-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 20:40:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F8F37019D
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 20:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB5BD306488B
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 18:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871873815C1;
	Tue, 31 Mar 2026 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGZHGPq0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B3A381B0B;
	Tue, 31 Mar 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981862; cv=none; b=Y0N8hjJ/2Pu5pM4cS/8qEdeVqH/dhT9MPwBpyA/nbd51DJjeCD+reeBnLylmscgwD9eamV/1PzF+zqxJUDQAMev4STplOVLQ/sIDdqM5fyZK8uUkhdrH+0jj08iYKPom6gQaIEX5HuHxP7T7XXxdRBZBtrKvY4+lPKWpfqoEyTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981862; c=relaxed/simple;
	bh=r++qpR0g60SJxWDF3lstz49v1bI87IncDSutxNWST+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VGXN0x2uUi1sLxrta0vgmt3ZZB2wIDfxqO4G1NVnrWnFDh1xw6ZY37rEI/CD4jTDERDFcyExP6bkxodxvU0A5NQpGaPPnZlDXbaVRSa7W6SFxGomJmsg3o4GkZGnSuKYrhfXPpU3qvZiQoOexEysUNlP/9aZcUIJEaLBGs8PyCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGZHGPq0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774981860; x=1806517860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r++qpR0g60SJxWDF3lstz49v1bI87IncDSutxNWST+A=;
  b=PGZHGPq0exrYXdBiwoJrUsQqc6UBz7BqE4vR7iWowVeM23yrvqbS4wEh
   903ys7q2maqx3Eqd+Lm3WQcr0XzweyCJprsyaHvIkjSeTUVrnChykiUP4
   ZX508LelSqfBgMC3bhb7U10XeXX0OxabAIro3qGmXuUN1ZHqz9P9a0rgn
   9V0787BRcJXRvfC1V+RYE1EtrMSxW5IxnMvSpkxvPs7lSiLP1lIkw4UB0
   EOBEX5BpoGnax1JA00lyKSt1cf5wD0i+tu/sqftIzbWszEHhhLKr06KQ+
   gHsEob2QrSPy1kAJdj4ZC6VSiOAMMBce+ppP47cgwWZgA5IGTRJBZbLH5
   g==;
X-CSE-ConnectionGUID: kLjMAZJpTH+PUZ2Cf9jOXw==
X-CSE-MsgGUID: uQDIJOERQzCmWoryN3Ak1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75891191"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75891191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:30:59 -0700
X-CSE-ConnectionGUID: YpcIbbPfSfS25PSsOJVt8Q==
X-CSE-MsgGUID: uJFpVrnARKmRp+9/PxqkMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="225619059"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 31 Mar 2026 11:30:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 612DA95; Tue, 31 Mar 2026 20:30:56 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/2] leds: class: improve led_remove_lookup()
Date: Tue, 31 Mar 2026 20:28:27 +0200
Message-ID: <20260331183055.1209526-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7610-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 57F8F37019D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This mini-series targets led_remove_lookup() to be more handy for
the optional resources. The first patch makes it no-op for NULL
pointer and the second one makes it idempotent.

Changelog v2:
- added patch 2

v1: 20260327102729.797254-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (2):
  leds: class: Make led_remove_lookup() NULL-aware
  leds: class: Reinitialise list after dropping from lookup table

 drivers/leds/led-class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.50.1


