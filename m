Return-Path: <linux-leds+bounces-4170-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BDDA54D4C
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 15:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2553A96FE
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 14:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58125153803;
	Thu,  6 Mar 2025 14:13:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D826E15199C
	for <linux-leds@vger.kernel.org>; Thu,  6 Mar 2025 14:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741270419; cv=none; b=FsW0f/EwcYDc5YB2KLRWQ5VXO0ACVQXr16dA+l4KhglGK9iIsVFI3XTMbm016+z1CaQEpR+JNWWfx3JyZiwAsDV3gQsVwYqkJbXCHjNNhE3bDIjpZJKVopj0ObizX3M1NS8/0FGxYhsZMsf7i3fC/hK+2xJqv7CKrvhEcgiNEjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741270419; c=relaxed/simple;
	bh=/LN07wfOZX2o44gXHqPKwPDBTu7wJNW41TdyzfGRDgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPcl8fqYd/PjkhdleVjpH+zp4zymA+qEgMV08r20DK4sSuEjTn4EQWcIeC2a7G9BbZwFojKrF5ltUU5qyqalO7kt/KnTswfAiaeVhF0FsigjJXW1IgnkgFKcjAlC4lIoXJpqhpwV/z7lAnBnkqj5uTyKKz6A3jxrD2QBJIYFNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 609AD1F785;
	Thu,  6 Mar 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19E0113A91;
	Thu,  6 Mar 2025 14:13:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eOv2BHityWeveQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Mar 2025 14:13:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	pavel@ucw.cz,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	simona@ffwll.ch
Cc: linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 09/11] leds: backlight trigger: Move blank-state handling into helper
Date: Thu,  6 Mar 2025 15:05:51 +0100
Message-ID: <20250306140947.580324-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306140947.580324-1-tzimmermann@suse.de>
References: <20250306140947.580324-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 609AD1F785
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Move the handling of blank-state updates into a separate helper,
so that is can be called without the fbdev event. No functional
changes.

v2:
- rename helper to avoid renaming in a later patch (Lee)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/leds/trigger/ledtrig-backlight.c | 30 ++++++++++++++----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 487577d22cfc..8e66d55a6c82 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -25,12 +25,28 @@ struct bl_trig_notifier {
 	unsigned invert;
 };
 
+static void ledtrig_backlight_notify_blank(struct bl_trig_notifier *n, int new_status)
+{
+	struct led_classdev *led = n->led;
+
+	if (new_status == n->old_status)
+		return;
+
+	if ((n->old_status == UNBLANK) ^ n->invert) {
+		n->brightness = led->brightness;
+		led_set_brightness_nosleep(led, LED_OFF);
+	} else {
+		led_set_brightness_nosleep(led, n->brightness);
+	}
+
+	n->old_status = new_status;
+}
+
 static int fb_notifier_callback(struct notifier_block *p,
 				unsigned long event, void *data)
 {
 	struct bl_trig_notifier *n = container_of(p,
 					struct bl_trig_notifier, notifier);
-	struct led_classdev *led = n->led;
 	struct fb_event *fb_event = data;
 	int *blank;
 	int new_status;
@@ -42,17 +58,7 @@ static int fb_notifier_callback(struct notifier_block *p,
 	blank = fb_event->data;
 	new_status = *blank ? BLANK : UNBLANK;
 
-	if (new_status == n->old_status)
-		return 0;
-
-	if ((n->old_status == UNBLANK) ^ n->invert) {
-		n->brightness = led->brightness;
-		led_set_brightness_nosleep(led, LED_OFF);
-	} else {
-		led_set_brightness_nosleep(led, n->brightness);
-	}
-
-	n->old_status = new_status;
+	ledtrig_backlight_notify_blank(n, new_status);
 
 	return 0;
 }
-- 
2.48.1


