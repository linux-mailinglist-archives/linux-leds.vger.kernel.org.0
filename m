Return-Path: <linux-leds+bounces-2862-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DAD988BDE
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 23:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D655D1C214C8
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 21:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1719918A943;
	Fri, 27 Sep 2024 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLMDYsIL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9D117E01D;
	Fri, 27 Sep 2024 21:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473102; cv=none; b=ghi9iKKWtQPbPzGJwyIQD5aZH8FAEbvfzCAm3FUMNXhXg41h9/htp7LC4DcXRdyRwGc+IeizlIgEF1Ky/us31n5gqe15/Jfum5nKNaIp1JOq6fLoFUGyHNLqhOpXT7oE77RomusVw8ZVBGDkHqJU+teoI2P2b09865P/GofwOPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473102; c=relaxed/simple;
	bh=crgeMaJGRYnJUsSv1C+r4CDEushVzHzji9FATg0Rl3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1+O0fUfZk6irfSW8xCjnaIvMzycCi9fM92k8pHtRdEfUgM8QN5tRX067+892irhxy+MgESk7D7JM1wpmaB3iBJ4SK2RpxAc4i8AAe5eFi0kivwF7A7eDmN+XM9AOahWGwd9bgrqYY8F0X//YVBpYB6N8wp3V8gD9G0e8suXap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLMDYsIL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so361872366b.0;
        Fri, 27 Sep 2024 14:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727473099; x=1728077899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JAczy5NWiAaSvBOAbeEafwBf4rdAnSDRW5XFj8JZ0g=;
        b=fLMDYsILqL4T0AcTj8KiZjZSBifCdTakzp8hgVNYoXMA+nl4/aXca4u0SG6BTrmNQ1
         /Og4+SL3S6/8sxwSlZA27piteXpnIyR+FJlV1dysJFLJljLslQjXrr5mhzMnGVg2jGPK
         ZstQUezWlsxgWGbJvlPa0zBOXQYJ2m9AFky5ColJ2cjFXw+BP+3OUiqBiSSSY5fL7DmI
         9MX3Jj3cuO5l1ZCHYjN0P+fBGuUVxMsOcz6A1dm7ia7z9hUQO0MSgbg/I4auo3cz0kUb
         oB3n5fccMgBhneBIvFjyhENXfNVNbecPKAmDn/uy8HWHdXSu1KXGJ2bU8zXP2OFsFA4y
         zKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727473099; x=1728077899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JAczy5NWiAaSvBOAbeEafwBf4rdAnSDRW5XFj8JZ0g=;
        b=eL3AH9CYJmhIgTO3EXnhj+9BkBcVt9euUgxX32OTcr3XRy9osm4zlE4x1qhB8d5BGb
         r6CKf99n2RcTXM0LHPjViUJGLADHTYKIBuASbC+PCahaskZLzaqtYS5bK4daR37LKc4D
         KW5pYmLy5fqNGE3OcAS1waFYzhop/9Pvq1oPltgSJDWP6Q1MK/pr9hTMccbzi7f9JQKZ
         l93gkvY5IKLQERbEtAMNZLt4VZWO4/6mnmt+8qroLAsNLIgjYpPsUzK3IeBNbh5cb45Z
         le+aTF98HmNj7aVzqSsCeNrbqLNcUZWh933LDa2m5uvCGh56viWp4T16KJddWU8gWhjV
         SUMw==
X-Forwarded-Encrypted: i=1; AJvYcCXJttW3+vLTwyZ8r/NH0g9NBpMvmFCc5lclthSaseySzK5BK9Rk8tGzqNeD3UNdHTFI84LpRvKeJRLYsbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoMRThugBsRMVd7jMKSAWL5Gk/+N9rEciKyY5uKDuaPkARhLgj
	Y6F8Znh3q5yxHv56d3OwlGR1ydnLgvSUcgcWaL/5N8CjGV+R/gRT
X-Google-Smtp-Source: AGHT+IHjYKO/+LCtFh2NFtcWiK7GurS4hKeWsTjGKUCfSmOxsjgHr9e1lBJdzZ8c80EevleDM2cKYg==
X-Received: by 2002:a17:907:36c5:b0:a86:7514:e649 with SMTP id a640c23a62f3a-a93c4a69d42mr444899666b.52.1727473098593;
        Fri, 27 Sep 2024 14:38:18 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6e73-3ff7-9936-9d4d.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6e73:3ff7:9936:9d4d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2978a04sm179174366b.144.2024.09.27.14.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 14:38:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 23:37:41 +0200
Subject: [PATCH 2/6] leds: multicolor: Remove unused local leds.h
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_unused_leds_h-v1-2-46fbf41ed4ae@gmail.com>
References: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
In-Reply-To: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727473094; l=682;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=crgeMaJGRYnJUsSv1C+r4CDEushVzHzji9FATg0Rl3g=;
 b=PKK8hixWg+IAdT3Nqpa6WnbZvnRzE7bNl0Hh+DJABs0R7z0Di4AGJoPwh1MGmqo+PYQeNIS8c
 /r1zg91/k9/CKI31rEyhc9wHh07+dyK/WcAleyT8ulbrSt+iz0Zxwj0
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This driver does not require any element from the local leds.h. Drop
unused header.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/led-class-multicolor.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index 30c1ecb5f361..b2a87c994816 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -11,8 +11,6 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
-#include "leds.h"
-
 int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 				 enum led_brightness brightness)
 {

-- 
2.43.0


