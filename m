Return-Path: <linux-leds+bounces-8324-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KzLIJDQFmowsgcAu9opvQ
	(envelope-from <linux-leds+bounces-8324-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 13:08:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC685E3191
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 13:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84A7D3004F6A
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 11:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35B03EEACF;
	Wed, 27 May 2026 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="LoxTs6id"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC5D3EE1D6;
	Wed, 27 May 2026 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880000; cv=none; b=c5vMja3Doqoluw4oHefbmSOuiE1dm8tDgvHwjP5u3U2M8FdwFZrBKvbcVuosD03aKVbhHkBmh1UXIyDgg0Mml3iraSFw2rQl9+R/6SMlt/ikl7/z/Dko5Nn9/FgrGHMSUIa/fn4uow5uKc/L8I/lEw0OntRD28VPOq9gjh6nbRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880000; c=relaxed/simple;
	bh=pMfcCdGRese6RaQ4p4VUBtjmiUFTkB/fm6oO6FKAyeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aCb7ByXA6FzDJ3CwLFAMRTlYSumcS2bl8DTTpGh2H9M2PoDwlJyzk0q6H+UcG3odM3fRCg9ehBWIrta1PKfsA4LXWVB50pU9vZvv1qJ8sF+1kNBkBjIr20OJVlnPS2gNMeZ5HOLeksBAlkoig5CRGXbKk6za6FyXWNHDtKgCWyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=LoxTs6id; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H8Lkibz9XkOHvyX+HLucg2B6wZYwpUD3md3NpIWo/EM=; b=LoxTs6idYTuf4fHDguBalgAZj6
	EmiLAIN4UvehV7x5o4xGWLLbNjIYFuobz5p8lcuhIpsBfGfFkCbMVhOgs4LbV0lnZ/WCY/ngDME0K
	+pKAC3Rt5o8hp0YKk25jSsLpn5qC+auox4g4Tlc0p0bZJ4/Edp4gA5X6Wj4tVHYa2TaQ=;
Received: from 194-208-226-106.tele.net ([194.208.226.106]:60102 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1wSBTQ-006YdF-3V; Wed, 27 May 2026 12:26:52 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Wed, 27 May 2026 12:26:51 +0200
Subject: [PATCH] leds: tps6131x: increase overvoltage protection threshold
 to 6V
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-leds-tps6131x-ovp-v1-1-1ac70d03c9eb@emfend.at>
X-B4-Tracking: v=1; b=H4sIAOrGFmoC/x3MQQqAIBBA0avErBtII8uuEi0qxxqIEickiO6et
 HyL/x8QikwCffFApMTC55GhygKWbTpWQnbZoCttqka3uJMTvIIYVasbzxRwtp3z1llv1AK5C5E
 83/9zGN/3A1S1/9VjAAAA
X-Change-ID: 20260527-leds-tps6131x-ovp-b98df9d9f61c
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 
X-Spamd-Result: default: False [-0.46 / 15.00];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8324-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[emfend.at:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,emfend.at:mid,emfend.at:email]
X-Rspamd-Queue-Id: EDC685E3191
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, there may be cases where the overvoltage detection is triggered
even with a valid and generally functioning hardware setup. This occurs,
for example, when the input voltage exceeds the currently used overvoltage
threshold of 4.65V (typical). Since input voltages up to 5V are supported,
the threshold should be adjusted accordingly.

While the target output voltage setting has no effect on the LED operation
used here, it indirectly selects the threshold for overvoltage detection.
Set this to a value of 4.95V to select a threshold of 6V (typical).

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/leds/flash/leds-tps6131x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
index f0f1f2b77d5a935cdca2f280b0197fb26bbf4bb4..5c9a5af5af05c5a6de1da3dd0f1badb946e9cde5 100644
--- a/drivers/leds/flash/leds-tps6131x.c
+++ b/drivers/leds/flash/leds-tps6131x.c
@@ -277,7 +277,7 @@ static int tps6131x_init_chip(struct tps6131x *tps6131x)
 	if (ret)
 		return ret;
 
-	val = TPS6131X_REG_6_ENTS;
+	val = TPS6131X_REG_6_ENTS | (TPS6131X_OV_4950MV << TPS6131X_REG_6_OV_SHIFT);
 
 	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_6, val);
 	if (ret)

---
base-commit: eb3f4b7426cfd2b79d65b7d37155480b32259a11
change-id: 20260527-leds-tps6131x-ovp-b98df9d9f61c

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


