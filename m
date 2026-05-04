Return-Path: <linux-leds+bounces-7982-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOKfMqeh+GlExQIAu9opvQ
	(envelope-from <linux-leds+bounces-7982-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 15:39:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC294BDFCF
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 15:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79343302297B
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 13:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355353DD516;
	Mon,  4 May 2026 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ln1hcwOi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C14F3DD51A
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 13:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901902; cv=none; b=XLLrYNXwzJO+McOoM9g7e3ggZ6WCrexbSUqnHT4Z4FP404pgWTJSTx40yYMmi2xF7VzD4Wwos5SNYtJNb2iyMph7vLqiEW9s6uDDIzKzLbmcW9Z7qahnXiWFob+ceve+lY7BzAPL40dzwfiMXypG33oLR7IDOSqdgAKbknEngQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901902; c=relaxed/simple;
	bh=xlrn1wLNvK4SDJ0CFFqnzUfa5+cyWSLe5ShwNi/ql14=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HXB6JRHGflsFWRlPw5/x8EGQ944HcaZOsOPEr5A52aLByYYC4ZSoo3x75mIr/oQ8h0wFltOtPdf8p1t24N7xJsTLwFDMy6cYzneP5IFgxZqBcZCkhhlGaTG/EPwBhPYIBMbzM3QOxh/1BZZ/XmrUjJeZ3U28WlJyTowvtMbCkjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ln1hcwOi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a875ca312eso26518e87.3
        for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777901895; x=1778506695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NHNBnzhwOfzBs/THHrRFnUQ2wut7uf+GdBpO7Z7oWQ=;
        b=Ln1hcwOi+GJloAjPuJshZ6E68Yux4I0pvsW4+iKEm1oGZoqjDTqQ5JD0uTJ5voQJ/G
         ZhjAw+/V/kZeGfhEmiN2PITDF2eQqxi4InXNuWNLDt4pe1rKMETn9z2jMlk96rXBnQUc
         yPzo9uJ88ebHhvMnMVV04+xIxYdF7YBOQ4EPb+EP9yDffTElkYmHo4tcqKCrRgIGUTVF
         A/cq+t3yOiLBp4+5gh3jyHOFWy9v7E/IzrLHtZDT3MHlwrz3C23JSmFw8vs4p20sMgNQ
         2Tl0S8abwYn5ORXkWVwGaXDn6IhjzBIRVX6sa0ixCK4zFbtcTOk1+sp2dxYIB+ayjCUd
         6I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901895; x=1778506695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NHNBnzhwOfzBs/THHrRFnUQ2wut7uf+GdBpO7Z7oWQ=;
        b=F35p7axkVQgF+ozNAigalRLP5hmxCbMCJsl48c8jGWlhEV7pDprzuiboxlsVK7njbP
         rbJcnBPaHPheP625mo5UT8zI0MUd6p4DK8jSEPMqI7gDg8C9KS9gSbYIlmCMnBvK8tcW
         NVFAvWxK3q9P4V9tO7ZqgX5czXI0QHop3SsRXXhVuTolVbhDofxCwqy8PUs1MxZ+BurB
         0x+3yV9B+wrcmWHe1RFhwneiMzqMTVglzcvXmOUctv1ZodzcD6wd54my6f+/PdO0HH6w
         192rr6eACqWZ+49YT0iU7eBWIpZTvhSZyvXohUmFnzZtkdrY6IAdjjNjJ6bfA20aKs0x
         03Ww==
X-Forwarded-Encrypted: i=1; AFNElJ8Yv2U66ptDp/eznn8Xgw1aBoGNqRqm26OUOWVMifzncec/Z1AuBlfNyjCP5Kp9R6IyMufKM1vsm01R@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQegpc0RTh+1Gy5qtwwjAHSRFDJG/mDkdwKepPyPfWQHqq23Z
	sUyjaJeryNvmXLNqIEd/cfUTWawFc5qzdVanxBxVVRarYNnjP7piD5NFwmR7mv+HmvLPkg==
X-Gm-Gg: AeBDiesHs1jDYJAGS92jjKiGIDhE6/g8nnMOfzNiT8m6kQnfnc0SrW718m3U6kSwLpu
	Ept3DfR332rj6ZYIZkjxWgm4FPUxjvTjQi75JN3ODDMxk0tCwXwsVydDfiPtH9kFTIpfd/CBU0W
	cJJpN6duQWnbFsVXj1SdlSoRiPjWGndg+9kmToQNwTKhbgZSWKfezsjwoxBDgPVqUJ+kd2vXPUY
	RzJHCVHHai6SdFjrZJjMQBh7rRKxPO2/eJIgc24EAuk202KAoxjbkSa107I49iHlEG/USFdXyA5
	8PByG/lZBWBk/+4aJrAz94HKyl0Q2sfXVwYrwkxUEUeP9W8sAKvonm4x/QUG7b/54Ys8ObbaY0C
	ruSuYFmU8MP/PyabiDDo87qzIyp5GTzzExqdAgQsncdZKyXoJHGkv3BD2CHIxE/egu2BFns61+4
	Q8pckTaEeAVLn5F9B8KqlWOIdWoMvR7Pgk5vkUWaUwCDOtmjQ4+j5C7g==
X-Received: by 2002:a05:6512:3b09:b0:5a7:46e6:ea10 with SMTP id 2adb3069b0e04-5a862c7e826mr1607841e87.0.1777901894757;
        Mon, 04 May 2026 06:38:14 -0700 (PDT)
Received: from localhost.localdomain ([94.158.58.95])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936109039csm31166121fa.8.2026.05.04.06.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 06:38:14 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: jansimon.moeller@gmx.de
Cc: lee@kernel.org,
	pavel@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] leds: blinkm: fix spelling and comment style above lock acquire
Date: Mon,  4 May 2026 17:37:30 +0500
Message-Id: <20260504123730.1094-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1AC294BDFCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7982-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fix two issues in the comment above mutex_lock_interruptible() in
blinkm_transfer_hw():

  - Spelling mistake (Aquire -> Acquire).
  - Trailing "*/" was on the same line as text; move it to its own
    line to match kernel coding style.

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/leds/leds-blinkm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 577497b9d..1978bbda4 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -356,7 +356,8 @@ static int blinkm_transfer_hw(struct i2c_client *client, int cmd)
 	struct blinkm_data *data = i2c_get_clientdata(client);
 
 	/* We start hardware transfers which are not to be
-	 * mixed with other commands. Aquire a lock now. */
+	 * mixed with other commands. Acquire a lock now.
+	 */
 	if (mutex_lock_interruptible(&data->update_lock) < 0)
 		return -EAGAIN;
 
-- 
2.33.0.windows.2


