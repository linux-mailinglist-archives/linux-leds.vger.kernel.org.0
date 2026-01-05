Return-Path: <linux-leds+bounces-6524-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B11CF2876
	for <lists+linux-leds@lfdr.de>; Mon, 05 Jan 2026 09:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1736C3002505
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jan 2026 08:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCA332862A;
	Mon,  5 Jan 2026 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtiUjjqX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47334327C06
	for <linux-leds@vger.kernel.org>; Mon,  5 Jan 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603103; cv=none; b=Z7ECaGiXeeT9dHVtPJGgBvX4SPM7Q5eXqQopzi4SvzEukoNe5LpBVO3kgKelmmXzkyXtTkcLfOppVgkKJS3bizfU5L9rZ4LNTI7yxio2q4csh1sVlqwNn+c4WQmcmchfms9FqPnZ2CVe+dq6f2Sg+fx7wV5xHrYHvK7UwmeXjkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603103; c=relaxed/simple;
	bh=SVJlcDayOcdOuFmlxFZIJno8JEUkvS2rwI28zFq/GdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sXqQXSxG2bIbdkbTG/3OZBI864qG+IE00LALkTIt7w/PAzDNGxwjevMH+GAszU2X+D0PBRr6QH8+AbyY9qBt85RqVtKL/S9Wr4LuI6PKbsMNymwyFDbfaxqiwT7Nd+ltpKlD9gJYiDFw2t0/8mcSj/RfhvJ/2aSq0tRDnL4cbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtiUjjqX; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso14796812b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 05 Jan 2026 00:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767603098; x=1768207898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSJakbOsK6HuPfvndjr4pklixI6V6EaaZEWI2YnlWqA=;
        b=dtiUjjqXbW5jdbL8VOlxiuTtQUfEyMJBuZMuwbZ5AP9HI++LewDfGeIciBkMo97qLV
         k0p15eG5aY9g1rbscY7h0juJw7cKsewiUL58yWyB0wh/r+uJIFC0luGbgIXBnJst9bXm
         kcqMiCHDatExkU3ZQwDIj+2wRdBuXPmxPxxLW7IHyWcQeLIvCk0A025Qz2SIVy+vBGr4
         XMswSvZMCJPmUoJK4o2H+WZ8YbfLfvSvongu1fX4RdUdKorVROsOei/2kvlEclnG9cmb
         4QsTQ5fPWxFV5vFztXowIYQtjU41uFmoSXpJi/okhjDnYd7QFqqyfj+7pYuZyMyK6x8d
         mxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603098; x=1768207898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jSJakbOsK6HuPfvndjr4pklixI6V6EaaZEWI2YnlWqA=;
        b=eOVjEguEzOhy23PXP6A4WR8cDv7ogp2pCVIJG5KnXdTBZS66JemqugTQzr4OBSFeBM
         7MHcBEp89InzYEdmEHdPZR6Fn71k6LvNoqgrUhkMDJFoGIlpLZvrGewq6zqZYQcD9MHj
         O8OoHarX1wuSK2/ATU4fsPt5MiVxq+7Ii4jTbwFa4LTlOMfRYwMNy251OU5hMcUU5YUG
         CZwqEFfuNb9hv+9OyTiGCVxwPMHwPvKOxZxuRvX/1CFFyW+yGO49ng/cB3fOu/H/hRUu
         pOLn/zfDktI6cZdfAqeTDybeYxU4YeIJndZ5/yMpr5hVdGfwLI+eomC7kDn4n5mDOlEu
         C4dg==
X-Forwarded-Encrypted: i=1; AJvYcCXrY1PNql4ol544JVzgc0BdP/ipxsbdSJdOEXQIIHGclPrFD+yj4supdFNMZnkML9xB+x27gbhxOUx+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtj4IA8bwq0PbBHGBeOfXmwugPbLQv9MWrZSUvbV3f+GSFFvvo
	1gSTesBtyXiy41mbSnHCVs1J8MW+YZ0URDLuNY7MjGzPElQ8a1fc6mjs
X-Gm-Gg: AY/fxX6twnMgSl2SV6HMUZ9VHINStTgFjyxJXUyrh/dylDGJGjy/0zP6hsP7OP8bdRo
	OGcA4KnJ/PMy/GEYulB2sIaAJ/ls68FOoPN4+rOWi6EJMUtnLN1fXgXdTWqT6kfAIiIFwOPk0al
	t6jv31v0wwGBwn14imgLYG/WT3TCnnaX8/V9wc7z45XKgQF+aG4aWYi4DrnG//81J9EIWdr6AkM
	FgtLUvJusJviGgQNAYiB17pNoDhOmJcLYy2bQRUgp4nkQloqzmOB7k4m3RKTcIte3pk9kdZGdrF
	NQPfdEU6IDmV/g4X7iFmeOgeQ5K0lL6Uqz7ryTwOp5kZVYJ8VVgp3+x1gC6jIMxx8m3Mm0olOuK
	cTe1iXGzaZsPiLX/lP6eymgf2NWUMoJ+tf8Be85jP0Tw9zr1U70SdNB38xLO/K1N6y7wkVEIQ1u
	ioIztE7vS7ge40rvp3h3W6suRhdOBZdM44uYPE
X-Google-Smtp-Source: AGHT+IGdSTNTsFlnHGoKbBjCGcgH0vsgwPkGV6SlKLkkpRQlPt3vpratMO2N1qpXOb9AsWAQeM28kw==
X-Received: by 2002:a05:6a20:3d06:b0:350:7238:7e2b with SMTP id adf61e73a8af0-376a81dc150mr42017932637.16.1767603097900;
        Mon, 05 Jan 2026 00:51:37 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f476fab12sm5631951a91.5.2026.01.05.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:51:37 -0800 (PST)
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
Subject: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow multiple GPIOs
Date: Mon,  5 Jan 2026 14:21:19 +0530
Message-Id: <20260105085120.230862-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105085120.230862-1-tessolveupstream@gmail.com>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the gpio-backlight binding to support configurations that require
more than one GPIO for enabling/disabling the backlight.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 584030b6b0b9..1483ce4a3480 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -17,7 +17,8 @@ properties:
 
   gpios:
     description: The gpio that is used for enabling/disabling the backlight.
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   default-on:
     description: enable the backlight at boot.
@@ -38,4 +39,13 @@ examples:
         default-on;
     };
 
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+      compatible = "gpio-backlight";
+      gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>,
+              <&gpio3 5 GPIO_ACTIVE_HIGH>;
+      default-on;
+    };
+
 ...
-- 
2.34.1


