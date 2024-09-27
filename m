Return-Path: <linux-leds+bounces-2861-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 385DD988BDC
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 23:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6373B21747
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 21:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99295183063;
	Fri, 27 Sep 2024 21:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHt3JNeV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03466158550;
	Fri, 27 Sep 2024 21:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473100; cv=none; b=WzYOzaKyhSPFgSw3a9WoBsuEkzHtGNJRZI24H+7IGX9zen/EuDHDb4EMHG0X7P8ZLDgqnw7Q08yi3lVxkZfYaz2DoPusw0QChG7vonCcRCFVkL+TZANxz5DH442Zr1zTb+YVBr2DX2AmKDO0yO9PWkm0ipBrS/mYrAcec+hxztk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473100; c=relaxed/simple;
	bh=QmmOOk4TnVKdlYxFndbIWBuXKXkmwWqKpukhrGkEJYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C3rcHwfLZ9jOdqjlAm04Z+8XGZqB3eN2bkgMuvrnxmNIJ5PZM4UJHJqpll7O5M1nDHJADmwz7nuCGjqrhaszT88ZH4jABEDU0zuYU2OCGDNHptaXeruJzum0qAhCQpXt/v5dwU6zU9Ik0ftzetqJD7MYQBfNQUIk0YM+SMBXUQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHt3JNeV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a93a1cda54dso339993866b.2;
        Fri, 27 Sep 2024 14:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727473097; x=1728077897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cS+YBfEhozJBUx9NibAYsJlEghouAx/BLXF7tSWQFmk=;
        b=iHt3JNeVpjadwNEyjhzypi6ylitsSai6TTeqNtSq5aIYtfd1oK72pCFq0axYTxynxW
         r0aGjvdU3MI3FOmJtbrBjLT64g0ULRAgOO3DtX0WVB1RVKXIaIbJXe8Quy3toOo9iXgf
         l60tc13YQCD0/Tp10rqvfLo/NTYQpj3xX5uBsD8YyLMosA53XRbepFZyfFDQbm+4SwoZ
         zejr9u6aDJTIEa2aNo+Fpu0PXyqNzmsUJFv3DV6kWvk9n0ej5H9H1bLta0esfv4hTBqj
         qrFUNkHWoAp27q8qMWHkmciCf4UsDG9PSYxn8Mm++7ofOUZAUYkJeCmiojwtCFhr1AYg
         kAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727473097; x=1728077897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cS+YBfEhozJBUx9NibAYsJlEghouAx/BLXF7tSWQFmk=;
        b=USY26as0jRZU31yC9KMqtkTLXXtvKmb/3eXrho8MtID8evW4DjBDBjG8QsPpMuZlSl
         8V0hH0f964MfgxAHQXWhZ92AL1V+tYBh2fld4UciBwOtYJ6AW9FUpIxO7uae34m4w7E9
         cYfYWndGkpmz9Nf8LYaSeKnOZt8YoxOzIGGKgqaWV0sfGPn0zIfYFZQ0phHChVQH3sEX
         qVCDbVEVS0aiYii1qWxkGyQF0zxGuOAFLNpps7ASQoLGMEAlFcm8sufRPxeB8tAdKN+y
         BRy2xxRwoycV04qubRSDyU4fpqOkhEW6wgI2H3nRt5H9OjRnClV89lqOrebv6Bskuug8
         hgZg==
X-Forwarded-Encrypted: i=1; AJvYcCXjqxPtOJUj2PZhf3GxnNwk4L3LlOM6qB0NNExUJTfyx6SUoeRiAmzSgOi4mE0/iRXAAaKYjK5ekJ5EQ/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rcdghK1LYtasJy1u+PDk9r+RYcGCrdcGfANkmDY7LS71IcUg
	AP0L0sx2GPMLIMmXYQeOmxof7zTyJ2fC/k674VJqdHdie8W6q9oj
X-Google-Smtp-Source: AGHT+IHfZ5L7htef831RfbTy5gKBHnkCvffO1/C+lsEn1O9GMXr+kLi4I3oX4TvQzbUwlPmbHqA+kQ==
X-Received: by 2002:a17:906:4fc8:b0:a8d:3338:a492 with SMTP id a640c23a62f3a-a93c48f1d78mr346223666b.7.1727473097252;
        Fri, 27 Sep 2024 14:38:17 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6e73-3ff7-9936-9d4d.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6e73:3ff7:9936:9d4d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2978a04sm179174366b.144.2024.09.27.14.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 14:38:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 23:37:40 +0200
Subject: [PATCH 1/6] leds: flash: Remove unused local leds.h
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_unused_leds_h-v1-1-46fbf41ed4ae@gmail.com>
References: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
In-Reply-To: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727473094; l=643;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=QmmOOk4TnVKdlYxFndbIWBuXKXkmwWqKpukhrGkEJYM=;
 b=y1q9SUnBBr/e/BqQyCpi4fv2rSF5rd/Y7PbYQgpaNBFRZK0grfqKf4A5zr8aHZVfC7w6W9ZuE
 5A07MmO9gIQDDRC9BD+YZY6ZI8nQ3NmcjkuhM+UImB2Q4oUhkWIYCai
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This driver does not require any element from the local leds.h. Drop
unused header.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/led-class-flash.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 6fe9d700dfef..f4e26ce84862 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -12,7 +12,6 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include "leds.h"
 
 #define has_flash_op(fled_cdev, op)				\
 	(fled_cdev && fled_cdev->ops->op)

-- 
2.43.0


