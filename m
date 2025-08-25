Return-Path: <linux-leds+bounces-5295-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E56A9B33484
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 05:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDAAD1B21B9D
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 03:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7552F248F59;
	Mon, 25 Aug 2025 03:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMN2Aa1+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E4323A58E;
	Mon, 25 Aug 2025 03:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092764; cv=none; b=ENhlF/4OxpvlE9M0jslHg5syZuGlXZ4gFgWPuqVTn9pOSErRJZDEDy3YOT8v+lxAHBN1mY69URkfgxw7kHUA1sXS8nesCLevegysev/pvwliEFDPWCplQuNgTTtlQNXkih0WiWRif3kSb/ycXD7HoGY3r5Rw1q+iw7bL8iATeSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092764; c=relaxed/simple;
	bh=t55BFdxkrH31UnYC34dwfgiDYqhZHKEdjQ6tBccRueg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OP7DZfpD6ax7iHlcLXsE8ELryowHqJonxvR7lohNa33tsMcReoH49rlRL5VyJlMDCWJQ3y8A8HOvvrs+vA3Dj4JmXeQDVlxD6SzDImj9L52RRJRHs1JZkdg0JXlNoZVElRI+GQVVItOWVMhyug9Qh1gNp5EQxwHhtsEbvllulko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMN2Aa1+; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70dbe6b8142so8554176d6.2;
        Sun, 24 Aug 2025 20:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756092761; x=1756697561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoFi0fOoSlOYyhxhA49ewaIAMmopl8uXLyivT/7yV50=;
        b=SMN2Aa1+G+TofK/+cLyZkFNLFSrfFHRCYyT3/5CNhV0irhVoUYzGOiHyqVR+kQUXzW
         m3lKt44vI6/T5pERVCP7Gbj6CqRfCzf1cYy2Lj3qp24YqjDu7QX6a3XKFXilr9yqdNIT
         9/uG7/Xs8yWwIoyUeUcceiZpUsm2JhMEc+5dbjlnZycaaqKIKGGRRm7SzT5a9tPlMgTV
         PzUYuCR7WWmkjzkCpg7Y01mYLBCRTRVJP7rrpWNRcxh+VZWWhCopkvUAtXuaAbl1FYh1
         fwdyaGYHd5ZNDTiOZdEAOa+jnojtdHSANnRL8C/Z9oHHcRQOb/NUqQb/9z2HQRGSbm5K
         nz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092761; x=1756697561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoFi0fOoSlOYyhxhA49ewaIAMmopl8uXLyivT/7yV50=;
        b=fOK7s8G88kA/jBeQ0p0IYH+YibxfTVHn+SXaNdet2sfR/c5w8QJFEQYfF2Wk+HSZmp
         hXAJ2dt7ZzMBvtCVgybXBqlFnGjy2veQqa0KPPolbj9cpYAw283NGUKVzq3F8yPbrD6D
         0qulrBP4L/yHWYpQLa3DSUN5+r4hSMd5c3IN8N3f0jS6rYKduDi6U5FLIwzIpDpRG84V
         0u39BvQ1nY66ux/zL8XpQRr5R4kg6l4L7qRtS8DX0JH7tG9vCsaPKsm14JxtxEPy5kvA
         s2CDVqKqT8+D7W2dXaUS8BOZTGrat1bUzDfFDIsHbXyw7U4aYYQOSsirLoX3FQafwUd3
         jzSA==
X-Forwarded-Encrypted: i=1; AJvYcCVc6BL/qRqYpVNJGWyJQbWz1tsMasrxzfL+SQAe+pvAf2UEBnfVXVKKYbPuXyz5dFaK5JT8LLllPjJf@vger.kernel.org, AJvYcCVrs8Pw1HKoaQD6CVowMF/U+s84dH0VwrnBhJ3n7ARLh9tecAPOqtBiEMQ9fH8BtXs3v9AXQFPxPjTscQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDHrJRCdzVwV8yEQd3oQQhxdWyYeKKBCapemWd//jmP2QbRBG
	pZOJXb8BaNwZEkLp8xvmoCCi5Xp5ZUU8W2Y9skRxg8s4l8WiUrPx4kDo
X-Gm-Gg: ASbGncsaTfE89TJAqZoLa/4nuG+v9QT3bio8EpJ/2NXrIzGV4mXa8X59VIOyjVwoeXO
	W0diSOcd5r4SvKoKi7s1rkjRocQfJJHPIf1wfNWyQHi9wECuUkdnbg5S5FORxLpVeDz+pvilHTi
	fxTFkfmk9BEd9AnmkKApNJDt9ms7CQAUfDxPe/W4nvxdwmlNc7zPDguAiv/wx+uEqS97IM5Slq1
	gsfc0olFgv0Gtzq1RLSQvEWKZHk+vz1TZ7dg1zvdH+EAP7XJCTNQMdtl1xrWqf9h+NfhYB/ECFK
	x6OhFCcnvrLPBQmZ1v7wqZq5st+RJpNOx9NUfeEnagTwO+DJTz6gW2YQvzq+sh7CDwoNzwtu8NV
	ZNPtI5jMno9SQuw2TiRu/uDmz/TaU+g4/joNJ8UseGMxHsRmBJne94EaMG9TsSm3MQCKxrb7mhL
	Y/Y6Y=
X-Google-Smtp-Source: AGHT+IGGTDj2BoZmTjd5+FNXRhmdGpGwZf8/2YTuUw0zGBlQLfEVEwZuvkrM6a+uQ2C9+WQ+5HlElQ==
X-Received: by 2002:a05:6214:f2f:b0:707:49e5:fb8 with SMTP id 6a1803df08f44-70d972015cfmr114592906d6.40.1756092760560;
        Sun, 24 Aug 2025 20:32:40 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da7147253sm38205506d6.5.2025.08.24.20.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:32:40 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add fdhisi, titanmec, princeton, winrise, wxicore
Date: Sun, 24 Aug 2025 23:32:27 -0400
Message-ID: <20250825033237.60143-2-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825033237.60143-1-jefflessard3@gmail.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add vendor prefixes of chip manufacturers supported by the TM16xx 7-segment
LED matrix display controllers driver:
- fdhisi: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
- titanmec: Shenzhen Titan Micro Electronics Co., Ltd.
- princeton: Princeton Technology Corp.
- winrise: Shenzhen Winrise Technology Co., Ltd.
- wxicore: Wuxi i-Core Electronics Co., Ltd.

The titanmec prefix is based on the company's domain name titanmec.com.
The remaining prefixes are based on company names, as these manufacturers
either lack active .com domains or their .com domains are occupied by
unrelated businesses.

The fdhisi and titanmec prefixes were originally identified by
Andreas Färber.

CC: Andreas Färber <afaerber@suse.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47..9fdba2911 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -540,6 +540,8 @@ patternProperties:
     description: Fastrax Oy
   "^fcs,.*":
     description: Fairchild Semiconductor
+  "^fdhisi,.*":
+    description: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
   "^feixin,.*":
     description: Shenzhen Feixin Photoelectic Co., Ltd
   "^feiyang,.*":
@@ -1233,6 +1235,8 @@ patternProperties:
     description: Prime View International (PVI)
   "^primux,.*":
     description: Primux Trading, S.L.
+  "^princeton,.*":
+    description: Princeton Technology Corp.
   "^probox2,.*":
     description: PROBOX2 (by W2COMP Co., Ltd.)
   "^pri,.*":
@@ -1567,6 +1571,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^titanmec,.*":
+    description: Shenzhen Titan Micro Electronics Co., Ltd.
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
@@ -1724,6 +1730,8 @@ patternProperties:
     description: Wingtech Technology Co., Ltd.
   "^winlink,.*":
     description: WinLink Co., Ltd
+  "^winrise,.*":
+    description: Shenzhen Winrise Technology Co., Ltd.
   "^winsen,.*":
     description: Winsen Corp.
   "^winstar,.*":
@@ -1740,6 +1748,8 @@ patternProperties:
     description: Wobo
   "^wolfvision,.*":
     description: WolfVision GmbH
+  "^wxicore,.*":
+    description: Wuxi i-Core Electronics Co., Ltd.
   "^x-powers,.*":
     description: X-Powers
   "^xen,.*":
-- 
2.43.0


