Return-Path: <linux-leds+bounces-1683-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC458C9147
	for <lists+linux-leds@lfdr.de>; Sat, 18 May 2024 15:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88D201F21FA2
	for <lists+linux-leds@lfdr.de>; Sat, 18 May 2024 13:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A19C3D978;
	Sat, 18 May 2024 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5vkhzQa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B803AC36;
	Sat, 18 May 2024 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716037196; cv=none; b=S+tF0z0HG83AectYHfae/wcSPuIO3hJS6engosxALTszjWWoCq+c4iH8OF0WfIF5C91sFLZoxwTVvZPX5efOFwf12nqFX2fk0QoQW4JJ+r8l6xCO88hqORsN636FqzX9h7LCEIDqvYjS6sBMEmRtuYuavdVP3Ot+lBg7taX56ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716037196; c=relaxed/simple;
	bh=q+6Nqyo4BNt15ebT1gR2MZoORrJ4UpH7ffdU5R37H8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1/a1XJS1b86FJK5/par1qbS3/ycdsbiR4eYRZJ0TqKy39jDrQRXIX3lPj8BKEw0XTDSJdFI1QV1LBhTZxDnDIKvaQzsSdl09CRtJF3/rTXIWHbgXkZZJjHsQmgD5+Kgj3HRHOy3eNHpIErljNXWBMJ8JIsfNuEFTKXl+ycMrs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5vkhzQa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a5a5cce2ce6so513574466b.3;
        Sat, 18 May 2024 05:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716037193; x=1716641993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVCRrFEDlt5D5IQATQSVdDEgZ6yqgS1rgEvfjd1m+xg=;
        b=d5vkhzQacqPduhmUAfpz3n3rZQdhc6oA0njSsfdajcO9V9A9c0VY0s3gJ1oRdTJ7Tp
         j3D/S6AnYFTgZg/pfejkXa5q2RLNjUgZHj5I+8WaVAHN5zczgWLv/sJccw6zKzeeN4sD
         LXYj3akqWS7mZbRbQj/s+n/+qkeSTwXkwcW2E4dfDn08jLtsdFKNYi4oke71lYzfNSdy
         3nm9rTZN9w3cfzM9hOvgo8v4KW7j3xv9g0/G/+zWuoIVEiNV4d9ilQ77vGbJOKbDKmMD
         lpfCTgx53ktPYzVi3xF7UiCT7Jbmp1pIiIcG4SczStBScok0xCd3w+qDFt62k8SXmeQ5
         9IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716037193; x=1716641993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVCRrFEDlt5D5IQATQSVdDEgZ6yqgS1rgEvfjd1m+xg=;
        b=SVeZL0JN29KqaUTKJLyqBa/eoxuVOE1yKF2/v8oX5iaJozfUI+t1eFKjV/PAHHMdM9
         fo2WM9TopZyyHhoNAG9+dm+hU48mzvdxRDxtftHhqSqlRfKVIMXEahKz+ta1UonRSFWa
         jgaa7YptreRNjC8NpsiHCBwPFLqSnK78g1SbX+h/lDZpaGHzj8JU6hOpYOe4cbzit0va
         Bq4Vx4AB1K5FtiZE1mdy3PmH+Sf/6X1DuRimCUL5OWthG+5L7Iv4s9Rn0+li+mAfL3Ze
         UoJH2pVsxyfZ/T/STqcDCD/kdh+X6xuzuVEiKXKWps2XrrbJ8eDj+ZNDoH6dy+u1uzHK
         huTw==
X-Forwarded-Encrypted: i=1; AJvYcCVPHFUrdPE1WsR8VuUCFj1szAgIYSra+7KfGrriAoL7NwrN6wsIvOD+NBi6+ji7q9KrKgofKzyUsdlVFe+9x7Mi19dDojPXnUmjzFTpr+h9CwJFdz94C5MmhxLUV7VSMqJ/8dniDW5Qooylk/KoFbXXzIYQpc91Z2HlGg1jKe36x9oIXFQ=
X-Gm-Message-State: AOJu0YwZLfr9tMTp+6Yg/KGvynwFrPH3GbXYrXN5Xe+PyY3SGDfEoW/b
	9BvkgrTFtVUeUyiMN1mflM3VUvaBzw2NH0us7d49o/ZmUi64sTmJ
X-Google-Smtp-Source: AGHT+IH8gkzv3joL3rQ4PgN0JUBrAMN1U+iETJJ++e34Vuhx95U2Rg+EWFFnPOQey0Oy1b2zP4v6jQ==
X-Received: by 2002:a17:906:2408:b0:a59:c9ce:338a with SMTP id a640c23a62f3a-a5a2d54c473mr1541708966b.2.1716037192947;
        Sat, 18 May 2024 05:59:52 -0700 (PDT)
Received: from localhost.localdomain ([93.182.74.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a5cdc712ae2sm391499366b.19.2024.05.18.05.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 05:59:52 -0700 (PDT)
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
Subject: [PATCH v2 2/3] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
Date: Sat, 18 May 2024 14:59:12 +0200
Message-ID: <20240518125914.2938-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240518125914.2938-1-ansuelsmth@gmail.com>
References: <20240518125914.2938-1-ansuelsmth@gmail.com>
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


