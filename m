Return-Path: <linux-leds+bounces-4890-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049CCAEB0D4
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 10:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE52A3AF705
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 08:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB172309B9;
	Fri, 27 Jun 2025 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjDK3oic"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2FB22B8D9
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011322; cv=none; b=o88SLfLfwccGyzUnyLVT+GBGiONWEf4tab720oDjtUEt+2loiHEfYuPrHPHe/l5vPRNgdB7JH9M3NIlVDS9xNlJiCsDKAjRaE2ZOcRQGUuV3WLW8tELbKrZWyMrmss7gngj6/EN4PDshWBH9n4kb0vqKRsxWGZA2687Oh/9UFIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011322; c=relaxed/simple;
	bh=Iy4rMuXXapFTx2kjSKugMlp9I0/iVWn0dY70WllqPHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AKvtSDGLi49qYoekYgFoumNpIIxs98UmntZgHPKEQXJsvvidxqduW+ChzQlKBMc/g+lgvrqCUqaZqdXZaomkxiL1PEck61ZwAYIEha4stvz+tnj6F6oJYAnOiJhmCl0zogsxpvTu6qSaaOM6Nd0Bq7+wuaRqhaUlyfI5OpnUsaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjDK3oic; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso2592695e9.0
        for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011319; x=1751616119; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Unci+r7LHL+lqoLwxDlrvWa0BMlTjBqi0rK62HQ+/+s=;
        b=vjDK3oicVRxMSSm/0nkh2KE5W+QTSiZNBCDDCbPIxhdbWKH/sBnCb0gWFB0qXWmIPG
         YF9ACXlb0bjUw18Zh1PEn9zPWkdeLFKyVxQ3FkBVyj+5eb/JGm/uyxVoXfA/NgtIRaH8
         MAYayGv6FLq1Ei7PK+N8GV20JtSBMwH21g/j2nLWodrxV5Zs8UwKIq4UeLjdZxqi7yRm
         URXMBuqiBwnUA7A7+BOlbxyGeLg5fSURYZXriuBL5ajsBsiDr9vHdOt20h01pw7ozwwg
         pW6k4+l3iD5gLij5ffmh255r9v5ExcBLhEn+SQD6PbGkEISbh+/bRAW6iFTa37jcAZN9
         SNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011319; x=1751616119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Unci+r7LHL+lqoLwxDlrvWa0BMlTjBqi0rK62HQ+/+s=;
        b=XbQBoBz4lq8qPjsa8r10LUAF/ZknokutzABl6AW2BwBMFDHL8wk6PhderUOogNgqih
         AJyVZ+klvu1eSwKzgz6TSAf4mnyqpV9Sw+UONV5t4Zs0dbCAW/RouPb/VvNLGL8U0FQm
         3Ew0DyPOamrZN21ZK4jPXdlbsZjrzlt+0tgs6CigVjPdWSlN6I76i3tX1bYphV0Ss1Ue
         JBqYSOCmTWtnNW7yQf8LI/gC5v1jcOZEunyok5+ngKMSHJiF9Zq/fsu1DXtUQ9g6E8AN
         0aMIUnmnjTwTWmoSb1GsnD2SA3j1lh2YWzsfvopDrIe4Zecy2Y+dJNzrfKTDFxhz6EX6
         No/Q==
X-Gm-Message-State: AOJu0YwaYKze2GADCxGR1Krw2wgUbn3akkpeI3/XBN3HL3aR7fmVoxf2
	hvdfUZegtaFzYH4kOorOZI3qtuVLq6RwoepwqIizN8u+viVMkEpRAeUFlKuMN9eFVyc=
X-Gm-Gg: ASbGncukTA6KoLDpnWowY5wZ9n/EAaFRuW8O2+s027lSyUUtMIVFhI1Ck29J150zaZk
	L6ln/A9+SZwTT1axyXCBJJ6pZk5zuOXo+wMw/1CvGnJ1yRNNHpzxdgh2WUpnyo7OkWbQwDsCT4R
	8jTkKl/Sw8ecCdXLbkFxYCzSZyOIR9hCu/NXuvH8AEhunBSSnmJ/ZueQ9sXs5/B0WQudFy8fSH4
	/lehY7Srg22IvcdnO0AaqHOZMMKcdMrxIGw43yA21Ravxac3ZOC+ps9s+1ZQ/SVlJmYybj4YL0+
	UBh8k5s92us6khv7X2V4l4IIAaDbqbIgN/M+lRFP87kWq+yUZOin/oM59x2b+/DaoyILCQzyNJs
	t
X-Google-Smtp-Source: AGHT+IHcfWFGNWC16F+T/5JDKvwd7eGwjNT+A6IGrz+imkl5/bKkRK92RXClDJ3nlxfVmYvbeGIitg==
X-Received: by 2002:a05:600c:a08b:b0:450:d5ed:3c20 with SMTP id 5b1f17b1804b1-4538ee7446fmr8751165e9.6.1751011319205;
        Fri, 27 Jun 2025 01:01:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:01:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] dt-bindings: Drop 'db' suffix duplicating dtschema
Date: Fri, 27 Jun 2025 10:01:50 +0200
Message-Id: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5PXmgC/x3MPQqAMAxA4atIZgOx4g9eRRzaJmqWKq2IIL27x
 fEb3nshSVRJMFUvRLk16REKmroCv9uwCSoXgyHTUW8G5AudBtawJWSH7SjWEnXeM0GJziirPv9
 wXnL+ABL1hPNgAAAA
X-Change-ID: 20250627-dt-bindings-db-38eaa005ccd0
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Iy4rMuXXapFTx2kjSKugMlp9I0/iVWn0dY70WllqPHU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/wcCM14kQDF1d79XXpGo8n5HZzTk1uWzDKp
 WTG1g2l4lSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P8AAKCRDBN2bmhouD
 1ygSD/9zKEcjWzeAnre3VyS4sy8f/zuzk+6aiVwKfnQZNwMLddjHQaA4tfav4oTxeiUDcSNL+Wn
 OMw5i3B3nkWhbJbCvXb1c9IIs4qgDoSs4y/ZINqcWYZi7JuadQq3iAmvUQIDpctu9n4oDo2fPb1
 QldagXo4+4ICRKcYtBlC27JKFS5/Nyjk3RFHS0wii8DA+I6f3rN5Cia7d4KGVjP8sfI+lGSdpD6
 d2P/A+kT4bQA6Py7S8kPKt7QgqQbpRb8wi0+PE/J1TRQwyyfepG7WAZ3nxOzKvwcpRMnazhaCKz
 H5ADmhne9Co11Z0QG1QDO/GE5zh6jm0EmHfAOCBFNb8jEJWvsm8/eQkWq12GVPBeqitfEvycGBV
 0PVlCuEeM04wH5rKeXKYYILSX/G3EtUFBmg5cK5HRgvYb/O+H0o9PBz9UBf30NeqT96QQFl4PNQ
 lXTA2aPpeneel0hmnCgE/y2BRa2WQyIuz2VRRJQnPd0llunwXN+DfXjYoPs0nhIGTDX8so3mII1
 QAMHU+cu9+B05r4P9F06eEAGIqitbczfPPpIZ0ZL2F5PeLCAX/U4Qw+nnRfdMxbFX1oB1/xG4wm
 igtpvpkYIau9eiYialHk0wxplMxEBmIMR8/2wEhyEOmomVGoEaWwZLJixnDMgYzXoLLVSsGCSYv
 MF+OFeWgcqtydng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

RFC because this depends on dtschema changes and should be accepted
after new dtschema is released with this merged:
https://github.com/devicetree-org/dt-schema/pull/166

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix duplicating dtschema
      dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema

 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml   | 1 -
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 2 files changed, 2 deletions(-)
---
base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
change-id: 20250627-dt-bindings-db-38eaa005ccd0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


