Return-Path: <linux-leds+bounces-3564-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 513859ECB67
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 12:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1075286D4E
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 11:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1405B23237A;
	Wed, 11 Dec 2024 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYtMkqvh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDCB232373;
	Wed, 11 Dec 2024 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916948; cv=none; b=c+pL2QIFv1dfziytxpaiqAEKN8auNz9cHLJIbZxG7wZD9tjGbFOMDgSEuz9Fquuymc2vd8/96PySkBkK1hujt0Mbm7Yq4MiPKecES73NEal/FpOoGQuADNebv8PTMkTHAKtsQq48iFBh4W+3k4iRDNNiAXZ9BlSbfAo2U8IGhdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916948; c=relaxed/simple;
	bh=pK3f5fCpUmizu3Cy6++UnM5omz/TBo2leaTtg+du6wI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTd+L5ESyqwNpO+5JKl1Q/rnEtyHBXZulYU3AcKeQRCVZHIcx5DXlwnSGmI8mN+dbzeHB4kLdwmvS8TDLmbjw8EXtFxTDnCfaWygdydgKBTbQz2u4eOjvwOoBhrwRckLvRGUQL+MyQ+zrF42T68avLZTVi6Pp3DcnJ/nfqOM+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYtMkqvh; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21683192bf9so11740245ad.3;
        Wed, 11 Dec 2024 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916945; x=1734521745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=LYtMkqvhGclKHce/aIJJjry/S9dWuD9p3WrGOW2PjCqeK9ag/RhV9Hq5iVutDD2QOJ
         EM2FrWbiGjxkaRZFJoS8KzueXvL1kVHTGCzfj2K5jZ55M9IiL5DTNPxm5K0jImR7/Wsz
         /T+5QCOxRq+N7LE9fDMmTGxWxopl4gISS/QeyCEQ4BqG81COmJ+B22htxe850M8pKYLQ
         vCrpQ2zlHEb8CJmhEQvk/UHEHlUMccy8VayFuiEOTXzZx4TfzuOGwm5fHHgdXEg9rHzJ
         W3ItM+ZEi4Lq9jUjwOI7Ta9Yt76NG0lHX6woojNLRd0/fgOLg4KYl3nAuaIiDJIyBMkt
         zUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916945; x=1734521745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=jtTSAMMyutogSj2eTCCI6/fWjAO7Gm8tYDQ/P3VGjrPlNoLy8d3qw9kGj62z3YpIsH
         aqXuDSkZ5ZfD4P2udVFd4zh298NRTMyfca5sEuOhJFN2lnKZ0QX+rX97WIhFpQkKfaWJ
         Z2S4+HKnoCTfocOZslpobpX38jEp78hdvWy13ne9aIqGUlOStyRKE3SDNQHmBnZgJBWq
         cBNCtBcnNYbOb8ZEELu+P+zveIo/CvY5IaDg6lsdgDSZ693p0fibFl7dIcy9dQjeE4qm
         LvlFiPuBeoYrkqEgpI3mpbab70u4rqXZBoMJCgyysM5oBj9+ee0ZtI7erlxtQEkjejSm
         RKkw==
X-Forwarded-Encrypted: i=1; AJvYcCUQvZ5ibsgsJUEZ1VT4eKizus8oZT3lfARjy1K47BSyAgDAmmrDvDHruz4eDNnkGvY1y2twqF9IL8revQ==@vger.kernel.org, AJvYcCUYkxKucppI1rCCzdo2Z4PGwbY2kuJwVeBD//To6lMVwe5shbSg9XknGn5/SkP40mZRKKLYAMyeNeHozMc=@vger.kernel.org, AJvYcCVMq1CMnmYizg9cXb1+PBBn2+DiyPGkF1ocVXwQ46Q7hF1HHD+Fdd0Z9qaR7fhS78iZUsZz1gBpRhp8@vger.kernel.org, AJvYcCWN69QtThPcIPfDfS+ykCUOw9qm4HvBlC5Z5qFBMqmQrC6jaNc1UDGfUiDtDHbIBWeoSdPE5M7JX/PROeFd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpuq9YoUVMqXFGV+eZsuXdtWpwowxqLcQ/lL6Ktbglpb4dfpi4
	KDPdlSeXs+f1lSayP9JtMng4aUvYw+d4as7mkL4hWXEc4pTSFPlI
X-Gm-Gg: ASbGncvFXVozR3vIdAffRumZ3b+rPAGvJ6w+utir+M/8Wd62Z6VzU7LwM5A/c23+776
	OZncKFEDcq2QinxYCDhIFEBc70pnk0rf8SZZ5L/2WEWQBLsDnG5TVQJ9D+TVLFIaG7NtS+sk0JV
	mNyhjLsQM8Biy2LItKVuSqeiJ0ulJgFiUF9CGUkO3qAGUFOfvbr9hRvfvuqEE2h5VAN2QG0pL4n
	B9+/E1QXkAz88kx6k329c+pOElAq2lc91JBbyaxRkgG6HA3cC3d2K50qAEdeW9p3/EXYA==
X-Google-Smtp-Source: AGHT+IHPAoO6sweD7dzjHfcotRsgZIyMZdFaVq66RcEqv2cWXKrGq8y5aDUwVllnUENLHzeU5YMTvg==
X-Received: by 2002:a17:902:d2c5:b0:216:2f91:92c7 with SMTP id d9443c01a7336-21778393b92mr49397375ad.12.1733916944690;
        Wed, 11 Dec 2024 03:35:44 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:43 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Wed, 11 Dec 2024 19:34:39 +0800
Message-ID: <20241211113512.19009-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entries for the driver.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17daa9ee9384..3a7dec3f9a5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1


