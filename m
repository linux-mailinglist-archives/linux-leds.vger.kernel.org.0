Return-Path: <linux-leds+bounces-6786-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E5QCacse2lRCAIAu9opvQ
	(envelope-from <linux-leds+bounces-6786-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 10:47:19 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DD9AE3C5
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 10:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74B07303C805
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 09:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF4A3803CB;
	Thu, 29 Jan 2026 09:46:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF1637FF7F
	for <linux-leds@vger.kernel.org>; Thu, 29 Jan 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679991; cv=none; b=ErKgkdo1Qb8sZWk4pSJ8i1HghHlgEWJHkc6+yCs5s/yT/s5AVYoXvrs7DsPpLK03yKWBiqk4UTbh4Ez4xSywXCaZp5eKmS7y8UgQwpjDlu0f2aCOOHc5k73WrNmYrwUUPy0ZljaRTBQdNsxhOS77cMtpdtdlpG/3Yu1vMxY9q6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679991; c=relaxed/simple;
	bh=wy3aNi/TX/XbnJPo6AxbyvKB5q6BiMPQ96mPvMg9sMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwH+iqtuzCmeyd/Y4SumgmmnfDjhrMSrOpIeAMbmZsFvz0fjUIKox8WEiU8oMWmVwzjpK0qZi6x5askcHEZ/C4IB8K5RGx4dBWYjqU6Nc/XATTcadIs3GZXKHNCpL701Za1JumOEQNzG9Wj0pNaucPoTUGclxIJFeVnb/UsSRc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vlObY-0000zg-Af; Thu, 29 Jan 2026 10:46:24 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 29 Jan 2026 10:45:56 +0100
Subject: [PATCH 2/2] leds: lp5860: Remove useless select
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-v6-19-topic-ti-lp5860-fixes-v1-2-635ab524ebbd@pengutronix.de>
References: <20260129-v6-19-topic-ti-lp5860-fixes-v1-0-635ab524ebbd@pengutronix.de>
In-Reply-To: <20260129-v6-19-topic-ti-lp5860-fixes-v1-0-635ab524ebbd@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6786-lists,linux-leds=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 90DD9AE3C5
X-Rspamd-Action: no action

The lp5860-core driver selects FW_LOADER and _USER_HELPER.
These are not needed, remove them.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/leds/rgb/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index d362d15320969..e83f62038be4a 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -30,8 +30,6 @@ config LEDS_LP5860_CORE
 	tristate "Core Driver for TI LP5860"
 	depends on LEDS_CLASS
 	depends on OF
-	select FW_LOADER
-	select FW_LOADER_USER_HELPER
 	select REGMAP
 	help
 	  This option supports common operations for LP5860 devices.

-- 
2.51.0


