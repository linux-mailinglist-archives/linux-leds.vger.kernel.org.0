Return-Path: <linux-leds+bounces-1931-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681AF909A58
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BE6F1C2108F
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006176A347;
	Sat, 15 Jun 2024 23:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CT4t42wl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54242171B0;
	Sat, 15 Jun 2024 23:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493173; cv=none; b=XcGfNz+SGCHnblw+mZAO9j+uH2arKvI5dvVUn42AISF0wW58wx7z96rC/7CmVuAt2B2MoiNr5Q3MveHZ9uzbMsv2DEMdz7NcmScG5XIXVJ71AnaCQI6jKsbDxfPCzLfSeLllo8oiHD2ch6wz7zE/rCyl8fhcG6bz7FRfJhDwTVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493173; c=relaxed/simple;
	bh=uJNHCAS/njBj0P1AkFg9onLP6rk8u5HT5DX/4ybEeDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xu4lwJgTSCucoC9reyFbPlMyPBcyof4a6Kg6HLbXqk6PLx/mCM/qvpTTFxSveoN0b1uSX6qemCXYD0Z8Ja7braCw1dvN6jMJCQg/Fr+V4v1AQ2cEdrIbo4kjACVHVfSnmq7QfbzWGTs4fw9OS5pWqkqd9WmN9yB+4QMS54Ta/9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CT4t42wl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f2d723ef0so2865061f8f.1;
        Sat, 15 Jun 2024 16:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493171; x=1719097971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhl9kavocLfzcqvimV+c3enKC1Q7IIpoT3nV0k3W8no=;
        b=CT4t42wld13m6zDkf4mcGTFokkXt6Wb+vFrVxiKmZjf97+/PwepdHZhFO87QUHH8EU
         9nQHnxpD9xVzT2EqMhTBQ6nKG7UYy5WZkRcIMMNZdbf6HXrdIK60HV7ylImdVb3pypWK
         zRm+OTji7S8n3MA2FFFX5iOx0ln3mu8oOHQL6lHuwjkqi0YdZY/Z9eMKhkFuv72FH6Xr
         D4WDOqAUTkNf6eHjm5qH1iZDiewG3yFc/C+RDj1p9EmTXUSVk5cT6e7V08welUW23RIx
         WhPf3Et3LSQDE2YdrcbrLdMJjJ/n087boh8tgWiLmib1O76u0DBuGFv49AQ4as/5Adg3
         HWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493171; x=1719097971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhl9kavocLfzcqvimV+c3enKC1Q7IIpoT3nV0k3W8no=;
        b=E56RPA7vWddC20W4ME2g75HhOWjrcxvpiXJETOloRKSdgy130dUWzTHJU2O22jIgqy
         F12LyXk+8ZQpFtRctws5g67Ji+xWN/jZTX+EUsJcqf4qss0SIn0W0Z9KD6U21gYXN927
         tnH426ICQPDzdU0hl22lTM5h+J1yR3WVMz4e6gWmQ25kIx+xfwOSZJkcJiHi2XnXg1AI
         x3owYwbCBjDdnZTxo/DxFvflbjlLqItejxLNaSBiaZI20gVrBDoPlMS+f5Lo1MEESv6K
         hbeKHUNNjLfu53VdEh+xsS5EBxh9CWDeM4RAMuem3dldSLVegv8G6k93v6m+jnsKgy65
         wBew==
X-Forwarded-Encrypted: i=1; AJvYcCVO0Nfts4LK21yjkdCooVHLEImpvR2+96JQ5Yn2RG5xrShOXYqH2JnltzyGE3ieHjCy1niygonrCcnHU7guDKSFQlzU/M8EyLtd9RoKoYC6Sk8sut7o4FNILirnzviCCh8rRrP60bqzRJy3ZoVvQFUTbK5zleE+huw3MmKhAaAdz0y/wQc=
X-Gm-Message-State: AOJu0Yz9WRr1hhR74B4zaNs3GgNnBDNGyUB4r4Vh7FXWu1Qs3KtV5tz4
	TtezYHLnFqLaoBomUotW7amYAQIKZStUIumWgGRaWioAQCLokAwr
X-Google-Smtp-Source: AGHT+IHhtkIpspuVDjEAU+y6cLXh0UeyxdihKJNNZa6ThcAfR2u265DyiMdC/wlKlkfGl6MM0/BYgQ==
X-Received: by 2002:adf:f584:0:b0:35f:2b1d:433 with SMTP id ffacd0b85a97d-3607a746a11mr4485896f8f.26.1718493170556;
        Sat, 15 Jun 2024 16:12:50 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:12:50 -0700 (PDT)
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
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 01/20] dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
Date: Sun, 16 Jun 2024 01:11:31 +0200
Message-ID: <20240615231152.28201-2-ansuelsmth@gmail.com>
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
2.43.0


