Return-Path: <linux-leds+bounces-2078-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FD79114DF
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85466285C6B
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CC813C699;
	Thu, 20 Jun 2024 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0Y5gYJo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF584A4E;
	Thu, 20 Jun 2024 21:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919699; cv=none; b=F3RhY6UCtQg3pv2aZBFj64fdjIHKzaSQ+Y9MG/H87C1E9fHy4GL10gTHXb/lGvA+lyWzYg33vW761XdDiNFBukVdCBqjK/+Q/9AV5iM98o4EiG/4w444JNFEMEJv+PNQBCRnRdTj2pTVX5bAWzAU8h89MmTBhxIHhaxXJDk4f0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919699; c=relaxed/simple;
	bh=3eWDuOuAPXIqwQ37BEI/rk2/PA31lRgF9hfGMCW6fwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXfwuglir4x/49alf1OLaVByL4yDWp51LJM4hagrowPPuuAbzaNsUUwtPgmKfxA2Pq5+5lFzHA+X1tVMRQmWXnm0qTrUFmV2c0hQgR2JXPLM3fXADiJS3Z8mbEH1crwlfdGu5HRpl3k0BYnloU2AMEMtjmjex1LORcZ/vhCg478=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0Y5gYJo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-362bc731810so1336428f8f.1;
        Thu, 20 Jun 2024 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919696; x=1719524496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21mSbP0lHQ/HlE9P4YVvtfNI3i5USmGh/e5NZFrr3Ik=;
        b=M0Y5gYJo9Apnc9P5zMYUUpR5IxWg5gumJd/9U5OGgBXGdVA9qsRti95wd57dTP/qYe
         s+pRR6VKG7kEFElO/x7hq9UhKfDAVc8SyZN6b67/n5TQoNzYhAFz6uk/taEJ8XiJxxQE
         ZhY50Er8Js+Qzh8ViH0V5i6K9sBqdfr0GimOikPjLC2rVo9M8+Opi2CWsoggTCuWrjCN
         5t/v6ve8qlSov7tS4Cux34sOsVkLlr9GFg/fTGUcBo3Ts8HMbq1lPUjVL/Z//4MhUn06
         f4PAvMDA3qXvAf9wo8Dg6APWcBWg0laVzpKy2QjrgmGbJh73C/tj3P0ebqxNcNNZ8bBN
         C0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919696; x=1719524496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21mSbP0lHQ/HlE9P4YVvtfNI3i5USmGh/e5NZFrr3Ik=;
        b=UJq47vk36n0l9IhoYUOpFXDmODEpQfYN1NGmTFUlZ9Ida+vssFnAfY+xjgn69ov1ce
         Rpqjz8Iz680ijymJhFi1/WoApwHYSkMbctC2PpQfrKmR+pTSizkv72bbd6JJBI542YjB
         n3U/rbgHtAuNBC0CbZG9MdNQ3ELnQzwzetETkZCluU3mxy8R1VcqwbBsiiksT6s1dfFv
         fkealZpXVGQFCJFmpIApu++6IcBLSnmFfKx348so7Iy082rKsskgXo2Xp8KvLXDAp+/u
         BKm2Twc/8+D4IjZtC9zogLGH1M7RTiXzuNyDevlu6nBURkrA/AsdH9fwXRO5zLH0Q5Yy
         qaVA==
X-Forwarded-Encrypted: i=1; AJvYcCXOM0IdocnH4hdb3BPdYSpbhjwmautMyXfNDSCvF6+8XclI1Zlm6MaeiR6FAMoHh4usJip/vX6nXxYOoWWgwVSJbBHqugA7f2n9XYSDqqsbnwsTr7Aco39ALRvjArPDApXdkPKN5jteq2Py0Hm7s/fHowdIJrwd7Y1MqilImgylIYifhuM=
X-Gm-Message-State: AOJu0YzUKf3fQODgEiGf1TgfPouqsABeEKXFE5jxHwiu1Y+i8Y8Z4/oY
	BBA6oeex36jmmtiOHaKrLXkSD6fUlzoifroNDddcl9tX9FHhgpeo
X-Google-Smtp-Source: AGHT+IEFLIX+wmCXEP2Yfp8YMkEfiHh13M0ZPa6i8iEJE3ko0z+kBvgeh+lwvV5q3eazQaT1PARBRA==
X-Received: by 2002:adf:e909:0:b0:360:9d1a:a8d with SMTP id ffacd0b85a97d-363170ed4a0mr6241422f8f.13.1718919696101;
        Thu, 20 Jun 2024 14:41:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:35 -0700 (PDT)
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
Subject: [PATCH v7 02/20] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
Date: Thu, 20 Jun 2024 23:03:18 +0200
Message-ID: <20240620210401.22053-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620210401.22053-1-ansuelsmth@gmail.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
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
2.45.1


