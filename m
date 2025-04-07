Return-Path: <linux-leds+bounces-4428-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 074D8A7DA57
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 11:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 194CE188E687
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 09:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E44230996;
	Mon,  7 Apr 2025 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZD9/+jl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE7022FF21;
	Mon,  7 Apr 2025 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019660; cv=none; b=chUX3Fp4gDgc+lZzU433LCwdlQ0WKPxfqrY0f4F3QMyuR1Uxmq10wiNhtGSvA7kpEVD3XZ5TF4gEao+CJZa27iDaZi4iQzA+AH1yA+Q+R6LI0MuEl8e3OW03mtTskPuZqbIyDkCeRTR2sjWkdh2RIKgzzYOxXGEAzBOt+I59UsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019660; c=relaxed/simple;
	bh=U16ykuJVW+RZ2Mtnpc0kC6WlrFpzsu8T5Gn3Qu7BLgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uy8OmQMFFX0HIiPo32xgZ0Ali6XVijbcNpLV4/4LbIuIIfH6E14OlnCa22WyYOO/NN8vsf6XxRp20t+/vHlH35JQHn8HUZ8C6SqlGbLMrwmW1trMSgQlFiK8vZfCxryEYH0hHrzdEHite25wdONR0zQxGVdWw3V03Yf7CtyExLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZD9/+jl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2295d78b433so36905685ad.2;
        Mon, 07 Apr 2025 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744019658; x=1744624458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkqbTBwPGVLrWizLUawPs+MSKpssOAtGiDagVUV4NJ4=;
        b=cZD9/+jlbP6IlZPtiInB6s64EYv7fbSsqD2Iqxzjc42i/E5k3gh8gyWMAFX00McSVA
         DKnac0aVy26/zwgaGqR/wRGdxdURbuSbSJXlLmpgRxdOZoapBvrmdtM7hWqoDG8e9O4a
         +fc6s2YBWtFPSyzm4y9IYWJwUbbBMzb53/ZDyt+K0dvsONe9cU4tSmEKY+FzbsrY9TXN
         Che+R4QJHx9JlyCqe0RvcFTkWjWqe0iBR2Cjes6OzFoCaemjEVD1/ZNwhIbnRoIOAIIy
         0IEv+zkv7aKoWJ59AueSGxmf1ObETA1Vfvn9QJo7SD+ozxrYRrPGN/YTR0ZO1B3sJZQz
         xfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019658; x=1744624458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkqbTBwPGVLrWizLUawPs+MSKpssOAtGiDagVUV4NJ4=;
        b=oHxApk9jZrSFwlzg39YzNXeTjHjKnpfXJDpHSxfOGm6QLWXSJ1G6UzagWBJNK5sjLZ
         XcvNW+l+3Ur9ATupSnZwonxWeuuZuoXaqoVwVrwSpT5R2CXT2KbVtrU70qqPxn2L/SOQ
         pIeyn0w2v+tIi7d43dgeBfbgY3E/4fD9TG58/5hXUhPPYg/7hBsmm4D4Z02zSn5pPJ4w
         prXHWu7pM8zBePE/PTwnlmmlxI1iaqwoMr6hxe+MSeKkqBeY3CMeeWgQk7VLLSpAXum+
         vmcnuFFPlz3Tv/rwat5ZtI1rF3kvIpWNdq47UT2qVFYLlF13+svnUZfV8vTnctXB7JFW
         REWw==
X-Forwarded-Encrypted: i=1; AJvYcCUWAzVNs8sYAXMZ1UsLj/I6nFtVrqFQ4Fa1tXs8NNIHwntBsszuhmDG1/+ovPfbxyTdjb70fRJA0OEe@vger.kernel.org, AJvYcCVawFQdheiTzNkozB9KzAtSxUMrPi6GNqTU4MCf2+nQ+cpH9NFV9smVvUs+sFzTAg5ftIqKcc5AveaaVeo=@vger.kernel.org, AJvYcCWKR1/elTRLd6bt1eGw1VGYy/3XozAS1BVipeb86FSK05Dtx2psrAoh3/OYUisgAkvJuhJmLS8ouChrXg==@vger.kernel.org, AJvYcCWQ2/l3XcqF08POv1+QiGnEVp5zb8jVSjmrCE4DUuwe/hqP5c7E3tzp4eMRT70ZS27uvHg0vHKt86zHW4FV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9DoXvZ2Gu8GvDw2NgZr04kJQ1914p/DfVZ55g5FN2ez+fdNyl
	4X5gYh8aRFuPefRN6J6V8df/XhY62WC6n1UjCTlIJ6jyrwWfJ1Qn
X-Gm-Gg: ASbGnctbd8jVnYuWwyr6wGEoO0o5JdTwXMtS3ObDtYMWNzZwSVuYNvmiaSGSlHdq91J
	RzgC9GTtOPhrij2saeGvr0jOP8DwfBeWR4IRWy3eOwKwK5PBAgRTi9P8S2o8HR4YEgbYA7wODSX
	xy+zkvoRnb1aujdh1RCcutUY91xAPEpryQRapZ96gWwQwCTQBkox9mdJrwzai6TAA98Bz34Xu07
	6P5YbFg23veggtviStrtivkqpJTTuhlnzmqOfEjtsHq9YaT0l9O+w8e3qmb8ylMboY6aLkWCMcm
	TjV2u62+hw3jdh/NkT1wo09TbgegLqtxhN74yQTACWE=
X-Google-Smtp-Source: AGHT+IH9E8XsbCxLfsVsslPNMo/cSHYFTOjiDQDxMCuBzObL12vZxjJVRmA/QuSkAieMl45UO5T2kA==
X-Received: by 2002:a17:903:2ce:b0:215:9bc2:42ec with SMTP id d9443c01a7336-22a8a0b3744mr133132005ad.47.1744019657677;
        Mon, 07 Apr 2025 02:54:17 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:54:16 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 4/4] backlight: ktz8866: add definitions to make it more readable
Date: Mon,  7 Apr 2025 17:51:19 +0800
Message-ID: <20250407095119.588920-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407095119.588920-1-mitltlatltl@gmail.com>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LSB, MSB and their handling are slightly confused, so improve it.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/video/backlight/ktz8866.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index b67ca136d..5364ecfc0 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -24,7 +24,9 @@
 #define DEVICE_ID 0x01
 #define BL_CFG1 0x02
 #define BL_CFG2 0x03
+/* least significant byte */
 #define BL_BRT_LSB 0x04
+/* most significant byte */
 #define BL_BRT_MSB 0x05
 #define BL_EN 0x08
 #define LCD_BIAS_CFG1 0x09
@@ -47,6 +49,8 @@
 #define PWM_HYST 0x5
 
 #define CURRENT_SINKS_MASK GENMASK(5, 0)
+#define LOWER_BYTE GENMASK(2, 0)
+#define HIGHER_BYTE GENMASK(10, 3)
 
 struct ktz8866_slave {
 	struct i2c_client *client;
@@ -105,8 +109,8 @@ static int ktz8866_backlight_update_status(struct backlight_device *backlight_de
 	}
 
 	/* Set brightness */
-	ktz8866_write(ktz, BL_BRT_LSB, brightness & 0x7);
-	ktz8866_write(ktz, BL_BRT_MSB, (brightness >> 3) & 0xFF);
+	ktz8866_write(ktz, BL_BRT_LSB, FIELD_GET(LOWER_BYTE, brightness);
+	ktz8866_write(ktz, BL_BRT_MSB, FIELD_GET(HIGHER_BYTE, brightness);
 
 	return 0;
 }
-- 
2.49.0


