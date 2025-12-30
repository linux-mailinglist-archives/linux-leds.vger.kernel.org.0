Return-Path: <linux-leds+bounces-6493-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC901CE900F
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 09:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8016B301EC67
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 08:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FE52FFFA3;
	Tue, 30 Dec 2025 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXRO2B62"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4912E303A0F
	for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 08:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083040; cv=none; b=RMpxkkLpleR0MiQuynT0itF5Y9/99dgaBywyW4wc5zVeWrdoYEoZzGLVo/Foncv2X6XDMAGlMMtsXhmCal1+YCyNf+33Dgk5AfG0mUxEWo1P0xVP1JaNkRBEmeIvMnOKwuhGdpfphLf7S5LyfWberX8C+n/JnhngK7BNrFLeGEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083040; c=relaxed/simple;
	bh=fGf2+7rah7o8VIl3XrKMGN/1rQuHOlVs273H9WmWF5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GGqqlzrnfMZqiCuP9MrxUTB3qJ70ty5Q+Wsrn+H0IqlINL+cmj2G8kBPON7nX+dME0GHloM5x7izdTXIDBIb9Py/jAzf0d43+aTSxA+ocfp4Eg/BwVZAvrEOYujJO5qnvqLO9IHrXhQOA4HfENc9VJHGwymoy0KlIqQJTjMpI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXRO2B62; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0bb2f093aso98213805ad.3
        for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 00:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767083038; x=1767687838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+aoWuGKUE3COGr8tLv4S8keRb3mm8yhErb3FfXmO/0=;
        b=lXRO2B62Dwc+SNlk9cAO5M8x4Qaj3dy1R1GIf7lSnnITWU+JMlxPAvTBGAG+R/OnNO
         Gh6ht5G+OkWjZUSHvn7WiA72j5up5KUFqpaMWjYc9if9mes7oCoR/aC+TdxyfP+OgyZ1
         MyaEzqhTD4MIZrF7ANrZ1hD2dwiviexfLcg37/tFHfXTKKzekpTPrJ3S/HRS0PZzqlmb
         SgKx7b4ngjY4rwVxFXvb+RQgqrwXCk34jaKjPtTLh/N4i9qiu1xTVhg7UCqrVPvMNrsA
         C1j7+4W+EenmaaFjM0xc9MCkUOzqzCqZxNVtM3v1M/UD2bbxJivuNlAYcM7vMB0M/2F8
         +oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767083038; x=1767687838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+aoWuGKUE3COGr8tLv4S8keRb3mm8yhErb3FfXmO/0=;
        b=IG8aUDvY7rreMaUYiaxPEPV9wdQcnC/QQB+8Ju5SASvQU4dKH+pKaCe6U7RByRVl7j
         iJP7OUSPVwmCkkmYULhqndA3zARhzd2yg2+JUKFMwDN7XfiRfX0ut4DsP/3K3flmoMdZ
         lulKoKFFyneP9hVmCqVAqMNWkDikwgwlJrriK39PHJc/iGkPCG+oI0uLMN6DiCUziQaX
         6MBB6zSGLmpoupiVF0bsSifVZNWhrmtsj5zpWaQHaP5SuLkjD9t0/I/9caJhZ1fK0JUk
         J0nC6gLhvDV0RWTKXHkKz/iBpl2uJejelpZd9gazIuB3kfC+Jc7zqIKpgKoNnGZylkuN
         YrYg==
X-Forwarded-Encrypted: i=1; AJvYcCWpKjGStYlJPAXaxd0qbE/EL+RigTKkzdon/FP2cfbdH8OFoUaU7KhcapRCCrSS1bX010uVgBmt99Ub@vger.kernel.org
X-Gm-Message-State: AOJu0YzNJw8p4aq0TtCyxDf2+GZ5qxnLtjxcjYnh0o1N4VF/KBzaz5O/
	CJ6T3H9mhdqRjtureGT2ueE+ImM976oOViQSxqwjxm/ZNB4zFm3IOO3z
X-Gm-Gg: AY/fxX4MKYKn4nwShiRT3BTBZk34Iedwx2ny5dHF7jh0oVvH41HupVYGuXD/Vf33EVl
	mu/IHQxIMVU54njyR3BNDXlEJQu0HnCQObxB2y0Y44Ag0RFbcn+B1fM4yHe/n9iKk2GyDDATiUi
	i/K1QJ6UR1Fk6rzS3D1JAuV3w66XyrQMNYZlevncrxxpI8Ma8nwuP4FMdt/05Na96EekT02MBjl
	kv0TtPckd5pQTH2R4zjAhsMkrQ5wNjLg8e1J8PRHgZ/Ng4Zau8xm4cSDU/+n+m4+vLwZqRRumP9
	GhcIiiOlm+N5mlmQE5ljGpqi8yUE69P+ObYxSU4yF/1EqvBGEoBQiHeJkMya9UJtjLl/rIg3J16
	XhDVVrh2tTeoIVP9aZPN4PHxJYo06z+FH0Y55B67WlYpUX7aUzCicUqcUag6T9hWJHKvotN54pz
	bhST34sYRSV831sDrStwNk2vZP30nOVJDT
X-Google-Smtp-Source: AGHT+IEqHDfsSyDO3VlHTorugyXfpfeGQOeRJQU8qYXXgVUBz3RHLFMevwY9LVXP48/Om0LJAhGt5A==
X-Received: by 2002:a17:902:c403:b0:299:e031:173 with SMTP id d9443c01a7336-2a2f273241fmr322325705ad.35.1767083038609;
        Tue, 30 Dec 2025 00:23:58 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d76ceesm296667165ad.91.2025.12.30.00.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 00:23:58 -0800 (PST)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 1/7] dt-bindings: leds: add function virtual_status to led common properties
Date: Tue, 30 Dec 2025 21:23:14 +1300
Message-ID: <20251230082336.3308403-2-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230082336.3308403-1-professorjonny98@gmail.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

LED-FUNCTION-VIRTUAL-STATUS ID to the FUNCTION ID list for device tree
bindings to suit virtual led drivers.

Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 include/dt-bindings/leds/common.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 4f017bea0123..f03214ba28d5 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -63,6 +63,9 @@
      "lp5523:{r,g,b}" (Nokia N900) */
 #define LED_FUNCTION_STATUS "status"

+/* Used for virtual LED groups, multifunction RGB indicators or status LEDs */
+#define LED_FUNCTION_VIRTUAL_STATUS "virtual-status"
+
 #define LED_FUNCTION_MICMUTE "micmute"
 #define LED_FUNCTION_MUTE "mute"

--
2.43.0

