Return-Path: <linux-leds+bounces-9013-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /pP7LbILUWoi+gIAu9opvQ
	(envelope-from <linux-leds+bounces-9013-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 17:11:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB173C1BE
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 17:11:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Ujo2f55d;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9013-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9013-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 529993023A58
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 15:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760F92BE043;
	Fri, 10 Jul 2026 15:09:20 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DE6314A98
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 15:09:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696160; cv=none; b=kD2cbp4oIytBh46vK7uRLi/l7tbGPxPJNBqqzMBOAbKkysiAyqmt6amMtqOV6hKW53J+CDo860GXR6LG+pTjHntnmvoFQy1T0c722r3TyfulMGn42/Oe5fPG7wbS2sQ4QjQMk7kupIdFIo/4WIQ2jSemvRcys9mJNXzxCv1DaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696160; c=relaxed/simple;
	bh=AHERf1Vd15oGvCU1vIrFwXvrM9ofJI08NgRSLGkpoVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YissDVJkqvFuShQB80WysnxL0fH9LXbvUzgNmN2KtvGnPQ+Rlx4X1L/bmgCEQBQJVo5BTkGAR23jdeX4ofJHj7fSZNpMyRo0YCbzK4gxBDybKm+pj0joepgjssmr7nm27cFMswBsvbx7fjFBQiLYI0dwI8s+PN8VhCZxmcAGVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ujo2f55d; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783696158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pNxulV5VaX1gfQVD8fWS7g6QOBG7OlPjf+taGpK6D5o=;
	b=Ujo2f55da4hQ4j2mtWzFZazHr9u7G1qaBoj3E1Sji/LlRvZWBd8ryyUHX7aLy7Hp0qiOXc
	yHq6k+VxacqnxgYQZe3c+lcsxz2Ab616TXKGwNWSgmnUsDV3YcVFX/3XYfXy9a3d70YEqD
	5KOExmg2NjmpnUFg6gRMr569yvasPcg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-VtsCZIbkPIqF1enU4HK2WQ-1; Fri,
 10 Jul 2026 11:09:14 -0400
X-MC-Unique: VtsCZIbkPIqF1enU4HK2WQ-1
X-Mimecast-MFC-AGG-ID: VtsCZIbkPIqF1enU4HK2WQ_1783696153
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 127831955DDD;
	Fri, 10 Jul 2026 15:09:13 +0000 (UTC)
Received: from shire.redhat.com (unknown [10.22.81.211])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 089291800592;
	Fri, 10 Jul 2026 15:09:11 +0000 (UTC)
From: Steve Dunnagan <sdunnaga@redhat.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: gpio: Skip unavailable LEDs during shutdown
Date: Fri, 10 Jul 2026 11:08:41 -0400
Message-ID: <20260710150841.19669-1-sdunnaga@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-9013-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sdunnaga@redhat.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:jacek.anaszewski@gmail.com,m:linusw@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacekanaszewski@gmail.com,s:lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sdunnaga@redhat.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22CB173C1BE

gpio_led_probe() leaves an error-valued GPIO descriptor in the LED
data when an unavailable platform-data LED is skipped.

The entry remains included in priv->num_leds, so gpio_led_shutdown()
later passes the error pointer to gpio_led_set(), producing:

gpiod_set_value: invalid GPIO (errorpointer: -ENOENT)

Skip entries with error-valued GPIO descriptors during shutdown.

Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
Assisted-by: ChatGPT:GPT-5.5-Thinking
Signed-off-by: Steve Dunnagan <sdunnaga@redhat.com>
---
 drivers/leds/leds-gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 8ae71c2e91e0..63cb517ef385 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -304,6 +304,9 @@ static void gpio_led_shutdown(struct platform_device *pdev)
 	for (i = 0; i < priv->num_leds; i++) {
 		struct gpio_led_data *led = &priv->leds[i];
 
+		if (IS_ERR(led->gpiod))
+			continue;
+
 		if (!(led->cdev.flags & LED_RETAIN_AT_SHUTDOWN))
 			gpio_led_set(&led->cdev, LED_OFF);
 	}
-- 
2.49.0


