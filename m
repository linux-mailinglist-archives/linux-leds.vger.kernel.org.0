Return-Path: <linux-leds+bounces-7310-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIPvAVkasmmpIgAAu9opvQ
	(envelope-from <linux-leds+bounces-7310-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 02:43:53 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E453D26BFB9
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 02:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE5BC302EF83
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 01:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE94E3750DF;
	Thu, 12 Mar 2026 01:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPOwLKsG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0593750C8
	for <linux-leds@vger.kernel.org>; Thu, 12 Mar 2026 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773279819; cv=none; b=OKlfYpNYkXuOkUKy8GnQaTbxDor8fqUOLpOsapAOfDCDA6fGVRp0OCMPspUxAtoV6PPb9fjrakCWzNFA7C1h+Rnl//rYFNyNBhbfawdpaYfj5rRZOnz3puJA5xBPAmp957CannFAeTDqeEQGJE1CnNoe4J60Y3LE5CX6BBkc+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773279819; c=relaxed/simple;
	bh=l6GNUZ4unz8iBC0eyUWwgfHXb01TZV/nJin3+Vl+TlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A68dEaiIaqYmnteM37qtwIt/ulRfYtlm7wKRSfTCTPlxt/qrR8yQlLFXjqXYbodNrlhHrkBaGvFOnT/uQADQGE9KoLy/AjbCgOsjYPEKMKP9To+AIOROiIvVCiIibDUpYy5EIeQy8ye7drDV0y/MIR9rhfohSYhWc7z7sqLp51o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPOwLKsG; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271257ae53so714800c88.1
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 18:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773279818; x=1773884618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+p7WEhcxdXcwT+nZFEv66r3PCaex7suWOHvSHtbhYA=;
        b=lPOwLKsG7GcMo1HMNtft/YycsFzdLsskWFt0YLLmLeRWUauSg4Lba6mfCV8e/kgtcY
         eitT1uf41Bm2HVCX+fLOd0aVnDUstXKCwrlz+05RP1AICen118LOsEnz7wJgOdDal9yv
         qQEEZ2nnKt/2IsAcLzwDYOugDrRw/y/xSVVN+od8XE1oqTmCsp8ac5SyjtWj9zSqEKaw
         BJWDmYNBE1Kn5B2k5uwJtcusFJsnl3RCpm4V53/M2EZLfr29wGgXgGRQJiSgESQ4rgm0
         m6OyDQZJk4eh3TWPcgSQtqqP5bkivtTliQgd1JkWEO8vCl9tFS38M/VoOrXR0Ya6fLbu
         1tKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773279818; x=1773884618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5+p7WEhcxdXcwT+nZFEv66r3PCaex7suWOHvSHtbhYA=;
        b=MhHQSHhVsvpS1WbglWcvlipFYqsNy8jB0LSaNeN5Lo/Jg2RIGARGGX7SGX1IZPAHAI
         VwGUGR/iYVTuvD394BzkwUfQB3DzNEVSb8ZF4NOyCIqXR/oah1XqwzkrhQlLBa1Liyj3
         joaG6qMQKClxj9oe/Mlj24nMkdNOh00xg0cpUw2+2+PeZwj1gw0Pf+giyX+p6ioKwQXl
         3R6A14vJzt1deo4DfBB5PMUv3+5SBIRdDc2O6UUoiJfIdwFsc9wf71W8iganvTI3XBYk
         4wZ1K00OQ6TB0FFKEtTiI5QzH6/PWnY9v53pKrB2t8cZSn9PtDlsjIfpQmUftjqNa/1r
         bgGA==
X-Gm-Message-State: AOJu0Yy3Ex/9OW74P2zDYJGU4A2EbCD+3Z1y566x6auLaP6NndzyuU9W
	3QKxvI30j6im8Pk6rJ2ADtzBhCJeBwsLJ3R98y0M7M9Rcvoi7hL5wiKtFKVnng==
X-Gm-Gg: ATEYQzxQOTOSyUtP74MPEDsoW5Z7SWdujQvcOsMoGaNlBBPUBrLY4E7/M20632hW8QL
	q3bOjB543F0KuSt29E2ZieVttOOqnHh39RUZEKR0dlOvlz5XHLiQWrJc1k8Xn/nX99gNhRd0XR4
	k8nWReT7rRqgVgGfdgB9Ibl2kRyU5dUoGnaZ9XvtU6pOPF/uAv+D1oBho1FGAh+rvFLcYmATLqm
	sqEuMJXGJ5W9p8V0EGntfdJOAKIWidS2Jnb3rSlXTh9DBtGL1WiZnB0EANj/NkFHC2khEu9pJR+
	YnR2G36B/AIDpIrcV4W/n8VLWcSX4aUJmSRzh5lmTs9CHC0E0R1TQIAAgnOYKMbyeHfKmk6Nltv
	i6rDzu4/eB/IODYLk/SZlZtSWl1tzTb3VaPqRFki/WRaKY/+8yi2LmAp/RdgDIwxdqM/Fpt9Jcc
	ZnysZYS9dKUU56RExjpehUYreblo/6i0/VPsNivaLWdE02F6oPQ79fN8cfWE3w7tR9cFTQZaQ7n
	j3t6Qxvup7GczA=
X-Received: by 2002:a05:7022:f102:b0:128:bac0:2ee3 with SMTP id a92af1059eb24-128e783cbd1mr2183396c88.33.1773279817465;
        Wed, 11 Mar 2026 18:43:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:53e0:5b17:5211:b0f4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7c0d698sm6619016c88.6.2026.03.11.18.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:43:36 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 11 Mar 2026 18:43:28 -0700
Subject: [PATCH 2/2] leds: core: fix formatting issues
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-led-swnode-name-v1-2-798a49e041c6@gmail.com>
References: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
In-Reply-To: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7310-lists,linux-leds=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: E453D26BFB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix formatting issues reported by checkpatch.pl, such as extra empty
lines, lack of braces on some branches, and misaligned function
arguments.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/leds/led-core.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 8ce41b36c645..385e78af1dac 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -85,7 +85,7 @@ static void led_timer_function(struct timer_list *t)
 	if (!brightness) {
 		/* Time to switch the LED on. */
 		if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE,
-					&led_cdev->work_flags))
+				       &led_cdev->work_flags))
 			brightness = led_cdev->new_blink_brightness;
 		else
 			brightness = led_cdev->blink_brightness;
@@ -217,10 +217,9 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 	mod_timer(&led_cdev->blink_timer, jiffies + 1);
 }
 
-
 static void led_blink_setup(struct led_classdev *led_cdev,
-		     unsigned long *delay_on,
-		     unsigned long *delay_off)
+			    unsigned long *delay_on,
+			    unsigned long *delay_off)
 {
 	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
 	    led_cdev->blink_set &&
@@ -262,7 +261,7 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
 			   int invert)
 {
 	if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
-	     timer_pending(&led_cdev->blink_timer))
+	    timer_pending(&led_cdev->blink_timer))
 		return;
 
 	set_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
@@ -347,9 +346,9 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
 	/* Ensure delayed_set_value is seen before work_flags modification */
 	smp_mb__before_atomic();
 
-	if (value)
+	if (value) {
 		set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
-	else {
+	} else {
 		clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
 		clear_bit(LED_SET_BLINK, &led_cdev->work_flags);
 		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
@@ -499,7 +498,6 @@ static void led_parse_fwnode_props(struct device *dev,
 			props->color_present = true;
 	}
 
-
 	if (!fwnode_property_present(fwnode, "function"))
 		return;
 
@@ -584,8 +582,9 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 	} else if (is_software_node(fwnode)) {
 		n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
 			     fwnode_get_name(fwnode));
-	} else
+	} else {
 		return -EINVAL;
+	}
 
 	if (n >= LED_MAX_NAME_SIZE)
 		return -E2BIG;

-- 
2.53.0.473.g4a7958ca14-goog


