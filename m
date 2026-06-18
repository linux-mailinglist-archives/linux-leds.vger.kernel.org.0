Return-Path: <linux-leds+bounces-8662-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h4k2FAP/M2pBKgYAu9opvQ
	(envelope-from <linux-leds+bounces-8662-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:21:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B51936A0E7F
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:21:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dzuv7xwl;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8662-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8662-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4C97301DC04
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E823D0927;
	Thu, 18 Jun 2026 14:21:53 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803A235AC0E
	for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 14:21:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781792512; cv=none; b=giHRgRdt+HHTmTFAk2dz0kRRy1wgvDADnfsPdIGU2I1arntsAWORetragSR5qn96/zpEXlrHWAv/2Y1GqFKzGioZncAcVwCvLvCPs9uYldv92YdleGSfw7F+6KIHn6rlvwnmtu1IvXzJUHRlc2hdhkxCDP6KLMGcj6PCB+Y3NHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781792512; c=relaxed/simple;
	bh=kCeIoEAay4t9BCgOONKclGYQECUKGanufY82RrtYFyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QpE5BsenLUiPcjI2WWgpbCuAuF1xt7cyf9262DoRgVDH3W7mBr2o7UstejK0vzymBCjZlJowlEnWw+hZkWJYBzHF3eOKR4+aa2AQjdWZgdEf6dyZY55AHvke3vEeW326M5bi+ELGylStOpuV+btZgdpugtWqGQDglA45PdPwTuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzuv7xwl; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4626fdc829aso830732f8f.3
        for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781792510; x=1782397310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rz3nujkpYP9ynRPoPkm0vDQOLMZIdBZNL9Osh2lcHMk=;
        b=dzuv7xwlCSlN6kTbP/wC5aUA3diWtbk1lfcJdCO0uIWt4nQhURUEenEUR7LdxqdgGN
         apgauDaRwNcXGKNefS4zqjwYR3s4PkidOVgLk9CGW+Hy/DTVoXut2l119ZUgRSyogKHq
         0srQqGHSZrnyImika7lpr073hqmlGEprP3MGGOs9464DGWbm3q+U2h8EQ314baxuRl/5
         Zg45i6BScN/rJ8PIPqmd2geinqel7wCDUPN16baNYognOlVGB4d84cr11eiwTPy4dO4R
         E8ro6+hZWpYvulv7D3qiw6wyTZpQXaS0kKybhHsbaURcku8UiHoQOGYIQdt08iQ3jy7v
         RhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781792510; x=1782397310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rz3nujkpYP9ynRPoPkm0vDQOLMZIdBZNL9Osh2lcHMk=;
        b=kic4fWYOOz1O68EggGTNL7k5MmT9SDKM/c4GAVphlHsMTZ+UvvAlNz8RaKlG38Utve
         JcS+yVYBSLYx3+lOmAsIywkPH1jtRmgChtSAGU3bis1YgOZcGo8cOjX1XNtaUHjF9hkA
         6fPfG36/44u6DRaueJZClNkWTQsnCprCITUEXkjUW99iisqHp9PuHu28FxKqxY6RE/dM
         u4fgS5a/zTpBiDdjkR/803K66YVXpTLpYTytAro/MeXEDEe/09UZSQihMDuixx4M6Hwv
         udcNeumtGCvxY0j2CBvsLsdYsQOQ9I5yr1Z+Wmf7j8ilIO4KbSUQ0/L8314sf9X79ngq
         TbyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9N7mIXscy1KeoDAdjA3rj6cHFio4OC0O0AhshcbTPTRmxKn3P3rs2AvciXBaBqDvE1nDgQ+NIitWSw@vger.kernel.org
X-Gm-Message-State: AOJu0YyQzcEhIt8+NlHIu2b7PxX/BTkP2Ct9ormC/JjysS8vlFnUjSSb
	Ov2egCcXMtyPDdZS/FOuRcgtAWl1sHZ1zZ79NwycLb5TsZojCPQBiP4G
X-Gm-Gg: AfdE7clRFncYG3d4mo2m6Hkp6djYHTfBjt+Y4lGQxn5XrrL07JW8Nmy8JvrdIJ1BMoa
	eSJmbnhSNMU0EF7gFQi6EISIM/DpnD0rLfqvydh2uMzaVmCVuZ/9FDO07fb3Sq68lhSwoErVvWT
	e2ha5+upFWY9UH/dI5FU/8Y5piJFWRhgdT19ey5B0jzA35PI3qTXsrOBgZkQtfXZMj5CA2J6bix
	fcRGKYivsiT1KzJ5SNuVDz+vtCglyKJDKz5Vyql+PuYE+kdSa4A1nXBp8VjGGJK2abnsTRhZLer
	Cs2gfzoWCQgMk5xtJgZr50YzGxMxek/VLnPMTwI1bbA4BMiKeReoRDhIT4zOfkhq/1HHXrIcwwa
	klZD0Gv5qbBSYjkmd6gBUXzY9+OIeCQNFq1O91Xks/bGA0iP7X0SuzFmo4Fo2y3ywVj43WWjPPU
	0BTAQ0YDXBBCJKSx1a8gS1lqmfomh8btpSXHfVZirMV+0kcbXjDkQibLo5x8dbVVO0d1+j+dKgM
	AqdqZ5qE9OdjxYre94=
X-Received: by 2002:adf:ebca:0:b0:45e:df46:ba30 with SMTP id ffacd0b85a97d-4624179babbmr11874320f8f.34.1781792509501;
        Thu, 18 Jun 2026 07:21:49 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d507395ebfa2b8133f7b4c3cc0.dip0.t-ipconnect.de. [2003:d5:739:5ebf:a2b8:133f:7b4c:3cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c4240sm58083692f8f.27.2026.06.18.07.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:21:49 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2] leds: lp5860: Return an error for an out-of-range 'reg' property
Date: Thu, 18 Jun 2026 16:21:33 +0200
Message-ID: <20260618142133.27377-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,vger.kernel.org,gmail.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8662-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:s.trumtrar@pengutronix.de,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mertsftl@gmail.com,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B51936A0E7F

lp5860_iterate_subleds() checks the result of reading the "reg" property
and the channel range in a single condition:

	if (ret < 0 || channel > LP5860_MAX_LED)

When fwnode_property_read_u32() succeeds but the channel is out of range,
ret is 0, so the error path passes 0 to dev_err_probe() and returns 0 -
an out-of-range "reg" is silently accepted instead of rejected. The
shared "'reg' property is missing" message is also inaccurate when the
property is present but out of range.

Split the two cases: report a read failure with if (ret), and reject an
out-of-range channel with -EINVAL. Each case now has its own accurate
error message.

Fixes: 3daf2c4ef82b ("leds: Add support for TI LP5860 LED driver chip")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/
Signed-off-by: Mert Seftali <mertsftl@gmail.com>
---
Changes in v2 (per Lee Jones review):
- Split the combined read/range test into separate checks: use if(ret)
  for the read failure, and reject an out-of-range channel with -EINVAL.
- Give each case its own accurate message instead of the shared
  "missing" one, and drop the nested "if (ret >= 0)".

 drivers/leds/rgb/leds-lp5860-core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index fd0e2f6e6e0f..bc59be87b08f 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -114,13 +114,21 @@ static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *
 		}
 
 		ret = fwnode_property_read_u32(led_node, "reg", &channel);
-		if (ret < 0 || channel > LP5860_MAX_LED) {
+		if (ret) {
 			dev_err_probe(led->chip->dev, ret,
-				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
+				      "%pfwP: Cannot read 'reg' property. Skipping.\n", led_node);
 			fwnode_handle_put(led_node);
 			return ret;
 		}
 
+		if (channel > LP5860_MAX_LED) {
+			dev_err_probe(led->chip->dev, -EINVAL,
+				      "%pfwP: 'reg' %u is out of range. Skipping.\n",
+				      led_node, channel);
+			fwnode_handle_put(led_node);
+			return -EINVAL;
+		}
+
 		led->mc_cdev.subled_info[subled].color_index = color_index;
 		led->mc_cdev.subled_info[subled].channel = channel;
 		ret = lp5860_led_init(led, init_data->fwnode, channel);
-- 
2.54.0


