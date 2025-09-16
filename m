Return-Path: <linux-leds+bounces-5512-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C59BEB594A2
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 13:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C2C1622DD
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 11:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489FD2C11DA;
	Tue, 16 Sep 2025 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GohmsA+x"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0BB2C0281
	for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020556; cv=none; b=XtBsytmYgDJWutujbgqrmJxvCZtkyp7GNdpltoa4oAlCNnYsuQxMZApMhVmELtCrW1oj1cdAADC3OSSsStyh/IOwacWqVUO2c5dpceV59dtZRdWPHgywEFbhmkx56OYydo97EapcpHcpsxLsK9VkSvqN2Wsb8PbN/+sDv/gJ/8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020556; c=relaxed/simple;
	bh=crRdg9H34iLCQvUWW+XJwz7wfcy6ThS5tgax/Lof2e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JggaDHcFT+gwnuQm54j/CvLiFTg8y8zeiWe2/siaAaipXHoPCq4euNj82MHPhQgIK+ZRWhBin4OXynL09EPZxRSdNP+yr0bqu/A9cFQ/dV/3aBYPhH5g1s7o63eyhLP6Fcz2qE4XHhx3WtemuzxW6d2rDF/NrScwEHVQOgAjHew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GohmsA+x; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-267dff524d1so2455025ad.3
        for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758020554; x=1758625354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHu193NtX7+iOFOKtOAeNY22s4s0XqIEn9OYXaVbsqM=;
        b=GohmsA+xDMjUQb1UxCPZURphZB0OQJgjulZwd8UROTWABpmBiCwKL3SQyCm/BoEPcr
         s7d4KMuBBne2ZZHTbos6kjVVE74ztpR/sU3P/ZqmqhJvK5pgBLaM7P1VWsBtOMTQljQg
         aHmULtTypDb5RpeZxY7BGgZE5L8fqFFncgKz4JVMoYehFU2yO5qzIT2TPzW8lbPebpnA
         leMLzHgV9Y9a4FBMaqjAEDI5puz3ujjaTgN/TdU7f9ykWfJTCoq5fPE2ETMFBEIjGtvb
         vXwVYfStE5uRRusOoQEyfuZYVu9iXpfS79/Tj8LBFLkdlsroyf4BdiDDEmv6W0mxmKUW
         6UOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020554; x=1758625354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHu193NtX7+iOFOKtOAeNY22s4s0XqIEn9OYXaVbsqM=;
        b=WfX5Bk2yxrcRlQXhAUHsWyAylYiRqm5GHyRSRCsS34qRnWwsW4WQ6gSPyVouZ9+zAZ
         PPP4GJUPnc4YlsFbQWqNWlgDMOct8I1L/vq2kky4TXOjxzOg7oHS2K5dnsUt2NI0iNLB
         7HfutZozh4OzY0DUGZKjtwNJTeBacYad1ePEoGVlb98IM4xPOrEHPNPtU2kYPHyWjpJX
         UxGD+mKMKQgJHgdBmCOi24CFcPKO/YMc4XGZtl9dTbc4uM5whwwEhKXhOhnIlH6aBvph
         8lNpcWMfNDZ3lSVzKuv9DgQjC/deMHSYWZZVJ48i0iQmio2nuEhaK9yuZBUoCiPd/bh+
         21Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVz9vsR2W12jDaU/hJ9RhZGFiswYVlboihf0yv+GdUz5WTbSNJaIIJV1FqMKENB1bdSIWZjz4HjbTQx@vger.kernel.org
X-Gm-Message-State: AOJu0YwRZldN30gcNHrwmYof6SL0JO98tKh6be6JGEtYHZ50vBorhRQs
	Sf6HsmfuLcXUm9H1LIX7TrrsIiyQEKPh1/m2+81ZMne42pK4rpJM021M
X-Gm-Gg: ASbGncsV3zKU45uLB+5hhWpoyWBjZ4OHPFwnIapLktVeKe+Gs3lwM0+CweNGlvUYyc6
	NY/xbGgQGEFL+CZg0NdjXPYLuDgyD/DHbpHVodbRdTY7aT+XAvWOc/jvdoRVsk8cXXoGh8MCeL5
	VBwjuXYnKLNpBNO8uK3AO50EZIQyiE5kDuXYjrYKk5Hm4TrryXZiEYsb/QrRUT81V9QN1Ka1rly
	kHEJSRHKfVRycVTKJ/7pE6n9w3xhLsqqOHWytrCOMdNjm2/mWIQh0zXNiIsYIb/Er38KHy5hCts
	kkPCr/QdN19PgekmK8G114XP93E5/hqKt+oIHTcms8J3WN1GiCTZfUv/oc4eYhbju4/qmjNdwIS
	vVlTiGAO4Asc9BLuLGCROvN0uWo075XkxJvE7Xac2AxOq
X-Google-Smtp-Source: AGHT+IGFkicd/asfJggBrf0Hlx5Usz5b0JBqM111rmkFJk9Fk0wty0IDyzpW/1bu2O8iuAPOzz0Phg==
X-Received: by 2002:a17:902:ccc7:b0:267:9a29:7800 with SMTP id d9443c01a7336-2679a297bfcmr68998755ad.59.1758020553931;
        Tue, 16 Sep 2025 04:02:33 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.103.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304ce8sm158761725ad.128.2025.09.16.04.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:02:33 -0700 (PDT)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 2/5] leds: rgb: Add Virtual Color LED Group driver to Make
Date: Tue, 16 Sep 2025 23:02:14 +1200
Message-ID: <20250916110217.45894-2-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916110217.45894-1-professorjonny98@gmail.com>
References: <20250916110217.45894-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

This commit adds the Virtual Color driver to led/rgb Make and Kconfig.

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 drivers/leds/rgb/Kconfig  | 17 +++++++++++++++++
 drivers/leds/rgb/Makefile |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 222d943d8..70a80fd46 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -75,4 +75,21 @@ config LEDS_MT6370_RGB
 	  This driver can also be built as a module. If so, the module
 	  will be called "leds-mt6370-rgb".
 
+config LEDS_GROUP_VIRTUALCOLOR
+	tristate "Virtual LED Group Driver with Priority Control"
+	depends on OF || COMPILE_TEST
+	help
+	  This option enables support for virtual LED groups that aggregate
+	  multiple monochromatic LEDs with priority-based control. It allows
+	  managing concurrent LED activation requests by ensuring only the
+	  highest-priority LED state is active at any given time.
+
+	  Multiple LEDs can be grouped together and controlled as a single
+	  virtual LED with priority levels and blinking support. This is
+	  useful for systems that need to manage multiple LED indicators
+	  with different priority levels.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-group-virtualcolor.
+
 endif # LEDS_CLASS_MULTICOLOR
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index a501fd27f..693fd300b 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
 obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
 obj-$(CONFIG_LEDS_MT6370_RGB)		+= leds-mt6370-rgb.o
+obj-$(CONFIG_LEDS_GROUP_VIRTUALCOLOR)	+= leds-group-virtualcolor.o
-- 
2.43.0


