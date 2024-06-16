Return-Path: <linux-leds+bounces-1962-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 467C690A014
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5574B1C21229
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20BA71B47;
	Sun, 16 Jun 2024 21:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wt297Ca1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844D6E613;
	Sun, 16 Jun 2024 21:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574952; cv=none; b=cJoeXJLGy/+eNoszA29RyTygAux3/z56Obh6U9asIxmwv2zKmqf3MOBAPvIAX/YGVjNivP2+gIB/YLL7pXnk41F7O5zfH4buKzrOgVGPjH7BEuzDi0zxmQ+TG2QWP0c4wENf41CH8wRBY2a9ohbJ2zeTfkn/uEZ1xSYMjesRgno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574952; c=relaxed/simple;
	bh=Y77MrkgTPpF9SsM+rM+21V+XO+R9QBEbnKLnh784hwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+90atUNG5PEaW24DZ0me6MTboi9UTd0hOdmoH9xrvUra5D4hbqQg0U42ayXXTOHs7DNot0/zI45dGLfS35N7Et8Z7mqcYcfDHf1UbfmCCTXlgiVHOgkIFlRx5t8fDHoSaBDvFJEBAqYXBW8tBo0ssQlMbZNW+7v+wAwP0sqPDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wt297Ca1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f123bf735so2680171f8f.1;
        Sun, 16 Jun 2024 14:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574949; x=1719179749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icpBlnTDdeuMUSDTs5EH982zOvuXd6X7dmffVumwKI8=;
        b=Wt297Ca1b3EcjUel+RfZrFoVwdAx28rZCFAec+ZJ7jRrkEJUVbPT2ZYBR488ANPANw
         todDySJoQn61Tnpm+ZXfMGtRXUVnHt6qguvPm9Bb0OUbp+mNPFf30ib0CT12yxsM4wqC
         JX+VEoaquHvaN5CpKWWYnMelnZffM6GkdobCZtrX53gjsqhBKLUmLch5hlyyvlOqL0ME
         ZeGuuKCMXw+f7IbkB8ZI44kbieRVYTnp3X4Lmbx/FTnWZOIrK6u/tJplbYBNiEvg4flY
         S8YN+UPJgy4bck3wPDoCmeFJoyX46cLbE8E7N2njLsXQhz+6ua/6VJ8AmoeSxM8gd0ZB
         910A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574949; x=1719179749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icpBlnTDdeuMUSDTs5EH982zOvuXd6X7dmffVumwKI8=;
        b=HPQO4jlX/qhopEm3OwzFn/zpEwN211lvE98AyhJI/UAMn/TpEzIKDgktQJ/3F4Jixf
         sWhutoN8ppY0c6wdEySrwGpTgkw9LKLh8REDNNoCRgBA3YHtMJI9S3mPjvijZZi0nOBg
         OO0kJCxqia12nA7KaGW6LjDrtYO8HxmvmsZ1Q8MGkMuRF1whDGJ3zs1TWyuO8o/qSgpe
         yszfT4+JFczEmAUKiIZ3Jx9mX3CDs/PsJCMA+5m4bKk4sAlwqr5DZtt69JvjkLt3/oIh
         CO/ffuxIEhRWBFQQbLivlo2cW7GyyFcQU5Sx6hr5LHke2+HeOqxlunSuiVZ74SWf+Cqp
         /HOg==
X-Forwarded-Encrypted: i=1; AJvYcCWUgS08Vp2L3N5XEdX+ci9Bv7hbkkft9ugGBAqScK3acRBKDp5U27GdS5j6sunZ6xdNejJpVnBuG3Nk4iJgW7mZGvrpphIDzqvgwfj41CqXrT2Y/fsNwgBj/GDr2uEznk33uk1tl6DwMXg5b8UmSUGv4goMG/ZYjiOXDVbVkvlaHk5pjVo=
X-Gm-Message-State: AOJu0Yz6l6vGGA/Ekn/4ZWlFKhon2SXUStCsldTd4PYJ8Mb+EIQlPZpV
	ag3d+BWz34xSkZKm9I+Zxf8PFe4FTAItZMcbmk0Bz1Fg6A5U7m8AZq57oA==
X-Google-Smtp-Source: AGHT+IHJgmBwiky5lSvxatwNV/9cewou/6GlOJWZH6/sDtaslpWQHn81JRlfEEOiVhikh+Qv3C22IA==
X-Received: by 2002:a5d:6a50:0:b0:35f:306b:4de5 with SMTP id ffacd0b85a97d-3607a7e2244mr6897138f8f.48.1718574949298;
        Sun, 16 Jun 2024 14:55:49 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:55:48 -0700 (PDT)
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
Subject: [PATCH v6 02/20] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
Date: Sun, 16 Jun 2024 23:52:01 +0200
Message-ID: <20240616215226.2112-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616215226.2112-1-ansuelsmth@gmail.com>
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
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


