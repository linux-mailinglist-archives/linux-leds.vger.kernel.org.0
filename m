Return-Path: <linux-leds+bounces-5633-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D6BB36FB
	for <lists+linux-leds@lfdr.de>; Thu, 02 Oct 2025 11:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6028616B7CD
	for <lists+linux-leds@lfdr.de>; Thu,  2 Oct 2025 09:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4EE2F4A10;
	Thu,  2 Oct 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="Fg2B2T5M"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72BA3009FC
	for <linux-leds@vger.kernel.org>; Thu,  2 Oct 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396825; cv=none; b=h/En0Q4h3xBskpX140H1MQiGXIHmEplwtCkMoYX9Cu1Znctcf4XmDqHJO+a2jOnuU/E6sVYm7VLT94AB0gI6f2H8UDXHfD4X3NJTeahIYIEnYSQYaXXtSd7CI4sXVerdiRxXOjoaZ+nhp+Nxg/+lR9fddoqLy+LgCx4YefyI+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396825; c=relaxed/simple;
	bh=gIPaH2DDPr2930UcEfosjH7vdWnt++jHkhnT6tAzaRM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qk9W6f0sZipYWJ8InuK+oI+/0dcOigPoCGh7seOZWX+kVC4McM2xG7n5Y7xredKjjg0XIhx9uLVmNTw6HScqUkpw4U5YcaAuLlkGeUU0OnijEISSm2/hWQd5eF5tDCZuSyZC6GNSRrNo+stulSArc557XovfwLS721Czpov/bOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=Fg2B2T5M; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e29d65728so4963345e9.3
        for <linux-leds@vger.kernel.org>; Thu, 02 Oct 2025 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1759396821; x=1760001621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bj9Abm1mWzloyTs0H8611oSscu6f+O7YderAfm+LnKM=;
        b=Fg2B2T5MZnxn9HGySGlsq6qpSH8PPiS4NSlFDlRk+cOl8C9f35ilpGzPaocLm6f32t
         j+UE2t41P1X4aMmEQHF/+IG/ubgtfeDMYYikzHCJb/usjiBMk0FxYz/GuQKCYl6zcVGZ
         cRWxJMyEiIqBkQmRVBrKAhIi1vbavO3CFhOxd4ejHLgxBYHRPnET51KAxPlHvf81SLd1
         /7+I7QEC6vBQkuHMnsvVig4sFS7kP7yOV8WNTxnrFbw9RurDofoSR6Z06rJxfbAFt/6y
         frx6mLLKiTyKaau0qHTa2nUKsMaA3NQe7dU+rXcTWN5hdvCASZxfP5QrmTaBQNouV7la
         yoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396821; x=1760001621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bj9Abm1mWzloyTs0H8611oSscu6f+O7YderAfm+LnKM=;
        b=nWtRV5sm9lIHsnM7B8okKzKy/xnzyhmwxp2edJVmwiAvEE97SeqBJR/nHYABYfMyjd
         N+jKF5DZJ+77VgfasHzaXBXKSHCt00XWQqcLh+26aI5MQOO9rcMlpB4EbFQ6qP+lO6tQ
         IOsk8i2DyriBQWOvgmixSampP4VhdwEKSgAeAz/VbzQMS7hydFCfMROoxyk0ISTTnaZb
         7Zy/KaeJsjrhxzAvDTE1Lb6Q4j2RWBl7B2E5JiadDgH59QinUmJKmHO3f1vUtI2TcKol
         MHpY+m1YFE6AINJO9Ad1KU5SZEXFWfg0D06yRQVFXIwjouUgWUTEDesvWzRoMePFA9sX
         umpw==
X-Gm-Message-State: AOJu0Ywz86Vpxuh8KcfvyQGMhy6hAEvBFHRRJbNUhb3XP9wtSaE2tkvR
	Q4OMqDc6PBNTvtHf/E0XFp8KNAoRo9U0c7tkaXWDHpbNmDDxxRuRmbkVwSQTw727nr0=
X-Gm-Gg: ASbGncvwjCjVG2S5z1QTC6gAbKcetHHgg9v3sMtv5xda0ufaPgh9lYb7j6dhU5iu6ji
	QHXhTGYTDg7mCCbbo1I7SMdtx6XQ+JqagaVmt5/pKmT58WsBkaAGP3RvksVu2i0JDDy2mYW5fQB
	HMx2uybnrx7RITQtQJvU0WN8VohsDkaris5EDLynmI4//HZuJC6HodtUIIcc2ALSQB1SBW6rYIm
	psrIjB0V2vwnmre46GyXxiHZFwl9cq062ik+O76q2Ir5BMWJmemkVddKbL2wUfqOfbitg+gd9jC
	GFxBTASmNQLo26+STOQQM/umoA4ibZKd0+o9xWuOuJPuu0lk9yZiMtjvgVzYi6mg9fzM6ddXASt
	T8trier9eIIE/Sk5HnSUQ4xGPRzh64sxGBQfpqTPkT3z7SaWVCElACZhCiut3
X-Google-Smtp-Source: AGHT+IEscjxe8qX8+wcxvs4YKWYqZeRUzUgazCwsVmzKHp1vbho1fwFonw8ocJOeBXrMnKFrCWJp7A==
X-Received: by 2002:a05:600c:83ca:b0:46e:4912:d02a with SMTP id 5b1f17b1804b1-46e612c0f3fmr45077015e9.23.1759396821032;
        Thu, 02 Oct 2025 02:20:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:8a3e:8c00:3430:5fdd:d596:adae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6918bdebsm28958795e9.9.2025.10.02.02.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:20:20 -0700 (PDT)
From: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Subject: [PATCH 0/2] dt-bindings: leds: Convert to DT Schema
Date: Thu, 02 Oct 2025 10:20:14 +0100
Message-Id: <20251002-ti-leds-to-dt-v1-0-1604ae333479@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM5D3mgC/x3MMQqAMAxA0auUzAY06KBXEQfbpBoQK20RQXp3i
 +Mb/n8hSVRJMJkXotyaNJwVXWPA7eu5CSpXA7U0tCP1mBUP4YQ5IGcU69j6wbMngtpcUbw+/29
 eSvkAJCic+F8AAAA=
X-Change-ID: 20250924-ti-leds-to-dt-ebcdbf5fdf22
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Harrison Carter <hcarter@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759396820; l=811;
 i=hcarter@thegoodpenguin.co.uk; s=20250904; h=from:subject:message-id;
 bh=gIPaH2DDPr2930UcEfosjH7vdWnt++jHkhnT6tAzaRM=;
 b=ijRptHzk3y8rIOFHY6uJGzszf1BVhbFIbDN3kLyr/S1OCA+3wibHk6MVQCqJTjLkvxTZniekk
 hJHWDxX2nQBD82A4cW7wohwAtPIlHlPFn5wjz5JSsoxTaZljuSYBiaj
X-Developer-Key: i=hcarter@thegoodpenguin.co.uk; a=ed25519;
 pk=xn5ghTMMWQniDtZih4xwKCTAaBHDozflTmqNKtaKo6s=

This patch series aims to update TI's lm3532, and lm3601x to DT 
Schema.

Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
---
Harrison Carter (2):
      dt-bindings: leds: ti,lm3532: Convert to DT Schema
      dt-bindings: leds: ti,lm3601x: Convert to DT Schema

 .../devicetree/bindings/leds/leds-lm3532.txt       | 105 -------------
 .../devicetree/bindings/leds/leds-lm3601x.txt      |  51 ------
 .../devicetree/bindings/leds/ti,lm3532.yaml        | 172 +++++++++++++++++++++
 .../devicetree/bindings/leds/ti,lm3601x.yaml       | 100 ++++++++++++
 4 files changed, 272 insertions(+), 156 deletions(-)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250924-ti-leds-to-dt-ebcdbf5fdf22

Best regards,
-- 
Harrison Carter <hcarter@thegoodpenguin.co.uk>


