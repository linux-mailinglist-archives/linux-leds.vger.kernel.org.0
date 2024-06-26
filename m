Return-Path: <linux-leds+bounces-2128-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0486F918674
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2C74282FE1
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E3C18EFC4;
	Wed, 26 Jun 2024 16:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnqMCbOT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D191CA81;
	Wed, 26 Jun 2024 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417634; cv=none; b=K+FJbFHOJDm0VP4o+XJToBtMB6XisWkX9R9GT+gcG8B2378/LWgfqmW2iJkRkzEJ1AAkWLLwEorYdg2hM3rzpPg1uzbQNhL3voNiygadU8NWL6HA8mkq/vnRu62DDEE00uP73BLvI/QaaZ7EgvBN7oS9NzIZD61AcbmVl1etzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417634; c=relaxed/simple;
	bh=qIfrIKATqfuPjRd1rJItllla07DSiqttjga7AD3nt70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXw1FZmsJs5+ozXBN/k03ZWDwXg5QSr7sR5E5xfAwCaGGgZRo1bxdu78iWKEyZz/oTfD15W6vjdlBjbwnggmOx2Iv921xS8ETMaWOkRRmKQvdDTzmj086E5NTyu+YqnkHDL4G3nUrCbEfwmtSsy3b6fYCmE+CnlR2J17Ko02zNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnqMCbOT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-36701e6c6e8so1006522f8f.1;
        Wed, 26 Jun 2024 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417631; x=1720022431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO3bPIz654pf/D6EIkpGpwR8o7HByTNexKTs9bSHTKU=;
        b=RnqMCbOTWLPSbWREMrKUt/xPinGVh2bHoOKAtKHUvYM9QI8MOtgOh3AIEtH9y1xm5C
         5RCpY9jLhaO4svm/MYz7qzN7Pqcuu17Ga397ufw5Rkuvsrj+YvHkW0TpfXCXZIUKdluA
         PhSZhgE5P9+TPZJIHUeOJVUUwdltLkT6zckSIH6pKzXzS0PxLi/b7XLcuUFsLnPip70O
         Oobxh9T5FIMVhCYHoYB9xVnTHN0+WjsaqSoDrdkSreVWgzhKGwTBRHD7wqbkJWRQGjyJ
         2+aaO2r2InZwox0hKNCwPYEu7LKmudWQWCG01/CVfFLkkp5JlfbfWvyuFqetbt6Aq4sm
         CgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417631; x=1720022431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UO3bPIz654pf/D6EIkpGpwR8o7HByTNexKTs9bSHTKU=;
        b=sWg4c9ohUfNztsxO2hJGLeEpwne2GcglKJRltrY9I1S64PvT9GJl1NcTcXxYMEwiNO
         j5L+RA2umQGAAwl4abn5Yv/QN+f4Z2e1uC5EdMtmUXDfGilmVxuxYlQZVPBb90Fxa6Kn
         2LaRB0xxtvrWUQiLzmHOXWibT6HKdXv5qnZhqDG3YDQBiMkeRBvQWOCvEZ7GYLVzf63h
         onAXMc+d/4zOrtcoqgy7ugFygoQ8+hcfha9OrultU41eh3uXOnF+NyBdp2BMzWiUZnxv
         9w8LxTE3ipQdsAuMjErIfJILwxHlUaPeKcJjQBVnihMPDCvY/+SXTI62Lt9A7HLHhudB
         oUbg==
X-Forwarded-Encrypted: i=1; AJvYcCXxCnfSj3o+Ri0CluDetaDTuxW5U8TEdXATkDoy8wOsvdmVVISz8Un8lElKs0idsdkw6kBlJ3+A/Og53zRFERLLXcBVTA90Q+XPIbpEQnI0oqHodPOosEHhu9WWb3SVSdRONEihwAq634P/wzwUC4YagOEUZ+C5FRZGlKy27pyaTV8aFzo=
X-Gm-Message-State: AOJu0YwvJMS3/+8hWx4GDIw25g8WMUd5/yKyjZeRdBi4ubyL2+30yH0X
	GVa/f6f8G1EwrxDp622j3I3nHu8DrLAncE3thTww3TaQcMgZQBTj
X-Google-Smtp-Source: AGHT+IGluBCtwH4kR00fbUeVNfLZSRTyXbVf4/oAgwgq4IaZZgDAwMO9ADVaYO+y6GIyx3687g0HYQ==
X-Received: by 2002:a05:6000:1a45:b0:35f:f1d:f4e9 with SMTP id ffacd0b85a97d-366e7a1c215mr8147653f8f.28.1719417631135;
        Wed, 26 Jun 2024 09:00:31 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:30 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 01/20] dt-bindings: leds-lp55xx: Limit pwr-sel property to ti,lp8501
Date: Wed, 26 Jun 2024 18:00:06 +0200
Message-ID: <20240626160027.19703-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240626160027.19703-1-ansuelsmth@gmail.com>
References: <20240626160027.19703-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pwr-sel property is specific to ti,lp8501, make it conditional of the
related compatible.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-lp55xx.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index e9d4514d0166..77828dedbb9f 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -151,6 +151,16 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         description: name of channel
 
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: ti,lp8501
+then:
+  properties:
+    pwr-sel: false
+
 required:
   - compatible
   - reg
-- 
2.45.1


