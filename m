Return-Path: <linux-leds+bounces-8063-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLiyAjY5AGo7EgEAu9opvQ
	(envelope-from <linux-leds+bounces-8063-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 09:52:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136C50302A
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 09:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B47153004689
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C488136166F;
	Sun, 10 May 2026 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tM00DmCm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC9713A86C
	for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 07:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778399524; cv=none; b=sIzAuMPeXRTDJP1vKa3MLFGNcYWAE/F6Akgc12jeIv/y3dnpTxyVBEzTqJQgqDPLao9b4IJU7cnEQLi2/jFLkKmHJXGnl+s+8keLezub3pdmHYavyWlU9UKRtXRB+5fOmCQ40i40LqXAlIBkNRofAHp6lBGd/Lnr+tWXDcgMsWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778399524; c=relaxed/simple;
	bh=I3RbvvixJNBu1E4egMQ60g4m3BIXi222hdQIEG7C75U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VS2xImqGsqtuzFbBsQeGc6IgEz7TfX7LF8qIBhP/MSDTTJhRPpjw6llp9CvvUF+T9xNrB08j0dzZjcLXFDr8DhKNiEj2lUlBH25p85ffZ9W1ls1cnuTyFJGJJipXJEyHzYUIQsl6RDZtQsrRDJb/ix4HX3FzKp/536qOqHjXCXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tM00DmCm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4830b67aa6bso4032295e9.0
        for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778399521; x=1779004321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdfLct2boN8QS13w2Se+IjvTiv/vdm99vdvUaY+gQmM=;
        b=tM00DmCmvkKFxuZ3/bGRCCkVBrKckHq/SM5Dp94Dol94tN+I31ISiFxeXkCFXhs0S4
         q2OD8oqrIeayrVceJ+D53Bi/LQ+hk7SUTNKwx208se6kkwrtrssVjoDkTK8A+xLMEXY/
         lffPx1tcKcxWNT8kEurLxeRd3Fng0TYOBBl1+JLT3DQDpGFhgeOU787n+wst151QIr/q
         5MrhT56nodMM7YAj50+BEnYEswN1503UJsMj/+jIk71sbKEbXa+XJwrhGVbyYLtlyYvn
         eUIvTFlGxEFuQSc3T3Rc4tKyN4KXpOLSAgxKQk+X/z3kQs663+aN/Ew2BJriK8fK/bUm
         0pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778399521; x=1779004321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdfLct2boN8QS13w2Se+IjvTiv/vdm99vdvUaY+gQmM=;
        b=m0PjfKoj1lZhi/KUMhhZaghVn9GkrBPkTjR4dotCAQdCbnqVY3t0D+xiJaIiNzbIcv
         qrAHtAQiuv+OtF8lv7dnPtZGaCQ7sVZpake6S6RNaTA7REVsxky7DTQV1eRU25bfx3Wd
         F8YmvUBV5ZK+laBtBdK2efv4L0DOBjd+BNBJS9h4zIVhekCClFR/VKu8AtTy4JUZtbVV
         esz2jIdGrQbdQhnsT5QSQI9BMshtfUQNnlp0E/8Xn9uiCnIPfbScNuc6EmrogiaW5GtP
         LtCOKnUik7ta68ZiDJIe102KD1Z20yn+siknGySGz5UWFkmwnAO5olHmjtIAbcs1wbGt
         NkpA==
X-Forwarded-Encrypted: i=1; AFNElJ9RvRn1GOToumcwczbBbETWMS/RWkrNtMSbSdbCTQM554kRE5yolBWqf9AzFH+C2JgkOBYdC3pUO+TZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzyJe8bRFmQeV/r8MS5rA8xLBN/h1+UX/ZkcQVh6mTpMBcGdAhK
	bBmy8WoZE5G0SKRD9d4zw/WkSugw/01SPjTuKA/f8Vtz06KhJwJXqU8M
X-Gm-Gg: Acq92OHTCJ7QGjle0DPs2nw6+HhoCiynld8MwYlzdrEFKDGNn94cwUwHsWCtQMCuPvG
	xyluMHjbouVdoFz6ZoS1Ii4dJNFsNvvi0rLf5TLNQatgeQ4IAiOrSX9iynfNHsQlD9Jb+UpHxKZ
	PyGvy1G576a/PKmH0EavZm/4lY+Dd8Df4mxxoaN194dS0B97TIEYj9+3i+4OIBcMsf6pmaGagMW
	HtMdI6OM+ujXkDtBWdlB/ZTWPwT3V7SicNJy1mB9IP+4jRdmmSQh1xab5kLyAB7ZPR286FJdvtd
	eT4INjpSOj93TNYArjJXxe/NajWn7TjfWzZKg/bixVrN4S5G7XrR/wpXBGH1J2KcTKcI4eQ7dF9
	TAMU2YJCOIkQXVBt8XbImUjwYwUWvp6fFZb5AzqM1u81i+5JH3u7/PTT/4EvOkO58/Dmn2dqtgI
	+/Er/IcIAtLmcgduQpjb7iQ1M3YnKzvhfk513d81B+cCNnGNeXURNijj4wqWlNpQ/r
X-Received: by 2002:a05:600c:1c1e:b0:487:1fbb:5a28 with SMTP id 5b1f17b1804b1-48e52f6f153mr158295875e9.1.1778399520864;
        Sun, 10 May 2026 00:52:00 -0700 (PDT)
Received: from localhost.localdomain ([94.158.58.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db0b08asm49641235e9.8.2026.05.10.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 00:52:00 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] leds: dac124s085: declare SPI command word as __le16
Date: Sun, 10 May 2026 05:36:32 +0500
Message-Id: <20260510003632.35942-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1136C50302A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-8063-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

dac124s085_set_brightness() builds a 16-bit SPI command word:

	u16 word;
	...
	word = cpu_to_le16(((led->id) << 14) | REG_WRITE_UPDATE |
			   (brightness & 0xfff));
	ret = spi_write(led->spi, (const u8 *)&word, sizeof(word));

cpu_to_le16() returns __le16, but the local 'word' is declared as
plain u16, which sparse flags:

  drivers/leds/leds-dac124s085.c:42:14: warning: incorrect type in
  assignment (different base types)

The bytes that hit the wire are correct because cpu_to_le16() does
the right thing on either endianness, but mixing the annotated and
unannotated types defeats sparse's __bitwise checking and would let
a future reader treat the buffer as a host-endian u16 by mistake.

Declare 'word' as __le16 to match how it is built and consumed.

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/leds/leds-dac124s085.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-dac124s085.c b/drivers/leds/leds-dac124s085.c
index cf5fb1195..192b43333 100644
--- a/drivers/leds/leds-dac124s085.c
+++ b/drivers/leds/leds-dac124s085.c
@@ -35,7 +35,7 @@ static int dac124s085_set_brightness(struct led_classdev *ldev,
 {
 	struct dac124s085_led *led = container_of(ldev, struct dac124s085_led,
 						  ldev);
-	u16 word;
+	__le16 word;
 	int ret;
 
 	mutex_lock(&led->mutex);
-- 
2.43.0


