Return-Path: <linux-leds+bounces-8733-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xicrHHHkPGqktwgAu9opvQ
	(envelope-from <linux-leds+bounces-8733-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:18:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B437A6C3A57
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:18:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ne0Bzf2P;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8733-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8733-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C93A301B1DA
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9963812EA;
	Thu, 25 Jun 2026 08:18:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE3537CD41
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 08:18:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375512; cv=none; b=AXlfN3AI9Ihokfh8jw8HkpBmZQOzjiCorkeM8t2h5GwjhK7euJY/lG2HRJ43zlml9xjuXx85RCvk/1o/lkj7uUxDyf5Nw3a/vQjTGoRKx9GAV6CDcPkxV+dv9qQJmQzdsg5biNmjw/8xUn/1GkTyPKnIFZrGFQaxesc+Bb6V++g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375512; c=relaxed/simple;
	bh=J4ST441g4GcL9Qf2m4E79qGEfDOnvVL9JwIy2R9JJ48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIolILleK8Z85AvnhwhXkLJQ1+xEygyPmnGZo1sUSU6Lleyk/iDXPAAoYERv+nHuPh72bZR0mUxSr0m1QEkGV88vYsgjH1eeq1l14g4dTPR1UtKYuahP2G73dOxJ1KCUAR0e1HnbENrfkLMbHg6xj3HsFlfQbj+zG19vDIKPS0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ne0Bzf2P; arc=none smtp.client-ip=209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa7a7ad475so2262466e87.1
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375507; x=1782980307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihKUarJUZQ4s5QQSEeZE4451TwDBF8kmyP9i/ksYTag=;
        b=ne0Bzf2PUc0naVwlW+xiieoMeD/JbIvMJbegoMJOB55Awv2EaqRXnsGYY6EbYe66EH
         KDJps+6Y3Vl/bhIx00XXmKFmsi64+WvGt6Xc/ngWVKKH/uGNa5lxvJr4GUHSynroEbh+
         L/FYFKN+Yyj2lxRPkMLUf9PFaeTbWKh/VrniOCy5dRfmTMKChSyCOJM1K7pf2XJ1dmhD
         igiTinOOF8lHrNbQCCZu1RxfZH7uzQVxhRLYgfakKV6BlhtBN33/kJvm06i1x2rGo6W5
         nZ07FALbbX5Br9F+fzHUK5uK3ms/U2ehyBp/3ETbQAodBw0BO9PRGT5AbMpBGNOhfcbN
         yYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375507; x=1782980307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ihKUarJUZQ4s5QQSEeZE4451TwDBF8kmyP9i/ksYTag=;
        b=BPrdTg6ixW8vYMU+51hiDWgWCrv0VIB1L1jB+YLvTA+Q5yxMdP0lSN58B0TsfUEsOs
         WuKXkmTKrypTj7AnRr9D6jVQx3nB8Kswo+z5XZANBgXOq8ruuau9xswbEbVUY86gSJ1z
         yMFf2ExJ1Nfhva1Iu09+yc0kKDohxGYz0mQgpUVIPmGrQcwC/nT7T/Z7dIqIQXEsGhUZ
         Y1+bj3S8l9O7rrmzsf+ojCOd0xLfG6V8Cb/oDmuNtMtcD+VSnet5lODG/K2EjZNGOHOg
         cgp31GtMbZQKN/hl9AJivSQK/Bt7AOR2BaA7dQG2LGj4aB9pX9pHzXxLy5lEncmh/a6X
         qJqA==
X-Forwarded-Encrypted: i=1; AHgh+RpLiiuz3il+8SPRKC6xbs1YL6LUGtT5I3ag+mo7wNYH080i+ZdsV/8eaXHjMFdmO0NHyBusTzBuzGLz@vger.kernel.org
X-Gm-Message-State: AOJu0YxCgWQXruZ0Of0z+1iybw4cLMyyWJM69ImaAPmrNvTXzlPngZeV
	W8qsdzzFLWa9W+YRFC9uCEdW3UJ0w5hBTQ8YfqpMAlxANh1CoMo7zBDJ
X-Gm-Gg: AfdE7ckvc2Ehbq1ay7BBOxJEBuMuI+Xw9hl8h+93+CTx2xzcZjneEM0lCEIPGGgcxkB
	F7BqaF+QXT95hLXISu94Jj2NJqtZu7rEWP/jviqxY7qqG9m7wC4//dnZg9oRfhjRkvB7CrfN2+f
	T9Qx8gFU+ps7cygOoNctBLNPF3bVDLF3Tem6FkkffZHTxTRf+Kt0Or5qiW/omwSRGFZM/On3HQT
	ntRt+sjnPeLYgnrK7Chp9azayEr/PoV0S8FNhK8SQyfH414x0ajUu1+5OM5T3nYmV0L1hc2+dUV
	x1rm2MIEjPTL+QYKORES9wYhGiA4jy2wYL+oZPtmaolrP+TXa43BNWl0pI3YOu4zcFL0Brxw5yS
	ThTEm19nnCIYPu7bpxhMmMeqC6j8M78nB3iwvicksbJspLhxuQUCU4PbiPAVMjtXIRjvqzGsV9d
	BfRDd9JVim6U8X1PXLN2dp/QgDrWaXmJvTLxRuXKzcSJBi
X-Received: by 2002:a05:6512:6cd:b0:5aa:b6b:93c3 with SMTP id 2adb3069b0e04-5aea1f695abmr512925e87.45.1782375506860;
        Thu, 25 Jun 2026 01:18:26 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a268sm2464601e87.38.2026.06.25.01.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v6 4/6 RESEND] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Thu, 25 Jun 2026 11:18:10 +0300
Message-ID: <20260625081812.33474-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625081812.33474-1-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8733-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:clamor95@gmail.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B437A6C3A57

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index 76705ea56805..da7abe2ec912 100644
--- a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: motorola,cpcap
-      - const: st,6556002
+    oneOf:
+      - enum:
+          - motorola,mapphone-cpcap
+          - motorola,mot-cpcap
+
+      - items:
+          - const: motorola,cpcap
+          - const: st,6556002
 
   reg:
     maxItems: 1
-- 
2.51.0


