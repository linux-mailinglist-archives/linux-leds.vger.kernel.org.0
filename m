Return-Path: <linux-leds+bounces-7611-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBCyFMUTzGkvOAYAu9opvQ
	(envelope-from <linux-leds+bounces-7611-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 20:34:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B639737006C
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 20:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BFB230E911E
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 18:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019F2382F01;
	Tue, 31 Mar 2026 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqtNcQ0b"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB037AA99;
	Tue, 31 Mar 2026 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981862; cv=none; b=fzxYh6b61/mp5m328SDNk6M8SLl+B/R5UrAjALvzczbNrheri8gaTzjslilnI4o2D4Q8K/ej8HaGCn1t7u5d6lDbQ1iM4oBAtYFk4XTQuLRiI2wfLt+W9+bC4DmXigwCoy4KDNLJi/rWfFFrEAoUveqW7YTl6VEgMponwzxEZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981862; c=relaxed/simple;
	bh=x6pdFAb0id+/6LCC8hlsXim4y/6YGDWmlAY70fi/yUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buKKDxkygWOWJvnJ8HPbBKfWh+QfaMjOH8No/aWzBw9CnVvveY9LQZmuvlW8YDs3pnf8EMsYAyEDv9LLMdCCRzvJRAOlHUygDQakAILEnybM97d4XdCzX89kuY3mOFVjmkTntkBntyhSzqstmohbVemNP3NdUo/SkbnMe6wNFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqtNcQ0b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774981862; x=1806517862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x6pdFAb0id+/6LCC8hlsXim4y/6YGDWmlAY70fi/yUA=;
  b=PqtNcQ0bvWlmXh2FTFlkb79y3djJLSMUo16uPIuZhxT9XGHBpYSdyIkm
   X7KMH9QnsnFmqULjYrI5X2kclI54NfHEu2cGsJyX1NvzZW6an9A1Qn8FO
   FvGhTPjnEJvAu/PZcf7nhdHRU6pIg9Wsxd9GwGL/b3EcRef8AOa3o7jMe
   ins2JlXutUpz8OrqoBsFudIlX0/DywQIAa1zpB4NOQzp/2InipIM6LX3b
   mUVEQ5+q3SKpRz+vMOZu/p6kxn5VPgEeOZmod5diprP66h5ZGAxG2xhKV
   wX6P9PZPV1P3DUvwTPjCb8nxXNhhH4rckeZ7gXc3iTg5LofWbV+ac5Flh
   w==;
X-CSE-ConnectionGUID: sUlODI6gTHOwJNtYqvJXZw==
X-CSE-MsgGUID: aWeW8RUZSq2R0uDRJ4NN5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101459632"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="101459632"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:30:59 -0700
X-CSE-ConnectionGUID: pPnDoadYTserz5cUadbIwA==
X-CSE-MsgGUID: cpKvE38yQFOb7O2JLId5Xg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2026 11:30:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6713C99; Tue, 31 Mar 2026 20:30:56 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] leds: class: Reinitialise list after dropping from lookup table
Date: Tue, 31 Mar 2026 20:28:29 +0200
Message-ID: <20260331183055.1209526-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331183055.1209526-1-andriy.shevchenko@linux.intel.com>
References: <20260331183055.1209526-1-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7611-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B639737006C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the lookup table just removes the list entry and leaves
the stale pointers in it. If the lookup is embedded in some data
structure, the pointer to the lookup entry can't be NULL (always
valid), but calling led_remove_lookup() on it twice will lead to
the wrong behaviour. To avoid that the user has to track the state
itself. With this change in place, the user may drop that approach
and use something like

  probe:
	INIT_LIST_HEAD(&lookup.list);
	if (LED lookup is required)
		led_add_lookup(&lookup);

  remove:
	led_remove_lookup(&lookup);

without any additional tracking kept over the device lifetime.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index b53ebe3a0faa..424c07e0ecce 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -425,7 +425,7 @@ void led_remove_lookup(struct led_lookup_data *led_lookup)
 		return;
 
 	mutex_lock(&leds_lookup_lock);
-	list_del(&led_lookup->list);
+	list_del_init(&led_lookup->list);
 	mutex_unlock(&leds_lookup_lock);
 }
 EXPORT_SYMBOL_GPL(led_remove_lookup);
-- 
2.50.1


