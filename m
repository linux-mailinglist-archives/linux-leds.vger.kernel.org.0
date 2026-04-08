Return-Path: <linux-leds+bounces-7656-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMxgATNR1mm8DQgAu9opvQ
	(envelope-from <linux-leds+bounces-7656-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Apr 2026 14:59:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F43BC7FD
	for <lists+linux-leds@lfdr.de>; Wed, 08 Apr 2026 14:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C664F30166EF
	for <lists+linux-leds@lfdr.de>; Wed,  8 Apr 2026 12:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66ABC3BE146;
	Wed,  8 Apr 2026 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kubik.pl header.i=@kubik.pl header.b="BtT+vlNv"
X-Original-To: linux-leds@vger.kernel.org
Received: from cloudserver3189817-3189848.home.pl (cloudserver3189817-3189848.home.pl [46.242.239.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8930840DFB6;
	Wed,  8 Apr 2026 12:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.242.239.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775652941; cv=none; b=rIxS2MtcGvHOs19gUmh7VoLcfm1VTf0DkAlQGxKM+1Q4/d/eBnvdkqS1nmfECQA/bXaV4oduqfzjrHCtPizbRRtxL+z8U8GdzlW0emhodLPAXTAgFWxnJZHFbB+FN2MufCH/2yqJpZiKjknJ4pwaKp1PGoChbK8li0lI9LM2rBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775652941; c=relaxed/simple;
	bh=uMc5Ay84XI0qtBuFxWYkYK2lRq01n0K9UZjNbjc8M10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hmYNoB3K62QwxFDTLVvj2K15h1stR91j76x3TLviA2NQN6OEN4wi13TUj6Xf4CHzaDwMVTfupsg0pYut6X8406oMrcfsDP73nUBfYC1Y36sVWqZIFAumiJiRVqavtrBvKAkvxMSVCTPqrq10G92Iy0lCWpsiwYOHId0xILnJGqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kubik.pl; spf=pass smtp.mailfrom=kubik.pl; dkim=pass (2048-bit key) header.d=kubik.pl header.i=@kubik.pl header.b=BtT+vlNv; arc=none smtp.client-ip=46.242.239.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kubik.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kubik.pl
Received: from localhost (static-46-238-236-132.awacom.net [46.238.236.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cloudserver3189817-3189848.home.pl (Postfix) with ESMTPSA id B52A7E4A97;
	Wed,  8 Apr 2026 13:51:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kubik.pl; s=dkim;
	t=1775649111; bh=uMc5Ay84XI0qtBuFxWYkYK2lRq01n0K9UZjNbjc8M10=;
	h=From:Subject:Date;
	b=BtT+vlNvo9sD2o0AmswBvPF/XY/tWe1xRC6uVpJ5aUo2GWYouGv7vToN8FN2wRay8
	 gMcw4oT28i+6lq0EVktCEFLwPV7CJ7wL1k0UERLojyhaZiDkho8jGVzZCxdi31U0RK
	 o8JrgtJZd4R69ga3o4JZaV5B5unnMbm2jw/h7RY3of4P5YfnuZ0ALQRDv9YOKSwMNZ
	 z8qxz/mGlMSz7MwphYL6naIjqdGQVCD6xiqThwyUkyr9iXfhO29qoPpHWkoJFf2U7E
	 qVwslXLYdS86ipe2LahcNuREQWuZ7YYz/1HhW3AgZdU4y0tusY3mPvkCOPZ/ASNwjK
	 i6ZK4PhKJPnuA==
From: Piotr Kubik <piotr@kubik.pl>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Piotr Kubik <piotr@kubik.pl>
Subject: [PATCH] leds: trigger: gpio: use GPIOD_FLAGS_BIT_NONEXCLUSIVE
Date: Wed,  8 Apr 2026 13:51:06 +0200
Message-ID: <20260408115106.379834-1-piotr@kubik.pl>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CLIENT-IP: 46.238.236.132
X-CLIENT-HOSTNAME: static-46-238-236-132.awacom.net
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: dmFkZTGUSTWTkFxv4j9k5HH4y2YtEbWJgkBNJ5mpvH+gDr174NK7NTno+uNDkjcngRevIINIlKMD+pgtKiRCcWe7Fy9cLf2on3ww58d5RmGJcwMW8UhcZ5nykXPDbKgCR8i2V91uP2ej1mR2q3ZjHFIX0iSIJ45nEaOi12nQRL12LXG7cpzhtrDTppGhUvR2UoxI9zTghjwcaSZ7Tryh90N/rN76L8xzDFF7l9efHkaXHHEmerotwkoiL+k50jA/RmaibRoMYmmHcruNb0W3CuTPaJWiI3kqusUpKZrv36ekDyz3eCsBrIjKA6YHFz1gx3KuidK4ZVfBk1xqfsnu+rqoyqH7QvNhTY7BwdJwbVJzPusbJPvnqQMU32As3f1UeUu/AlpYgh+XHBJh/KXLwmj8vz/TEhs6W20NaJEWO1PVTThmcb2HVEnCO9HhWd7vxH4IbTXdK0AhHqnY6bxw9tvH397VfX+5uWZN1rBoc68hswpZ/n5JMUP4ypPyJUWb+RNPLJqaUWNTNRZ3N5zkqDIlXyOapOp3g7OBtCSXz7odfKnl3RV2jINwaeqF3pAWFMDywmSmagdqspVESf/XaQU4suljMq7ZkJxbYNjkDJAsxyGEVzr2vsvxFPPRnIUCFR9YNQDJrCLoMb4muWNq8V3XMDIWcUtLDUt+q2sejCXyn9oBiQ
X-DCC--Metrics: sv043.home.net.pl 1024; Body=6 Fuz1=6 Fuz2=6
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kubik.pl:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-7656-lists,linux-leds=lfdr.de];
	DMARC_NA(0.00)[kubik.pl: no valid DMARC record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotr@kubik.pl,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kubik.pl:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 654F43BC7FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a GPIO is shared between the LED trigger driver and another driver,
the LED trigger driver needs to request the GPIO with
GPIOD_FLAGS_BIT_NONEXCLUSIVE to allow both drivers to monitor the same
GPIO pin.

Without this flag, if another driver has already claimed the GPIO,
theLED trigger driver's gpiod_get_optional() call fails silently,
and the LED trigger doesn't work.

This is needed for scenarios like:
- SFP module presence/status LED triggered by SFP Mod_ABS/Rx_LOS

Both GPIOs are also monitored by the SFP driver for module state
management, so they need to be shared.

Signed-off-by: Piotr Kubik <piotr@kubik.pl>
---
 drivers/leds/trigger/ledtrig-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index fc911dfec0ef..3b3e6869e856 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -86,7 +86,8 @@ static int gpio_trig_activate(struct led_classdev *led)
 	 * The generic property "trigger-sources" is followed,
 	 * and we hope that this is a GPIO.
 	 */
-	gpio_data->gpiod = gpiod_get_optional(dev, "trigger-sources", GPIOD_IN);
+	gpio_data->gpiod = gpiod_get_optional(dev, "trigger-sources",
+					      GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	if (IS_ERR(gpio_data->gpiod)) {
 		ret = PTR_ERR(gpio_data->gpiod);
 		kfree(gpio_data);
-- 
2.47.3


