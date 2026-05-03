Return-Path: <linux-leds+bounces-7947-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK1zKg759mkyawIAu9opvQ
	(envelope-from <linux-leds+bounces-7947-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:28:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492C4B4B4C
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51F8530209E5
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 07:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B48C3A9622;
	Sun,  3 May 2026 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdC82Uc4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54650299AAB
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777793224; cv=none; b=kUfbYYLTujx//be3/zuOQkt2ybaVdTGRiYrwWr40D4hD4H/nsn96UTsDP7r5+UBGMk9Kx7wyTJx99ImrFiACDaOGLb9ZQdUW0tp0T30etGjW95QaijY5E3yac9yeI6E/B0QADylCJ8G8YC2mDjQ/7Nj1eRmPOi+goFuvl1h8/Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777793224; c=relaxed/simple;
	bh=vfVmkzd8A0z6HncLF1fH136j0IdduRSTxvmyw33nVC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7AmJBTAAfIKmsycj7oDcMY7Y9KX/bBcEjVk9eD03n1yU7kIePuLdFw6zyjLhFwz/N3l5F4uTn6Xs1z/osalW25ZyE3RzNaJeJOhxlvJ4MkjbfxlA3DEZGm2OMrQj9uGh/K8glkHfBTWs3/ycpkmYkVRCjjNih/HvSGw3OJt4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdC82Uc4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b24fede2acso17388055ad.3
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 00:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777793223; x=1778398023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIb+W7y+bKsv9LM1iUZJZSIdILe100/J90mWVD85NJc=;
        b=KdC82Uc4RxV63zouQlJBoAiLSlIbk+EHp9xVB6Y9Lmr+4Wew9bv3DToJo2Vfg7J1A7
         gecK7yQP6B1CqUb4VPIQsj82S+YtQ+W8859htiC0oTo76vl3+v9rE94MuFFWH9WEOkhe
         az3KiZZspxvT2IKn4Bkp4nYdoqorePoR80gzVtnqDthqB1Urg7ipUxY5fbSd9SH+gXDj
         Oo9e7C/ixr6wUNuwY2AaszwnvT0/fVBoeXSGIVxB+/PdlVQR3INhuuys+IFighvgt0fu
         sBr8xVDASg3bhoNVoV4b2ytLdvv5zi7Od5eYtHVvg3VCU6wLS8q2c8a2+krC1ku5TycP
         Vp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777793223; x=1778398023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jIb+W7y+bKsv9LM1iUZJZSIdILe100/J90mWVD85NJc=;
        b=tFGuJhTp9wB7eR6Vq4My2o8RLsw4+Qc06fxSVv3vD0PpUhv5jjZoAh0CfehJJfPH37
         GDXmEEe12uSmcceB0YA5QHYpKX5dHv+iXjv1wWB3XYltQMyBG5nMzNaJwLIQNUmHq7F8
         zKGGIRAjl5hO9fkIXdvt6nkFAU1RytC5U2dHSRFZgUt6YCjtjdD1/ZgvjX5/iV5cDMgG
         rPmLpHM6I4JlkNuu/iTrfUWJTf6E0YSp3zATqgVI0eWxGoLjQlPEtsFWXpvMDAfzWrTz
         HmWXt+jdKCCThrm5OfHDYzuAnPHQ72yUZ3HGQPkwdHEdPG9Dk54beAT5xa+P4rAoc/wb
         9/Wg==
X-Forwarded-Encrypted: i=1; AFNElJ8zDsnmnDPT1p3gbNS8R3LatIAld+fAKKI5iDZu13KUZBGGra9tDw86YuJihpmvVA6Sg0NYSNJQVf6n@vger.kernel.org
X-Gm-Message-State: AOJu0YwPD4wLfVom9mSz6AaPmiZ4eTKEjQE6YhRvpBJki77pAko0KarD
	t8ptFF95WShmqeeSwYs/TfzXhiVEQKuSkX5UfAaKpbFUlTWomC66S10M
X-Gm-Gg: AeBDietbEXI3PAvP41CCbeht7h5jx7OuAODOiwa48ip4lMZZlreueRKraWQn2F66sIz
	MMDx1qDABdCIcnCtgB0D98Avs0vJB7CejaWxLIODu2j31jTp6HgPiIl4W61Y0MWKyGlIgwy/AI3
	+5KrrB3fmNbh8QH3+pjp/pRyMgnwxmGSW1R/mlhyBd6/DX8WhNxrmNDmAj/Sj7X6vgcg9iDq3QH
	sIk5JiNj/Bm9AxEVH/b3etFC+xFR9UjEzrd+8rOFTl3rEfuTLhzCbavxkhOBYzVFXSlFkKFb5DC
	V+9HhXKFG5f/uFKI52WHFUmEzvDd9GXqpg7WLzPCA89FH/iUKXrsy55Yx0JbthVsuSsxtUTljQi
	rEKq2/bbzZvTHIQpsE5Cw+1os2QNXb1o+xdv2OmSASAK1Cyzce5sl2VNY/0PTdV00/zN9m2EvQe
	m96ioq96l2OjQfIe7QaoEWY705f3Kc6JKOfeqFB+G+Bu8s6Gu5Dztwjo6wriXatTM6vsZOpQ==
X-Received: by 2002:a17:903:3c43:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b9f260d7b2mr55819115ad.23.1777793222705;
        Sun, 03 May 2026 00:27:02 -0700 (PDT)
Received: from tranquility.wa.lan (60-241-74-71.static.tpgi.com.au. [60.241.74.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae16a9esm64942945ad.50.2026.05.03.00.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 00:27:02 -0700 (PDT)
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
Subject: [PATCH 2/6] HID: asus: check feature reports when determining is_vendor
Date: Sun,  3 May 2026 17:26:39 +1000
Message-ID: <20260503072643.2774762-3-jye836@gmail.com>
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
X-Rspamd-Queue-Id: 3492C4B4B4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-7947-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

ASUS T3304 Soft Keyboard has these reports on its touchpad interface,
which will be bound to hid_multitouch. To support a quirk allowing
hid_asus to configure the keyboard interface, feature reports should be
checked in addition to input reports, as is already the case in
asus_has_report_id.

Signed-off-by: James Ye <jye836@gmail.com>
---
 drivers/hid/hid-asus.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 3f5e96900b67..ef9d5eba4dc9 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1282,10 +1282,12 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	/* Check for vendor for RGB init and handle generic devices properly. */
-	rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
-	list_for_each_entry(rep, &rep_enum->report_list, list) {
-		if ((rep->application & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR)
-			is_vendor = true;
+	for (int t = HID_INPUT_REPORT; t <= HID_FEATURE_REPORT; t++) {
+		rep_enum = &hdev->report_enum[t];
+		list_for_each_entry(rep, &rep_enum->report_list, list) {
+			if ((rep->application & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR)
+				is_vendor = true;
+		}
 	}
 
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
-- 
2.54.0


