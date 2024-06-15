Return-Path: <linux-leds+bounces-1932-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8890909A5D
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 894621F216EC
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A33C6F066;
	Sat, 15 Jun 2024 23:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0873CJN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A219261FF4;
	Sat, 15 Jun 2024 23:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493175; cv=none; b=QHNb8A8qlLg56HaBPmHo2b28yPOASViHDl2aOmfWnSXkQa0wRB6BcDZi9w2tS1IH5vAq+lP977UtrHXt+HUyjamOw9gQGwSXOa3pRWtUqTVb+6rbRO58zGcnA/Fv2Y5P3zA79G01h8hvxvfWYr5YJ6lEGV7g91pfgWW1pR//lSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493175; c=relaxed/simple;
	bh=Y77MrkgTPpF9SsM+rM+21V+XO+R9QBEbnKLnh784hwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQilNTEX9VOZq5h8Y1PyMwQvDlbRi0l/St6bZ06uhXLLhDnriu9VVEWk94k2N6ZO2YyJuJ0GQKyojqR9MRmqMYdWFDurV5UliQCN0she+Jo81M5gVDttGdNMBrp5liZvbIdgakg7AExgvUrn9sEK1t2/QksfhHAgjfWjcP7i7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0873CJN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f089e35e7so2148223f8f.0;
        Sat, 15 Jun 2024 16:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493172; x=1719097972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icpBlnTDdeuMUSDTs5EH982zOvuXd6X7dmffVumwKI8=;
        b=T0873CJNdMMlanFn+eVhaDV01wq9AeWWSVuDTLn+fcU10+b/n2XKp9Tb9GCo9SjjhZ
         90N5k+T5wxKdZGzTR5N8w/yRgLxwpt84kjBjBNj58wV4/aZa/dk/OP1Rp4K6aXpWgy9U
         P2w+333QpfCaiYwbLtu9E+S7zsSF8nWiGhqohxSQsl4o9vGQt2ttekQ8MFrV39oatYjP
         wq6g8n4/kSbR6N1hNAFUyWZKzV0s7uP/EAPLfcThGp52ggJ7lMT/nA2BQo7mp6y8Rjbw
         kI+xXZLWsXoT9ZjsHqK0KiEgTigf+9ZElGOsG3mUoNdTr3RPGPpSRLCWrQZwwwWR41a1
         4dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493172; x=1719097972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icpBlnTDdeuMUSDTs5EH982zOvuXd6X7dmffVumwKI8=;
        b=CFfN06clXNv74kZPVRrbEb+aTBVveACl8yLyXe7CgHQHHMEK9vZyywDK0IP+LL2Wjh
         BI5sj83XCsE/IpQX7CQLGAMapgZq102xuJmhCDOtfCMENW85pZq4lLQ72UArw4Evfro2
         gwu4J/HudDKSy6Ccis2KpWJcvVIfXQxjg4YIwsJNrsjY0pleM1Cl4KKbDxn+fhHQI08q
         tUV7sO0NPafU3Mnf9WKIMMlN37UcIqiHz5PFrOSyxeGEA4Mv74mdOwl3gtVZqDrNVrus
         IHvFwEf6P+UgkRl+NeUUi/brXxBVZi5xPbWPZWT39VUd01vqcGpbMwD8Z3kuWZ1K1CKO
         E6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNfmR1tWQOp6CYLtw5L0MfNXyz7ZAhLRmV0/36FeRF9wn+UU6veh9gNinfvvFCWnL/rAGd+3NX2910fGDnYkMOUKK2Ni8/L+n0HvHxA82qUs2pAsllqJy1ZPgk3XJ5MvrmBkNgv9wSUBN69NUeUzJfaD6bNFpy39CYoT0dIBAhGPajpyk=
X-Gm-Message-State: AOJu0Yx/rRXBqsAm3io4j1yzmr2LaDkHIAyixsT8SkAnb7cSGJd3aUjY
	zdrKYalNEwyQ5XUoNsuTCinXWvLhmHkqRltZdLrZ4TLu6E4i3VQo
X-Google-Smtp-Source: AGHT+IGnWe0YtPha/kSXCaPedR48JnOd+Z7TjQuF7S1Uz+gM07Td4oPj43fgbmA7xrhZJnVzUpOGIQ==
X-Received: by 2002:adf:ea04:0:b0:35f:22e3:1e0c with SMTP id ffacd0b85a97d-3607a7e7c65mr4483920f8f.69.1718493171675;
        Sat, 15 Jun 2024 16:12:51 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:12:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 02/20] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
Date: Sun, 16 Jun 2024 01:11:32 +0200
Message-ID: <20240615231152.28201-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240615231152.28201-1-ansuelsmth@gmail.com>
References: <20240615231152.28201-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new ti,lp5569 compatible, this is similar to national,lp5523 with
slight change to reg order and reg type and advanced way for LED fault.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index 77828dedbb9f..fe8aaecf3010 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -28,6 +28,7 @@ properties:
       - national,lp5523
       - ti,lp55231
       - ti,lp5562
+      - ti,lp5569
       - ti,lp8501
 
   reg:
-- 
2.43.0


