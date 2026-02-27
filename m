Return-Path: <linux-leds+bounces-7042-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ5xKXnroWkjxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7042-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:07:37 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF081BC6F6
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A7983047DFA
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695B13859CB;
	Fri, 27 Feb 2026 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="DMTdmVsZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FACC394474;
	Fri, 27 Feb 2026 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219223; cv=pass; b=SeDMq5mwF/47CySV6DposYj83L6mFq4yeGJ3Z6UXcFOwolZ2JCnajFGdE6+AVc+c4wm27eI11LVH3ABbVKPfR/OZkLZIzEX2d1xu5kImnmuoTVbdb10WW/Q8BxnHEqJobYio02wY6ER6oWqiKqqq07cwP3WS8iflcinGKtYZitw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219223; c=relaxed/simple;
	bh=4G9jj6Svg18/nMlvvboYLFlnTkufwv+NKjjxvrg/res=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2imS35TuX3u8P3yBBjfk/HdiUrzzhJQBrDeYbYFWaf4wSMg0xo/aJ5FkHzmUaixqoBo4nj36sZprEgWS0S3pftbX3bEDzTf+5JRgaAzN39vJsFfURDfzsGFbNYGp9P3/om7qu2O2FoacKmCV6KjDa0GmxHVOYrHzkQTk/oi9rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=DMTdmVsZ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772219203; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fpAm+z4U/ZQg1QnNnT0AEL/kRqxI2J+coIVG0up5iAqzygO6RxHvotWsqhEBSrIJ99g5J/5rRMKM2c6TtEFjQ1ehzfzta/P5/WCyB2pOVIMArz6KRaGQiDVIBf+cSB5ll0Hc6v+WTxpEdqkga/RWoDGR8+wRg4V5eietLwInzbQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219203; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=05z1dKWZxE0N/dh7NI8s6YbOHwuenxDNxo6cynRRIMI=; 
	b=PxC8U9tE4O4iGCfQQWUxGV4ihds36go02bgq7LHB1CEfpKhCXduGuvvo+VTd6WxGEcuPi6OgHctpo7VXS4XWLBhxD/p686CqoAUq3AabItBh7+287wqlxdCRUx3ZItOj4wv+m5HYVheNhHuVXLJKQDKLg2e/2CVsOf0HoyyMZcI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219203;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=05z1dKWZxE0N/dh7NI8s6YbOHwuenxDNxo6cynRRIMI=;
	b=DMTdmVsZCYMrUPzXDJgVYKDtjTWQnFYLFzj1+sVwMKlyUOuyZ13PyrpwyY1SsG4F
	1DZ5TIAanKUReJm1/xZ6DMVGDJO1Jp/ziA8TbQ2d1EDgyUd5KyoAqYSIHyaQNQkawTD
	zRBZ1LHvB0bqFGzj+N9XzZ2pHV/8vR5TO5O65azvdtAg5zI6Iza7+wvk+Ox0XSVfeLf
	Nz19gYKPvf5aYr3qhTKDL55Z696gu5e+SlMcrU2s9kXYhfOU7U4D28SP9LwL0Lwoo1k
	uebHPe/eGpLE0IrzoetWoLnbWc4tmNeEG6A7ncAX+DlfMnjorVCpR8qDA4M75x1620G
	tj9BzN8aIQ==
Received: by mx.zohomail.com with SMTPS id 1772219202265523.2673967176976;
	Fri, 27 Feb 2026 11:06:42 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>
Cc: Rong Zhang <i@rong.moe>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 4/9] leds: turris-omnia: Implement offloaded() callback for trigger
Date: Sat, 28 Feb 2026 03:06:01 +0800
Message-ID: <20260227190617.271388-5-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227190617.271388-1-i@rong.moe>
References: <20260227190617.271388-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7042-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[rong.moe,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:mid,rong.moe:dkim,rong.moe:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2CF081BC6F6
X-Rspamd-Action: no action

"omnia-mcu" is a private hw control trigger which always stays in hw
control mode. Implement offloaded() callback with its return value to be
always true to reflect this.

Meanwhile, declare it as a hw control trigger as it's forgotten before.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/leds/leds-turris-omnia.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 25ee5c1eb820b..8e016ca864030 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -195,10 +195,16 @@ static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
 			err);
 }
 
+static bool omnia_hwtrig_offloaded(struct led_classdev *cdev)
+{
+	return true;
+}
+
 static struct led_trigger omnia_hw_trigger = {
 	.name		= "omnia-mcu",
 	.activate	= omnia_hwtrig_activate,
 	.deactivate	= omnia_hwtrig_deactivate,
+	.offloaded	= omnia_hwtrig_offloaded,
 	.trigger_type	= &omnia_hw_trigger_type,
 };
 
@@ -251,6 +257,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	 * by LED class from the linux,default-trigger property.
 	 */
 	cdev->default_trigger = omnia_hw_trigger.name;
+	cdev->hw_control_trigger = omnia_hw_trigger.name;
 
 	/* Put the LED into software mode */
 	ret = omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(led->reg) |
-- 
2.51.0


