Return-Path: <linux-leds+bounces-3983-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF6A3558D
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 05:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5124A1891318
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 04:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFED6185B72;
	Fri, 14 Feb 2025 04:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTYmwrCa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E744178CC8;
	Fri, 14 Feb 2025 04:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505862; cv=none; b=ZF8siewg+K9eaY4CoS8QHYoiWkU7HBTc4nzngtouvwdZbGJ45SqBnv9w2PDaqcEX5q8zleJY9WsGKtOEayNzBq/ovskaYeswOq7V3eHz6OYcEJhBWsn4XyC5gPYy8VeYBpPjU6CLn/8InsiGaBX/2dv38Bvlc7+aI5NEE4ytPSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505862; c=relaxed/simple;
	bh=mtPz4s+4egQ0jOh3GQAGAPwNPBPu0BZnd8qj+UMcZso=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngP2c7Ak5gG8Oo/MPMZwiZRGigcfiocC0BKShDJH0dHNOYhD4CNNZhcp2gxGD84v61wIhkLm0q6UpweLzN2bICw7eH5pqWpJ0I5eDeFczkRxb38rjq7Q10RhYdt20ai+vgwJ/IPZHr4dYxeuCQG/er6Ir5W71i62lBuud8q7JqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTYmwrCa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f5660c2fdso32443355ad.2;
        Thu, 13 Feb 2025 20:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505859; x=1740110659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=NTYmwrCa1RVeC59d+k/EUbi3uRfOn7E/v+Zq9YiAQ7iGM4p69ket7ytd/a2otEWTBf
         3IUb+glLEUtIhsQAXRZCFZ3c85Bcs78vEGZTdAlyKFvm9IHGc08vrTnTfLbp+5IxsPN1
         kA62BvZVyESIbw+mqGZxe+QwX347qQ0qAnWK/bKQfJ5woyojV4CYiMIJLVT+PeQckljU
         bWBfswwhV5RURZEpHN5lLuT+HB6pJsCQvkbkCy7BslP+sbQjFq9OMJMjALe3ZDNaBhbO
         MeC6hw2j9qK/caz7SyJWyuFPGGwHxyfGE0i7L53LGhL91R0wpMHT75DghG/xDgd4pQSx
         hsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505859; x=1740110659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=c8IYcP0tq/1S0XhCeNYbwt2i8HLaZPfSdV1y/2A/YKgHKQW8v5Sozv/ZH4jHy+iEJK
         BvxniasaQ0sSrJjRZnx6GZ9VKF+yD6STLCtL61PFnCkPAh0NbLpaf83CkJlKMscynmzP
         5kXaCEGAJMckRyL2LE7tUAv+iMXMe7IjNpCItFoXPo31T7P1JeCPwsb939vsjatMXQxp
         AeXdgiTvE9uMspE0061FSd7ikqxskJW5IrO8J+Rf7hERp6ZIX88JFmzwWAeeeEl+xCZa
         Z84UQYUnx+u9UNDNd4nrV+5A1DaVJjj70N8Uv56/FJPoW70QXTnB/FzXAm0jW5TzXsMN
         pjoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUIfuAlPdahk+AxmtYNuoGE8QdOUw4QMIoGGalimk2FAdDnJ+t3yu+ruhcF7xO+hb+4oTMbrsvi8paEA==@vger.kernel.org, AJvYcCWOdaLSWbfEuWy5d9zh4tXgT97cieUgG2+K2HPzXqMrZxkkgvN255BWSkPkwBp7NhIBylAMICXx/1IH7Pg=@vger.kernel.org, AJvYcCXSyHN4cBPWt2L+RZVUQDqUGh6CP5Lok+x2t7XG0y1c9WHzWrYrDKJ3A0Bn+x44MA5iKE0TwyQxRxbhn+23@vger.kernel.org, AJvYcCXpHcsmP6U7ALjNyW0SWN8oyN7uSq3nvRuTiqmbMdth3aV/iXDMdVdcDFY3bv41QHx6KCaIu7pKxpD+@vger.kernel.org
X-Gm-Message-State: AOJu0YzwoQiqlSrAPA4Hv5oNfmztOz7dqd9sdHFATHS4GRH8Y7nNp8sN
	cKT6y627TSeOQkwhtqjSAo0iLxa5VQbn3WwJ9v6r3KTsfxnn3Nxj
X-Gm-Gg: ASbGncv4LGpsEJhyZcD5yqO2wkFaSMEtymjOdnnXzwJA0eG+6ciWiBo0V5TtLfX57Fi
	9aXBDhpmNoBS3lpA/QtA3xIB+RZgi8Fs/B9r0MQiGWI0up5ttDtPY339jrzAj41WWzf689hUt7J
	n25Ahl38xRFDTjqNi7QN/PN6Jy9lmgkLl67LlfViYuvdBaFmfITlarLn/L9Sp9TU/anhMzhYhwh
	DtvXfESTrQso4fEJtTXdkXD/mlbk1r7U4RMBUA1r5Yt5qMyAo6UbHICujjMWzUf4YJTGZMpaON7
	h8MBFpSsD9eV0v4=
X-Google-Smtp-Source: AGHT+IHkN1crcRx1umsgU8oqxNqZWEWNVP7TrG7rSyx2t22hQspF82Y6IBy/bUusVKbjj5NHW6Qt4w==
X-Received: by 2002:a05:6300:614a:b0:1ee:1bc6:2341 with SMTP id adf61e73a8af0-1ee6b2fe438mr10767975637.15.1739505859444;
        Thu, 13 Feb 2025 20:04:19 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:04:19 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Fri, 14 Feb 2025 12:02:14 +0800
Message-ID: <20250214040306.16312-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entries for the driver.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..a576324807f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2228,6 +2228,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2253,6 +2254,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.48.1


