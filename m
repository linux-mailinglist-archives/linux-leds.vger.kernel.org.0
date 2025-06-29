Return-Path: <linux-leds+bounces-4928-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B64AECCE0
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 15:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2260C3A5C6D
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 13:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6F71E412A;
	Sun, 29 Jun 2025 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+oULH5T"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE7735950;
	Sun, 29 Jun 2025 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751203164; cv=none; b=aPsc2JRcCzBxI00y6n/sowGSdAWvL/OFGh9PZcgGGr6meBTrxpo4BVHI0sNVf4y9KuAOSDyJUD5gjfFxj6MQjrjeec0Ky7Ryw99gP9LIn7DWLXyrXydv+hw+pkW5FjVx7e/xn4NEd513ZV9TsLN0BHD5nTTBAnMpOGCgzg+bwqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751203164; c=relaxed/simple;
	bh=hh028ZJpDG0V+KiWTD6rfqoYckc2AWugA9hr8Ise5mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mhcsh7FZioAVERKUOTaLWxR884FnaLXrH8Q65ATQv+27rAX3JrHYkxdNCPvRb9A/N0/W9l7ZIbRxujKSY+Z9wd48jNstyHDbOfTCbR/YQNOhtxU7fBJH+uSQUwGknxtuctk5E4ts62AOwXeuGeo3qr6D4GN3c/eZSkqgsb/UsT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+oULH5T; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d43d220c07so319807685a.2;
        Sun, 29 Jun 2025 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751203162; x=1751807962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6QhJOPYC4Oel4k7RUi/DYQufPPKB57jic+eqoSasGA=;
        b=P+oULH5T2wvykAmZiRca32wOmzlSmNOLNC2hfgAb36WJqF4WR/4mKDQuNs+7rtsfbQ
         TOmvhSV+WLSXp5/FfbVeGX3onGUVY9LTKeN46H7htubaZjdi+g5P7b52C/J8yolxnKaG
         d/8v0IH4FLL1ls0vC4m76js09UVlaI7zni5l/TAQF1OmYOgG0BHpXxVPh418+HnhzUXL
         FYZlmQn7M7pHMgfQ5d1strtl/qNNqjg+0D4eFs6iWX8H+NDpfYZCAZXXYoemrRw/P1Nd
         gN8j4XJ09IHVTQbHrZIpArn3j3aR46sWJaJJAMkPpScOHmG+oX0R7zQUA3L1FIZxfRHn
         ihhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751203162; x=1751807962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6QhJOPYC4Oel4k7RUi/DYQufPPKB57jic+eqoSasGA=;
        b=KcoM1ngpNVsHZensFue/xf0PW5815fNX7KKjvLkVnnScmjg43IxPYYIJsH7q6jolqI
         sESqcKft1Kms2CDnUtgY9uW9T2zL5+0Z5Uzh31GkDIHR3NPKvxlv6pouTzRxapJC6Hy8
         qCneqEcOo7QQDpsfsYpFXih7v26C7/mvOd+8OEjAYx5jJe75C6pird6eBD3gm0dU0N7r
         y+whTthmf7NlWJVaF0XpQFABDtLCu+ATSZ//Qq8gM0maX1qu0PpUPQTqvIZqOHuTr5ZS
         KDZIYOS6i8v/BFxi2aUU3sTH+lzUyN8Ukf254G4U9gUkbDFlqskW6fWkK0q1inM9IsV+
         ppGA==
X-Forwarded-Encrypted: i=1; AJvYcCUktZDqKpocMoqL6LfqunZk/2FAvPjnsgKRhWz6EFQmzd1DvbGKUAjmji26E0w5GynymPETDK7E0sTh2w==@vger.kernel.org, AJvYcCV0IJORCwUeT3asnz8N8akhD1ZeigoV1YQO9qlCL0ZhWUCOS3aei3Z5qBoWT9uVunNPaUb/NXrt4xOu@vger.kernel.org, AJvYcCV7OqM4KSeyd3Pqjww6a9aGV5fNZlA94qBVBVBlK3te4Q1UzOoMs3kzjZn1IF41Ns/PeHo/wzFDblavaxBp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4vGgb8FdM3/icQrzY0sgd1gp6MgYEAlg5YwBHLMa21ncsCPcc
	a+8HBl6REYaNAzrC4ZckSbbt0RWiRHlNmUKwTx8qeNKjleOH+26pgE/aNTk95qdclkw=
X-Gm-Gg: ASbGncsAxRCSIQQw3YxMIUb2hzh4x5c610VYO567S7vt6cW9Nhir8rA2c4Du8L+Pv+3
	9RCQ92AFSs/SG7FiXL86p0L6UTm6EXpT0VpVyslCB6PzciXV7nMJHqPQMVoQqSpHh/vkPNMjjEd
	pnCRWKdTo1Zy/u9aPh2FYDKS7ptR/A2AWiEFgGGmoMpS5RKPh666qUtW6FmJ1tAMlqoSm+yEQQv
	frkQl9Txz24UGP9oSEbfjVtmHPR0n/wLLpfgDbKWUSdBsabAWqUZGGO4mXiwSVL3aE8GjX/51Wp
	x+8LJX0Z21xVjC2rJ/feFLVKEz5KkcubPCH0aLNx1pSX9YdmXQ+ElvxcuegFc+FZT/Lty8ZcCeg
	Q42BhXGSZ97O3+N9TDWrBmZXahbNSAS4m
X-Google-Smtp-Source: AGHT+IHlqhpPi4qCpPb3OezCRiBkt77pz4rWNJBBnoBQo6SxTT9koFz4hFUCTn2WQZjlOqbPGYmsxA==
X-Received: by 2002:a05:620a:170a:b0:7cd:1f0f:f61d with SMTP id af79cd13be357-7d443994edfmr1823812485a.54.1751203162103;
        Sun, 29 Jun 2025 06:19:22 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44e27ed25sm241166385a.97.2025.06.29.06.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:19:21 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: [PATCH v2 8/8] MAINTAINERS: Add entry for TM16xx driver
Date: Sun, 29 Jun 2025 09:19:20 -0400
Message-ID: <20250629131920.50060-1-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629130002.49842-1-jefflessard3@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efb51ee926..bb88b007c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25047,6 +25047,12 @@ F:	mm/memfd.c
 F:	mm/shmem.c
 F:	mm/shmem_quota.c
 
+TM16XX-COMPATIBLE LED CONTROLLERS DISPLAY DRIVER
+M:	Jean-François Lessard <jefflessard3@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
+F:	drivers/auxdisplay/tm16xx.c
+
 TOMOYO SECURITY MODULE
 M:	Kentaro Takeda <takedakn@nttdata.co.jp>
 M:	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
-- 
2.43.0


