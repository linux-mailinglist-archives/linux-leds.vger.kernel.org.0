Return-Path: <linux-leds+bounces-7903-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEOuAiIp8mkxogEAu9opvQ
	(envelope-from <linux-leds+bounces-7903-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:52:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEF34974DE
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D74B3128C03
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 15:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62D6382361;
	Wed, 29 Apr 2026 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpJBBv7t"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2A8382299
	for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477506; cv=none; b=Nth8TIHom+WzBnkZkw36BM2JiqmtfdZz0ajl7tZUHKat85yqfaltaGy/e5YnN0mMs93jOarv5YGf43zAsxZUQY4HT76PvBzhl6zpIoaxZOkgYKJBcbC5PF4pYZAGXmSqfeK/clhLyutq/AIwbikHQfkNo6hRcfAUJVKY1h4VILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477506; c=relaxed/simple;
	bh=8FIj2vwHaCPknQp78twOz1Zth9N9Ie6U66NEqjKkem0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pU39aNKiNEld50swGVoxDD9q9UqPgwDONws933nLKVL/1bpFxZpZc9r9OC1hUZwkYZebfLaXN3JQHhIXT/OPzdsHhF1v5dsqIl4bkaQGZ5E9yURrr9XvJNlzG678V6QNbovxYsOX9yWGcwHW1QvgD3pGy4P3qxsJeur2wq4Coag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpJBBv7t; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c6df0b9bbso6959918c88.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477504; x=1778082304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=EpJBBv7toHW1Z6aPJkgTsDwNCvWuXEc3mFPVdhMAtuin4ce+nePSMFs8hSSklp54j5
         LhlMcs8RMKxcQM3ah+G3Oyvr41spYsCOYx5cHs/hFEwHhXybPjC1cF5u8InVsVPeHIzo
         PIGbWh4ofYRV71FL0C2G99WH7AE3vYe5Kb2VDDuPBPaTidsu6Kp6IYaxiFSJbOfxqp9X
         D4KOq+xeJFwOBz0y0P1+cGJxCLLstv6EHG4jSIwbexxN8EZh98d9lmFS88BcF2qNrPtt
         ZaZLf8dFON6uom17/K2vHB3ZD5Y4WggTV0JbYbt4na4bgCt5w9jBOlQdmshp6DvgCV14
         Bq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477504; x=1778082304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=FKz82ZYnKovfcXMGczZByNHuTgh6gcM8S9bFsNAO/bhRWp9SidInUPSNhSuZl7JUIO
         v5qi5ENu48ryCKGnhlZMwerIXllbVBIBZdoAYu/gDFGNoyHdKzyG/HdL1Bdvcg2o9uuM
         lY11qcbS1NeiM1ctxAJRcKsfqRns7dWS7l5XILhQ3cAfz4t1ktRrvdXqluuaZqaRyanW
         TMD4AZC+XD7o6L26k9J000YRATT+zCVVzqTrLm1HaV38sNCC1XBG9oWiukA0mg+Ch0U/
         rJtUfhnUeItzm06HLWZHvt9ziyUG47ksfNzq7lNFeaxZ11We+jmPiUlfxeRfTVCh3Q1A
         a9iA==
X-Forwarded-Encrypted: i=1; AFNElJ/e0GsYdyaFKlbSq1NZ8orM+RjvW8amHQhk+trseH0yLzHWk5i6xv3Sf81cx/mPTVqnovgFMVgRM52S@vger.kernel.org
X-Gm-Message-State: AOJu0YxRv/0A2XTuKMtyFgc8+b1pbWfOMFx9erb6bqJVzyjbttVgA+gN
	Fuk9SL69SpoaDfdOm32JKN1W1u59HXfXdimlgmgYC/lPklKLTLQqNQ1w
X-Gm-Gg: AeBDieuAa7yAxI3cb/9CgZylysTsqEjZko2842eAmFj52dNjVVCc6m+/JUKPInIswam
	7NMj9XRht+tvN9XrntUVLI16v4t2O1Ct18j82kBsWZlyDvMZmmQU4My1JgkV1v3AbhsHm8hNpVj
	z/+LgNi6M4z5zh+O6VQ4tq1jiEBc6rRLA/iTOR/urXQmNQjWQbnNpbMGUeivoTy7UPAIQBq+Nto
	ZRcS0MnxR8yJPH9pZfNkI22DZUgVvGufW/wf9qakrYlrVlySbGuLIGqGxcozdvr5usCVF+jl/UV
	bjq+U6ntkWPvFXBhu4pmbeGLUPIcBJCEbmG3t8aInB2Nq9C9PDUVhh27edRwJsjMwCny5OvasIm
	BSe/qtTXd6V7n0OtYIQZRsZFeN6zwCPlp5XnEtS2EZ0VPCdwoddU07aDzX0szygSb48csZ91e9T
	I3WeFRE/q6cdHOoE26Zpy+oLNn3CDw4gs=
X-Received: by 2002:a05:701b:2214:b0:12d:de3e:52c6 with SMTP id a92af1059eb24-12dde3e533fmr1978504c88.42.1777477504171;
        Wed, 29 Apr 2026 08:45:04 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:45:03 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v3 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Wed, 29 Apr 2026 23:44:46 +0800
Message-ID: <20260429154449.730880-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429154449.730880-1-jerrysteve1101@gmail.com>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7BEF34974DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7903-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index cb4741dee12e..25ce67940c88 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -21,6 +21,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
 
 properties:
@@ -30,6 +31,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3293
       - si-en,sn3216
       - si-en,sn3218
@@ -37,6 +39,12 @@ properties:
   reg:
     maxItems: 1
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
   "#address-cells":
     const: 1
 
@@ -60,6 +68,22 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - issi,is31fl3293
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
   - if:
       properties:
         compatible:
@@ -116,6 +140,7 @@ allOf:
           contains:
             enum:
               - issi,is31fl3236
+              - issi,is31fl3236a
     then:
       patternProperties:
         "^led@([1-9])+$":
-- 
2.53.0


