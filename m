Return-Path: <linux-leds+bounces-2129-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E2918677
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F1A6283448
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2B618EFEB;
	Wed, 26 Jun 2024 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU97Ia+s"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2167518E76B;
	Wed, 26 Jun 2024 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417635; cv=none; b=aon1/W4b7NQN/TU/v4CB+GVe62FEy4Vz9qaemhmQtyFatqGlZs6PMpsjBB2dv6EK1+1MpuQaLLkpupCPwLzqz6FmPxS969tYR7rOGl4yaD6KsKDT8JqN2OWsiwGANqGFDEhiu2lfOL54FlEj4vyp7TpMtUyT4cESWN5EDAHralE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417635; c=relaxed/simple;
	bh=3eWDuOuAPXIqwQ37BEI/rk2/PA31lRgF9hfGMCW6fwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcosf5DfQaoaHIXksqkhr4n3Sz2CVx00kvF5plgV+mTOG2M/sv6DUE1S0zV7wzWK/9HII2ooixWeEj85pCIZE8ibJONE1NHZis1+ceDjy9fbxzPGBdRBm1ptBcxT8uH2afOmURy3K+1lJyvoesFUs8/KLeNIz5XJ5HEamw7LAi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU97Ia+s; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-364cdfdaf91so4912206f8f.1;
        Wed, 26 Jun 2024 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417632; x=1720022432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21mSbP0lHQ/HlE9P4YVvtfNI3i5USmGh/e5NZFrr3Ik=;
        b=JU97Ia+sMhQzLEX0PutsYHHoHpdFMbN0HpZWNGjphw5/b4oTLTEeehlnXlIt5KXHcD
         mZY3hFPvqvOQrQb0LzruoyxNoOzyVoN8eEa/QwpGaJ0mhohVgbOz90RWExvJ742SClmC
         su2JetZpuSqCA11XAwYEkcflzO+VisjC44CwagDHvS+qfdRTVLN1Kk5PK08cjzB3uaDX
         0HbDaBvoYBxT2+JDUrnmyH2XXJWC8CWWAOyoN39on5jpJFJ9e796VtpzU5PXLf0WC1oe
         Nu61j+y86FEbA6TjZ84WsDOBQXNJ9xRLiCmmTWnqZg/sJFR7ow4NbHpHwe1y/igzgq+B
         xJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417632; x=1720022432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21mSbP0lHQ/HlE9P4YVvtfNI3i5USmGh/e5NZFrr3Ik=;
        b=uDcUkpNu7H1M2dW631nnGsPDH5hLvU/jfcg6aQst68PDNXrt8TuYMfmtAoyJEoju+d
         I+DaRe9VRnt9Hs8FNsHftVfJsUV29T8EBVVBFTIHWwLQSeOmF8ZfULaKCZsEjf/eRaXI
         Jbit0RFKlUmJK+EWWRN5kjKJNbJ2aKF7mxY62tbmuUMOQ9tV5wKIJqMlVX8cmtzHA042
         GhnobTVWnKNJikzQ5ZABx8tkLWPBuopIedbeGOqdr3+R24XbWBkugXxJiB94EkW8vu5+
         eZmqNVEzLjQS9zzMEmYDBCLC3IajKpgo71igGx8I4OYwSFhi7J5m44ZVy4S+QE/pgUBY
         w9xw==
X-Forwarded-Encrypted: i=1; AJvYcCWLkI2qiFYfieLbSPN5z2dnvfGTVgtG320nlI7WmiFix3Smpe5F7icY64sT8MhsWm/Dd78gYt7unu6QLIYgLg9LuMelHmUdQKK0BoXVDZ/+JBgzcJ4iF89Gozw50VM38Z/4jM1sOWybnxwHHpvkQiVt3xT6cNvk7vWLudB4rdL5FG1nHd8=
X-Gm-Message-State: AOJu0YwP+T6oDzRX17wXRwpWtyjZBtfd58+epaUhMw660+4EoPZpo5lh
	Sgu1dC0HdsvSz9b70Bw77NXvKkRb18VKF8HWmPZadNbgJi/QJyq3
X-Google-Smtp-Source: AGHT+IEi/HC/Gcbgnm7qZ5IcLEADLlJGkC5ORIvQ5w/NtsPI7RwE/FOYBlwgYxGhHFkfWP5xS+HUOA==
X-Received: by 2002:adf:e8c5:0:b0:362:ea80:db1d with SMTP id ffacd0b85a97d-366e94d91aamr6331604f8f.6.1719417632440;
        Wed, 26 Jun 2024 09:00:32 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 02/20] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
Date: Wed, 26 Jun 2024 18:00:07 +0200
Message-ID: <20240626160027.19703-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240626160027.19703-1-ansuelsmth@gmail.com>
References: <20240626160027.19703-1-ansuelsmth@gmail.com>
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


