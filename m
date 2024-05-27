Return-Path: <linux-leds+bounces-1702-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7A8CFD6D
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 11:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3B931F21784
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 09:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D957613AA2A;
	Mon, 27 May 2024 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnY9kmhG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A513A877;
	Mon, 27 May 2024 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803269; cv=none; b=FeRsR/1wRR7zBH37OZdVOjoJGdngW+y6eofxb0x+j8FS8kZg7T9HT0n3zFmzcmDdwXOPjn84DLF5LZCv5TzAr8Luq8G7GsJC1z+kFHGG688X+ivcTeigXGN2gLGR8LkEbweZWiH3ZWG9d5AKVk/4UZjU9rxG/UIgDEJyJtpqOC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803269; c=relaxed/simple;
	bh=q+6Nqyo4BNt15ebT1gR2MZoORrJ4UpH7ffdU5R37H8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HuBKzXbrXypYVKYDn/XWH1Hlo4O6nesazxRTQ5uD+SQfAIrWwRPoplwVCd8GTWaUbK/ilNzDFofRNomFd0A+2stYILc8Ws5wioSn2JFxhgl1TnHZVJY/BKBbEgmYWSXdNptAn3Vo2TEtnyR/q66x+Sine41RCqtPSuQS5dC9j1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnY9kmhG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421087b6f3fso25219095e9.1;
        Mon, 27 May 2024 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716803266; x=1717408066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVCRrFEDlt5D5IQATQSVdDEgZ6yqgS1rgEvfjd1m+xg=;
        b=RnY9kmhG4t043ESCTAo4eMvahYARZPYG6Z6w1RB/fj57gkbrTGDDloF7qtaQ4u3ps6
         NOEf2xMQ48JPUiy/t1zumAhPvEaDle/PRbblF0w47RLPut1KlD8UPQrRGZHwiEUzoa4R
         FrjAKZ8BKW3yGjZIfKz8RmSEEZuK18hY404mGmwhdlcNiLomgCE3pRNEhNE5LzlHS3Aw
         oZJz8MTNY/4g/YG8P9v8Hw4KypmLhGkzEp062zEP0Ege/+CVbWkFxQPwpyrHHyMmAKoE
         SifXM7KLBlsWw0uHi4mePivbmJbRTlqeHcOBDflhx6f4FteBQ7w3d8wXpvi8vxPazjvj
         z8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803266; x=1717408066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVCRrFEDlt5D5IQATQSVdDEgZ6yqgS1rgEvfjd1m+xg=;
        b=GhGUFv0xPeaZdRL/EM1/GcIaz1WUR9MpmjL8nnAMajvdmibHW0H/RJWhRcBDBaii4h
         wQeok+WxNxZROTBuepjKMFe4AmM+zBkER6VPEODIFstw93JZlwfY/z134e/uRNfkHY7y
         kIurULG11IOF9Q0uQ8uJaXwOoGLkwMuGafhrOKKIP5JbnK7lsW4sPTfvY02uUlk5qOnh
         ixVWGB/2Ll9/XBU0oFIkwsVNDskNwjrootXIQYLCteqrIIr+AeDfjgGih2Hx3UX5mxBX
         vQIZubXxW2UIssucZe2dYip4FYMhaJ3CcKRSww8MPjLcc1zEYVvdA+/VQ2U7sOtDB2sV
         vaww==
X-Forwarded-Encrypted: i=1; AJvYcCXNnT/V19eXZRp9Apr6uDIptHcQ4m9p3tUQWQb6iujHflnZrRwAMEYPJKPM3H2/PYasFh5dAeaYIHyQfh17SWgT3fwI7M/LXCyxE/K3GOeJBq+Pklhyd0mteRNEBYZaQG03Py6fQCxOoANqdhMKfaxMgb1fVSSP9Z9XgmHQDK14Lgqyg/0=
X-Gm-Message-State: AOJu0Yx+Somu4Xe4BRrJosX+7xYzicLdOu+5Yzq/xvQ9TtU3fDExlyTo
	kJEL7QQUi0waQ3TWnspVSChgp/Dh9W4IFcVPf2pH8qoDxoAg4o4K
X-Google-Smtp-Source: AGHT+IHixWIidKXRsgAxXwQkL6O+QNpCyBf7pIfTB5ClFGOzrXLkQOhYhX6Zq4aP7iLQu7VTmT7LQg==
X-Received: by 2002:a05:600c:4f88:b0:41c:97e:2100 with SMTP id 5b1f17b1804b1-421089d3accmr72472455e9.3.1716803266323;
        Mon, 27 May 2024 02:47:46 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-420fd37c1d2sm156356915e9.1.2024.05.27.02.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:47:45 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
Date: Mon, 27 May 2024 11:47:33 +0200
Message-ID: <20240527094737.13354-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527094737.13354-1-ansuelsmth@gmail.com>
References: <20240527094737.13354-1-ansuelsmth@gmail.com>
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
v2:
- Add ACK tag

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


