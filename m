Return-Path: <linux-leds+bounces-6709-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFIaLvxHc2mHuQAAu9opvQ
	(envelope-from <linux-leds+bounces-6709-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 11:05:48 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A3473E5D
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 11:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F1E6308212C
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 09:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039FD376467;
	Fri, 23 Jan 2026 09:57:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4F71A3157
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162265; cv=none; b=jnKeho6zh14w3nEv3I4Gohim2JLM+Vum8tRKDpoCBIN+DEY2sNyX5EEWR3FhsUULm0XVL2HzqbggOSTwErQ8e5GqRfJT4rqxdCwJJhII485Qv6DbEV2ntE1EXm/Uzonmzp/EiRk+oT457tVSQOrCIjHA6n+mrJLpHXdHqzdpJAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162265; c=relaxed/simple;
	bh=8ShYDPaoeiJCAffnnP46Zl8+Ly3MwLPPBNUKBq0lMkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CNXK3Sh/IPquZQzrG4pde8lAGETL4fVmIwYbCq2FuiWhwUSMEh89T+HfYr6DTfPH5IQYDaNkEQ6qq4Zco3oMYa1h7TJSMNuTMOKLLwDOmdodPwXpVlLiUQdjSYlH+UV+EGjCpSSfa3eV5dE1HVOK8TSchzxAcRqddzis87BIy3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjDv1-0002MA-VN; Fri, 23 Jan 2026 10:57:31 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 23 Jan 2026 10:57:26 +0100
Subject: [PATCH] leds: led-class: detect brightness conversion base from
 string
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-leds-class-convert-brightness-value-v1-1-ae9d3ae4224b@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAVGc2kC/x2NQQrDMAwEvxJ0rkBxihv6ldKD66iJwDhFSkwh5
 O8VvQzMHHYPMFZhg3t3gHITk7W69JcO8pLqzCiTOwQKkfowYOHJMJdkzrU21g1fKvOyVfbUUtk
 Z8zVGGonCeBvAlz7Kb/n+Xx7P8/wBVcQjGXUAAAA=
X-Change-ID: 20260123-leds-class-convert-brightness-value-c46608002873
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, kernel@pengutronix.de, 
 Thorsten Schmelzer <tschmelzer@topcon.com>, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6709-lists,linux-leds=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 55A3473E5D
X-Rspamd-Action: no action

From: Thorsten Schmelzer <tschmelzer@topcon.com>

sysfs-class-led doesn't specify the number format for the brightness,
but the class only accepts base 10 numbers.

Use the automatic base detection of kstrtoul and accept the brightness
as hex value as well.

Signed-off-by: Thorsten Schmelzer <tschmelzer@topcon.com>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index d34a19453560..8993b78b4162 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -55,7 +55,7 @@ static ssize_t brightness_store(struct device *dev,
 		goto unlock;
 	}
 
-	ret = kstrtoul(buf, 10, &state);
+	ret = kstrtoul(buf, 0, &state);
 	if (ret)
 		goto unlock;
 

---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-leds-class-convert-brightness-value-c46608002873

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


