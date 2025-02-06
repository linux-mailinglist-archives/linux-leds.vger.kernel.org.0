Return-Path: <linux-leds+bounces-3881-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B553BA2ACB0
	for <lists+linux-leds@lfdr.de>; Thu,  6 Feb 2025 16:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 031243A3B41
	for <lists+linux-leds@lfdr.de>; Thu,  6 Feb 2025 15:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462A922D4EB;
	Thu,  6 Feb 2025 15:40:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BA91E5B80;
	Thu,  6 Feb 2025 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856448; cv=none; b=e8JO1c6rRfpfPs1lUgHjc7Vsq9djk9yR6tO7RbFFdyYv1ejd34PTyk98Ibu1+jAmD30m6X1Q6Qa4675dNaCKtmc46EIk0Mus7QoZ/nmivmdbHKSf74W+QPBpa28SDHY1OxDS+M+fFINaVAFu8OxJxso9a5m8sDxKl0KM7c//QkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856448; c=relaxed/simple;
	bh=MK3deRCClPKJMwnY3MZxzmHu0zeIe1KWhrUJmiP1gWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZRcK7ntIOjJ7dHtKRQ7Y8fzeSeY47Hd0xTjFrzPWoJbYe8dDOYTtPxtXAHFpgOCSXRPjmwGndTELFMd5FJMVPjBqg9j5N9kXDsxzYag+eX6TZ9jR99/1dHndg+MLe+Ct8CtLhhA5huhTO+KociRW+DSxAiqh5HaWEqDrq4t/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C3091F381;
	Thu,  6 Feb 2025 15:40:44 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1930F13A7F;
	Thu,  6 Feb 2025 15:40:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CDn7BPzXpGf4PAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:44 +0000
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
Subject: [PATCH 01/13] fbdev: Rework fb_blank()
Date: Thu,  6 Feb 2025 16:30:20 +0100
Message-ID: <20250206154033.697495-2-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5C3091F381
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Reimplement fb_blank() to return early on errors. No functional
changes. Prepares the helper for tracking the blanking state in
struct fb_info.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 3c568cff2913..39e2b81473ad 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -339,11 +339,13 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 }
 EXPORT_SYMBOL(fb_set_var);
 
-int
-fb_blank(struct fb_info *info, int blank)
+int fb_blank(struct fb_info *info, int blank)
 {
 	struct fb_event event;
-	int ret = -EINVAL;
+	int ret;
+
+	if (!info->fbops->fb_blank)
+		return -EINVAL;
 
 	if (blank > FB_BLANK_POWERDOWN)
 		blank = FB_BLANK_POWERDOWN;
@@ -351,13 +353,13 @@ fb_blank(struct fb_info *info, int blank)
 	event.info = info;
 	event.data = &blank;
 
-	if (info->fbops->fb_blank)
-		ret = info->fbops->fb_blank(blank, info);
+	ret = info->fbops->fb_blank(blank, info);
+	if (ret)
+		return ret;
 
-	if (!ret)
-		fb_notifier_call_chain(FB_EVENT_BLANK, &event);
+	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(fb_blank);
 
-- 
2.48.1


