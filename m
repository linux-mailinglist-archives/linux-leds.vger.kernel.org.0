Return-Path: <linux-leds+bounces-7869-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHl1GM8c8GlYOgEAu9opvQ
	(envelope-from <linux-leds+bounces-7869-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:34:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70247CCB1
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 384B7300A7E5
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF17154425;
	Tue, 28 Apr 2026 02:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFYTzFqS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A339282C
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 02:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343663; cv=none; b=J+8XcCTUZbWLDxZoKhKdGw+hZDvGtpqHKcuX6Y4lKPcitJvS+Hk4gEEbIfycu6gAjfw1eK7X6ZFZo7ef42ReFYGur+sBbFm+G/2FzGf5YIN63ef9AlwxgHFMuP8ChiRHl3MigdLM8zv4ChbvO9iDHqL28EGhSu3G37VvcYro9+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343663; c=relaxed/simple;
	bh=8FIj2vwHaCPknQp78twOz1Zth9N9Ie6U66NEqjKkem0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5fNPDDlU4vG/HFD+jsh7vdGHBVfe1/dye8n3mP9IvmU4MGuA7G5sAWsTgSvz+XG7TFeVX10rV0wbvxZSMfFxbLsl8LILVfHEfr6Ws7Wfp0LmcvlR8089M3RtF6vBWWpbvVTm6ugr0VR9mTz6Frax2VVGsGrVjzfd8ndVa9Qmqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFYTzFqS; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2dee127b3c5so805209eec.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 19:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343661; x=1777948461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=jFYTzFqS3K9x1SA2T5C5pjfh2LLncH6zdN5BsSQlPG2OKaInMICLgKuVaBj31Frwje
         6xmbu77dyoChYK6BZtBqcK8QiAld/SDdEGKE667AKh6B1hOpwV3zjdLr2qBulH4mwpIO
         f7UkXQeLkj32MalPUwf2yoTfIug7xL25enAX/ZYBbOLkcRPZU/ITkKmGpmOpsPY+6aix
         uY9Oyl/5BFjQoYfmqUiE55w6TH7+cZqzzBr5i37X9nBGqqdSmVfKI+zBYO53y78woPiJ
         jpj7DJdY/RUCmB8bZbBylrrMejao4qbd9fPHPgDaUTZP9X5DOHYbObp7RFtiokT5/lXa
         RaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343661; x=1777948461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=NbQV334frzjTwRNab23i0Ck0A3cw5WgiLgJ5np7W3yh6QxVnv2AxK1vJ32J98qvpmp
         QxlY+osnOvGls93e/PlD1qp6+lvfMvlIUJlBOITEexfr1b0oHXTTMQzG7rAbBBV3rQRK
         K81eDXcG4CMEdHVw2bHluGgYnCjKtZ+M4bsBU1EnqI2lXi0/lPL1uMetajPGl12pLag/
         f90j/vzuHQKDvdU0VUAlCdJM1oYfiQ1METgBOqOfFN524PqwFo+GN4QJiXqI0zTXbCRS
         UDvzpSavMmsS+mDoSu+Aq1FQuJkkLhmEQHma+BLiLHNi3UWGPQAe3jOHdwfEh3Noomfg
         VyHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fLi1kBAjq5zZ5GkxPJKAQX43e4uBAX4Suzu+f7EFW/NPa990H97ZSt9Y7Ayv3SE3tuLJiMUpSsQtA@vger.kernel.org
X-Gm-Message-State: AOJu0YyBT/w1GwkpxyVs2ay0yWK2g1sBTVtlIbmbpwb+igUz8+IxZAtW
	J4vJim2tVGDdn5tBBnUl3cS4BDhX/Msj57fGhS2O1FA5JlxiJOTmrSnY
X-Gm-Gg: AeBDiesU61JFxDNJVEUVVOzLCR0SzAClJmuq9VV9D/u0xQuDg/8+NIl5FacEZNK5078
	kQgsN76jFHNO4ESFA0X3WyPyMXDR9A+Txh6FWzwvVp12peWj8uI7czQBcSXMvf7k/X8zqQgUKG8
	F61EZ/jZYPbhGckolWugW5HvQN2D8dZaH2G18ZNk1Ee1+GOYk13v1WQWNy2sOCSeaWYWPNDP9k/
	Wqp9Xp37KAraGQY12ctMnSNhCzNVS3D5MdwPipjtGQLrNz6QcegSj8zC6wZawMUHjA9jotxmLDW
	/fRc8cnH28OaJwTXEBigIsanRm6qFEC+WV8NT09rn7L4XDtEcKCc5QY74t1uk9CMonSzS4vji1F
	kGI7xquMC/w7TNI8MFNWF5nEcoh18MYrBpZrA2JEMexqqlGB2tlM2rKmEl4iUrC82DHBM33UFwc
	48yGes4BHiq1CQLVmkV13TsZbtQVbaZFI=
X-Received: by 2002:a05:7300:a148:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-2ed09fcf030mr657870eec.7.1777343660956;
        Mon, 27 Apr 2026 19:34:20 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:20 -0700 (PDT)
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
Subject: [PATCH v2 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Tue, 28 Apr 2026 10:33:58 +0800
Message-ID: <20260428023401.330308-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428023401.330308-1-jerrysteve1101@gmail.com>
References: <20260428023401.330308-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CB70247CCB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7869-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lumissil.com:url,thegoodpenguin.co.uk:email]

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


