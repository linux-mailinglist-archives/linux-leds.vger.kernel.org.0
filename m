Return-Path: <linux-leds+bounces-3889-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C557CA2ACC8
	for <lists+linux-leds@lfdr.de>; Thu,  6 Feb 2025 16:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB1801621F5
	for <lists+linux-leds@lfdr.de>; Thu,  6 Feb 2025 15:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8C4236A84;
	Thu,  6 Feb 2025 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QMhE1vri";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BJLaHXNX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QMhE1vri";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BJLaHXNX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02FC1E5B80;
	Thu,  6 Feb 2025 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856450; cv=none; b=AF1dGhEWsgupT+J3DL5IUaUuzGTKg4lL32gZz9GzrGLe3cCTnIIfDys17lwum51J/5lzAL9cU4sjJFZWMrRiqBL/SVPRuiyf0TiA0JylcosJkzWzTrc7Faq7zNorxsFZJOIELt2LhjOLBfnZBAUr9whdrmSovTBnG38OBeMGxX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856450; c=relaxed/simple;
	bh=qEBpG3mo9PThaqBTTjkTFicA3aYTjLCvBN7KA2BsoY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XejMsOkHDNjoV+qpmAJ832yC2+bHXxlh2dxDDCE3fG6L74kvr+cvbBhJod24uMdObJRH6tIFfqhBtkwUqf5QAX9bxL2i0OaW4pZIRmrMUSr7Cp3YIkENfKvrqpwqkV1fHQQj9H9215yVO6z0JhT2SYm7/9OGz8+PjvS3jdI2vCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QMhE1vri; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BJLaHXNX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QMhE1vri; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BJLaHXNX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F27921167;
	Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738856447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4HmnWiO+j4Ie9Z58kfsXloW5rXfEj25cP66DS1a4Gs=;
	b=QMhE1vritz4rOVswqaIsgj6Z3VsYaDJifwKMzDhTVsygvj1mfU3C09pffO2+KLmGrL5Kd2
	9EsVUx1nCtPe291OEmi/zz/z7vV89lJCIp470Yw8QitTGOFuk182LEUVFNnr9qs0f1fWav
	jLEUfp0FkWHb+z/+aJHqbp5XBglV3Kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738856447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4HmnWiO+j4Ie9Z58kfsXloW5rXfEj25cP66DS1a4Gs=;
	b=BJLaHXNXjavsD2SlaOc06nme0Xhy3ueTlNOxQRtAosdXb665qQH8MSGc2cMVW3Cuw18VYn
	X81HoAvCWvaEN/BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738856447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4HmnWiO+j4Ie9Z58kfsXloW5rXfEj25cP66DS1a4Gs=;
	b=QMhE1vritz4rOVswqaIsgj6Z3VsYaDJifwKMzDhTVsygvj1mfU3C09pffO2+KLmGrL5Kd2
	9EsVUx1nCtPe291OEmi/zz/z7vV89lJCIp470Yw8QitTGOFuk182LEUVFNnr9qs0f1fWav
	jLEUfp0FkWHb+z/+aJHqbp5XBglV3Kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738856447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4HmnWiO+j4Ie9Z58kfsXloW5rXfEj25cP66DS1a4Gs=;
	b=BJLaHXNXjavsD2SlaOc06nme0Xhy3ueTlNOxQRtAosdXb665qQH8MSGc2cMVW3Cuw18VYn
	X81HoAvCWvaEN/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDF6313697;
	Thu,  6 Feb 2025 15:40:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yP3fLP7XpGf4PAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: pavel@ucw.cz,
	lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	simona@ffwll.ch
Cc: linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/13] leds: backlight trigger: Maintain global list of led backlight triggers
Date: Thu,  6 Feb 2025 16:30:29 +0100
Message-ID: <20250206154033.697495-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206154033.697495-1-tzimmermann@suse.de>
References: <20250206154033.697495-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[ucw.cz,kernel.org,gmail.com,gmx.de,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 

Maintain a list of led backlight triggers. This will replace the
fbdev notifiers that all backlight triggers currently subscribe to.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/leds/trigger/ledtrig-backlight.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 487577d22cfc..c1c1aa60cf07 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -23,8 +23,13 @@ struct bl_trig_notifier {
 	int old_status;
 	struct notifier_block notifier;
 	unsigned invert;
+
+	struct list_head entry;
 };
 
+static struct list_head ledtrig_backlight_list;
+static struct mutex ledtrig_backlight_list_mutex;
+
 static int fb_notifier_callback(struct notifier_block *p,
 				unsigned long event, void *data)
 {
@@ -118,6 +123,10 @@ static int bl_trig_activate(struct led_classdev *led)
 	if (ret)
 		dev_err(led->dev, "unable to register backlight trigger\n");
 
+	mutex_lock(&ledtrig_backlight_list_mutex);
+	list_add(&n->entry, &ledtrig_backlight_list);
+	mutex_unlock(&ledtrig_backlight_list_mutex);
+
 	return 0;
 }
 
@@ -125,6 +134,10 @@ static void bl_trig_deactivate(struct led_classdev *led)
 {
 	struct bl_trig_notifier *n = led_get_trigger_data(led);
 
+	mutex_lock(&ledtrig_backlight_list_mutex);
+	list_del(&n->entry);
+	mutex_unlock(&ledtrig_backlight_list_mutex);
+
 	fb_unregister_client(&n->notifier);
 	kfree(n);
 }
-- 
2.48.1


