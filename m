Return-Path: <linux-leds+bounces-7946-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC+hA8n49mkyawIAu9opvQ
	(envelope-from <linux-leds+bounces-7946-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:27:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 172294B4AF7
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DB233001CD9
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 07:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8832E11D2;
	Sun,  3 May 2026 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MViRjv7S"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F2F299AAB
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 07:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777793219; cv=none; b=u0wFfduBjSyavJbetJX7ftVhjGQB5H2T+ok1QXvYo3jpx8t0MKXaNTNRq8yPLjzR3pV2QmZh3c2DCOAjgqpJ7p4plfFWpaQiDHVzNF7tRr+G7XgvmooZUQj/A5EmdAnC14DPwekT3n6zUMo+T3eUgn7MsGskHAS//s4kDVF504E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777793219; c=relaxed/simple;
	bh=MAnhnGSHDh4DLEx17HlkmYqXOA6wnOEn0B10wMuS0ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DL0S+0cicjxKRDN4YQcH0rZwATbCx5xunLpjcLM5VQtn12+3a8HqBsoTcXlPisVFu384lZ8Sa3FZXbb1Kh0oibnlU0ZyXrEQAVM4QfHmPfL9ChU7zToCAio84TE1garzgF+v4RVLXqfUgOQrIjwQWhheP4ZznOw59Zw5Ypzm/Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MViRjv7S; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b23fcf90b2so28434475ad.3
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 00:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777793218; x=1778398018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOg4qBHTe+7jqP3ABxr8VsEBH6RAq2wSVE0e7j4wKpE=;
        b=MViRjv7SDWq3aY+LO6csNEAFE/EMgX3BjBmRvQs2aumUWOAwoAWTwyRzHVTlSccXJV
         BLeItDqqWMkgWml9P2ij0j8A8jgtORErzUMjCEm/KPayo4aGaOcogBFJRHOh56YKPBtj
         tQGQXrwNvVP5t8OItb0ow3GxyyCMFdS6xvjFl+v9mfnOE6Vt5JgP9FJtK02ZtwFvO4tL
         dRRxY4KxiMGgq1LeMCCdRoskjHKWGCZ42nE6F1q+ABefbgWsDW72U7Karz9WB4P4aXRO
         5XbBLkOtwN7vSmHusbQkTvVTSrN1pP23GEfxYyrumdesNqk5/CoSnJcJR2wifoZw98qx
         fj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777793218; x=1778398018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOg4qBHTe+7jqP3ABxr8VsEBH6RAq2wSVE0e7j4wKpE=;
        b=GXb2zd2rIpmEfzi6bt4sctjiQRBBd6txUqGTrDoQYiKpgX4M8y/VNheEJvSUU9N1aZ
         q4n0n9IcnwpNHV1I+8XOLOnV/mJxzEmucmKnaOpOFinsHuGnK43cSJLyRtaMWFikaHEp
         YAzItE7q7aqL9B8WZkswTV6HV2VDsABIBQoEV1QCePop2ZJRcaG7/66OmTjQ811+3j1X
         OpUONpcv1ATxzrb5NQvz3K+3x0iCzXfYcQMg7NtscVuP95XhddKhJjCjndToFYa05cPM
         GMgjcs7mU+cU3M6DxBUbgNJyqKJg4aCi32knBNYn3Qpq3OPKMACMcSEsnzlt4zNKcnIF
         fbZA==
X-Forwarded-Encrypted: i=1; AFNElJ9m8PvFdtk2C66HK4stOwS9WiMQ0OGuP+07mdysu9DL6BujNff5hL8a/WBQNwWfKhD6xzdJ/LPRVYHh@vger.kernel.org
X-Gm-Message-State: AOJu0YwLLJBX1j4V76+ZNBlzPnDFVGfzzUqLwYdARJFsgZj4vkIk8D8K
	uDSrCvRcjFDSQ3y3bRQ7VJwgFgu30i0tyqjGPSMXBCEvfCyrBG6rKIlX
X-Gm-Gg: AeBDietmWPj6R1sPmvfKdNGfHn9EEw3+5I6UJ5Mu53xwQMGDUWAfzDdQVDCQuChrhz5
	yLxICOIBU2V191YNIewvK9QKiSlKWka1vC8LBiutNA93CukYKp3IXIFWfl10R6ApgcePAgSIhra
	SSCBsIikBR8YmblKKyUN8j+PjiIb9tjEH+YB6Rrc0NLXOfC+JEAJsvqTczfHUVOe/bIaYXnri7+
	RbOjYP9vU2z2lzkzGsezjLu38WCQkiPxDkwQ8iFZyZFMNVzIE4mDHJmvoJp7fvREh4nZDZjJ8Kv
	Da6GRUQYlZq0DWfBlkMx2FhMbNdV6rTS1lr4qzMrNtoqTriaQWGHA3JAeFNowi0e/svMnIFuaxa
	kHXyPbUmefPh0EsQ+HuLrmKUr2PXWsyc3FubRFoQy+pJKqGt3P+CPDvDw4Y93aqxEsi7ikI+0x+
	WhnQLTmU2IKgI7Ti5xzOpfHi+sAwcPhTzHU9YhxePJ0/YLCe9w3yAO0d9+sYzBDW6ZHBnRtQ==
X-Received: by 2002:a17:902:e548:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2b9f2579a38mr55557645ad.17.1777793217743;
        Sun, 03 May 2026 00:26:57 -0700 (PDT)
Received: from tranquility.wa.lan (60-241-74-71.static.tpgi.com.au. [60.241.74.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae16a9esm64942945ad.50.2026.05.03.00.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 00:26:57 -0700 (PDT)
From: James Ye <jye836@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	lee@kernel.org,
	pavel@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	denis.benato@linux.dev,
	James Ye <jye836@gmail.com>
Subject: [PATCH 1/6] HID: input: delete hid_battery on disconnect
Date: Sun,  3 May 2026 17:26:38 +1000
Message-ID: <20260503072643.2774762-2-jye836@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503072643.2774762-1-jye836@gmail.com>
References: <20260503072643.2774762-1-jye836@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 172294B4AF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-7946-lists,linux-leds=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jye836@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

This fixes a use-after-free when an HID device containing a battery is
disconnected then reconnected, such as due to binding to a different
driver.

    BUG: KASAN: slab-use-after-free in hidinput_setup_battery.isra.0+0x15a/0x9db [hid]

Signed-off-by: James Ye <jye836@gmail.com>
---
 drivers/hid/hid-input.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index d73cfa2e73d3..ae0e11c61eb8 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -2408,6 +2408,7 @@ EXPORT_SYMBOL_GPL(hidinput_connect);
 void hidinput_disconnect(struct hid_device *hid)
 {
 	struct hid_input *hidinput, *next;
+	struct hid_battery *bat, *bat_next;
 
 	list_for_each_entry_safe(hidinput, next, &hid->inputs, list) {
 		list_del(&hidinput->list);
@@ -2419,6 +2420,10 @@ void hidinput_disconnect(struct hid_device *hid)
 		kfree(hidinput);
 	}
 
+	list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
+		list_del(&bat->list);
+	}
+
 	/* led_work is spawned by input_dev callbacks, but doesn't access the
 	 * parent input_dev at all. Once all input devices are removed, we
 	 * know that led_work will never get restarted, so we can cancel it
-- 
2.54.0


