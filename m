Return-Path: <linux-leds+bounces-6685-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GG7CCoScGlyUwAAu9opvQ
	(envelope-from <linux-leds+bounces-6685-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 00:39:22 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE624DF65
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 00:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E15AB6A5B3E
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 12:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4900942981A;
	Tue, 20 Jan 2026 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwpd6/bl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B36429835
	for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913453; cv=none; b=XHGqBF6cvDsK4RJhuT+/CcL7+nkJyKbhGuUdpueWRacj42VgcPbTYwUOjlJTFhHGHas7n9pVpyixSf/GCsvKiLBn1TnlhlM43E7dMHHxC2xH3kWcl9uqaPyvbQ00S1uxbx7bo/wykCHyjXC9S7cdQeyqqMPMi+xbb35O0bgLFKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913453; c=relaxed/simple;
	bh=jIBkxlJHIcCc3JY8HlzcY+4/Sq1XPQvovm3vReAxEQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gk6U8T3Y28ACBNwRUDntxPucUO4NhS980UeEY9E92g/Gy1WVY0r1jO6zE0irQFNd7JV1PUiHPm515y/FaaKB+iIoTPB9qC/HLK9laKQJOBmX2slikTx2wjGO4/ShpKb5rCjJ5Y4fwjVzbplZx9XxylfwYnneMK5ZMl/B399gGhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwpd6/bl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a75a4a140eso4228265ad.3
        for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2026 04:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913451; x=1769518251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnR4PJhsaUjZWZn+C6vALPZ6Lj3dxWE4L9BjOpkr0AY=;
        b=iwpd6/bl8uw0/LmLRlTE4DpbocYpdYAtij2ti6OibJmaoLOl1ul3O3A+4/ygEvVJBp
         U96MCfXYoPXqzglepNXfHmpsy/Ug8SuUWfY24Sqdg0m4yadYbGddQlccCuv6ceWM65vw
         zmAGQv2SJYcTfy2HIl4h02FgQbOtQscze8NTVyQsxyEF83LifoLDB7uP7FDAcL5+M73R
         90M1mu0d+nbzJw5XQApC6/XBIlIu+mAaXFhx2I1uav1CxeIK70K6j6DX2asQbzgUnmOy
         yYd/JNcAoNqV+o5GeXsqs6aKiOCws8oszEDugPi5jeUd/I+0qF65V6s0dxjD+0ACKemk
         wRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913451; x=1769518251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QnR4PJhsaUjZWZn+C6vALPZ6Lj3dxWE4L9BjOpkr0AY=;
        b=wis/hVuqWCZfvg5B9/C0XUkVWBr9RM/9VaCHv/CdyOv20HzyjWEKknB0rz/zECkN4Q
         98KhX9Dh24qkl/g9SRkJoEV3bv5pgRkIESzou0yEVdAFf7Jq8Wi7ZsqeqOKVychKLTvy
         lOskaG0h3icTder2VpXvME+eq7I3tQexgzbPZQCD84VQal6LLjJxGPMpHkG5oU6tWYM7
         3zUrfSlOfzAybmDaA2aVPLB/oDLRzy5znNByT3DgP+F8AZqMT68NZhFdiHH+iJU3iGtP
         1YkHLNMaNQ9iKjM25P5mIr7EUeHX5eGML6QAhrL2K6bjXvWxnU48HgdxsaLRH6kwR4ST
         h+cw==
X-Forwarded-Encrypted: i=1; AJvYcCVSJTK2ubpdNV4m5TRD7p6HZnNsoEXzeQwYHIuxxTL1diiLu5p/xaoJnsPZnoWeoKkOB8dmB/AinCFP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwl51Ur1IhZg0Vali0q1mPoS01pkmFLOO9Q+3iYF5Z3WwZypTc
	D4ZdEsEiHG2ICqENL1GegTuDmLf5gAKTXPzSD1RSbEbRtP5VcWWLA+A0
X-Gm-Gg: AZuq6aI0/CYhgaAjw5juqRgwL2G5vTzDa8sGthioFI3OwSrLs9ODkqIhkkzrM+bfHPQ
	1vHyFZ1XqySkOOMQduWBq3ZQRoVfYXsb254KdvsZixRTywSZj1X+bHEsuzscQtEJiat70zWE83R
	h4to8wAIoV5ZpB7UYrzk1gx4J8zWC9CK7kqbkY+q07hZ6ZMc2FJ5bJQcBkFbaKG2pRo3LlApM1O
	7HIh5gzDXzC+ez/4CO1Zlt4mAKrIdqbX4ks9lOxxQKbreb5fysSfad/GB4BCfVBUEk6Q7kN3oaO
	u4ViMBmHtTx5CULAaQmvp089/CP89zKcr1HkzqBQGdPlYb8w/ffvS7wYz1ojOsRNPuGAv7pW2Rh
	IN8Ey7eDCfk1QlBVZ/42+cuEgWBMGLhNqFEb+D6Ss0qH/jv8lNenDI/+wAcJdgJdoExL8Fl+kxB
	xsCzRyM4IjJqI9zMskPjK2A1P8bfbZ5JB5S0tK
X-Received: by 2002:a17:902:e842:b0:2a0:ccef:a5d3 with SMTP id d9443c01a7336-2a768b7a68amr16787195ad.3.1768913450709;
        Tue, 20 Jan 2026 04:50:50 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd582sm124973815ad.52.2026.01.20.04.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:50:50 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow multiple GPIOs
Date: Tue, 20 Jan 2026 18:20:35 +0530
Message-Id: <20260120125036.2203995-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120125036.2203995-1-tessolveupstream@gmail.com>
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-6685-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 0EE624DF65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the gpio-backlight binding to support configurations that require
more than one GPIO for enabling/disabling the backlight.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 .../leds/backlight/gpio-backlight.yaml        | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 584030b6b0b9..4e4a856cbcd7 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -16,8 +16,18 @@ properties:
     const: gpio-backlight
 
   gpios:
-    description: The gpio that is used for enabling/disabling the backlight.
-    maxItems: 1
+    description: |
+      The gpio that is used for enabling/disabling the backlight.
+      Multiple GPIOs can be specified for panels that require several
+      enable signals. All GPIOs are controlled together.
+    type: array
+    minItems: 1
+    items:
+      type: array
+      minItems: 3
+      maxItems: 3
+      items:
+        type: integer
 
   default-on:
     description: enable the backlight at boot.
@@ -38,4 +48,14 @@ examples:
         default-on;
     };
 
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+      compatible = "gpio-backlight";
+      gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>,
+              <&gpio3 5 GPIO_ACTIVE_HIGH>,
+              <&gpio3 6 GPIO_ACTIVE_HIGH>;
+      default-on;
+    };
+
 ...
-- 
2.34.1


