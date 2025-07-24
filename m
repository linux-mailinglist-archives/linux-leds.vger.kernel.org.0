Return-Path: <linux-leds+bounces-5121-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2318EB10912
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 13:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50E3016DEC7
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 11:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8761B270551;
	Thu, 24 Jul 2025 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZEXAMRE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D22202C5D;
	Thu, 24 Jul 2025 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753356066; cv=none; b=JXkTJbelSxgAnVymeMtWzbH7UrMKl0La+EMsISzkg5kki2b5KxWhbOe9pREzdksaMPBhNlSb5IhnBd8vEpqBJjdaRtt5gSNzX0AfnH8Po5QzVgGD0RIqVRulZyDCFgB3zf2G1OU+q5qXgppe6o+Udx2RXzKjS8fzP8tyE8ZGqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753356066; c=relaxed/simple;
	bh=GJ4pctHY/4bFoW//K+mB+SlNuCrzQAURz73CHNGu0+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Topnt4hN5JQmhpfVfzmuqEnaMypEIegz9hBKZrP8J7MPw54b9UdYHL354Goj+Tb8lP1EZj7v54+VumHeUV9gfSI2KvfacXdBgbOA4VMxvwGbiowzx6KIThbPAX+tRshhX+4iXXCNgE81Pv6FekXaj6YfTDw7od5M3Md8ba+DcPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZEXAMRE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso542451f8f.1;
        Thu, 24 Jul 2025 04:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753356063; x=1753960863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hSQCOEIzYHJecR87epNPlMyiC4SVC+mm1g3l4BUonfY=;
        b=ZZEXAMRE1qeSmXYAXSAZaVxK0O1gNeHYppop6BHQA5Bdp5c8Q4LsqQH/ALNsEmkylT
         8LiIeJR4DCTmCuLLpfaPq126mO8VOLNlP319/tq6/LtAG9BM3CsBD36zkLhpdark1ZzA
         DOwx+kqGhrw/HT6LInG3WB3Z7aeU9ECkWiWtEywK0Clob3kGKT/Z8tnNfeqye2/aAbpW
         zas0pxKjS4azR9ugbOJLyEEHoCEqJ1kLmgwbPjt7+QopRRg6ubscrDqn91TOOcr0Z4t/
         nfzguDr1fXh0lJdOO+SQkI88nwSKWDwzb2h4teiPLQSadTfH3ZwKYQrKEBsjEic90LZq
         0FKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753356063; x=1753960863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSQCOEIzYHJecR87epNPlMyiC4SVC+mm1g3l4BUonfY=;
        b=VGR/YcMtIPwk3/KcYYuWzlpxCNCD8G3ueq+xx3P55HppjPGB/I5lUDBP3h1cMS34ci
         llg81ceBuMhhGGAxK4NzPdt7e+ufegXdzJ21vRM25uYkUG8lgVcz+dq4bQdAn7EF/jCV
         ZY0YvjSpnH4o+S6tDIqyMqjtNa8zg7NbnlMSVKvZOecd7BXAqFWkHRZWmhP9xeFRHkMa
         qLkpOAiazAkTBeMOSztyIpwiKY1YhA2z24QJei3Pl78WjEd6XfAN4pzP+7c0CTx9fwKO
         kZxaJzV1qE4fhJX3UCNpIHhNL73SEdQPA756zaH3gzIPekBMUouIdGsmcaFvgt4g4TyQ
         tWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGtOntOgOOVwaCeICzJl/TaNpDzxgml7VWFgkuA0PjsJPP03fGY9dZk2pjBpPtQEP38K2qgW58MsbwxvA=@vger.kernel.org, AJvYcCWzE4+4IyajX0nkVUNwLDHlgL6F5qAeMlhiZiX74loKZqZ6bhjL3ntHQW36IFI6wy9d1hOVcqSfTs169Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJE+IGasCMt16XI5xU7Uwd/0uYO9Cfb+CQBpTY3wMEdi4d4WQs
	6xG3P+70wUssLPqHa2stMp8k7RAdYPFLNlnPitREXrAeKR133gOzL6O5
X-Gm-Gg: ASbGncuGoHsq6fHJnorKh636lysPkPkO2J2eeZ4dw8494ofzxsYV6eer1MtroynKRzi
	BUmDfVL24ZwBi9NIa33XJ4YJQ3uD86yK8Z1/0O02smrh/eVZi+2N4mG14LhqoCxu4HFGwIk12Nq
	yn6tU4F9NxfqCF1qbg7EYksKq1HT6LFLrhEWddwpq5s+Cs7axnLA4A3DG2vuSD4mKXx3gkB0QY5
	y9D1svS18Ngj31GGQU6n0SemI0+R0WqTasqoK/fwqVy3AOhFKtqMGj42hFlFuqzBQTHBXbiBNck
	Q8L6jbgUs0kpLDp08NCK6H/mEyQYbyTy7UBj3TN7G8CF8i0Oc5lITu60VAuEJdw334A99Ws+FiA
	0nJyy3kgWlT5ryeGgPUog
X-Google-Smtp-Source: AGHT+IHpcCLjVhhz71WlbwY8iCkh0pJ2qEaLKYoevY6qyXrZtQZaOoPdSEOXGI2uyOuNLS1CIBgvDg==
X-Received: by 2002:a05:6000:2283:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3b768f0778amr5020498f8f.42.1753356063052;
        Thu, 24 Jul 2025 04:21:03 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b76fcace8csm1888083f8f.54.2025.07.24.04.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:21:02 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] leds: Kconfig: Fix spelling mistake "limitiation" -> "limitation"
Date: Thu, 24 Jul 2025 12:20:30 +0100
Message-ID: <20250724112030.142121-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in the LEDS_BD2606MVV config. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/leds/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6e3dce7e35a4..06e6291be11b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -674,7 +674,7 @@ config LEDS_BD2606MVV
 	help
 	  This option enables support for BD2606MVV LED driver chips
 	  accessed via the I2C bus. It supports setting brightness, with
-	  the limitiation that there are groups of two channels sharing
+	  the limitation that there are groups of two channels sharing
 	  a brightness setting, but not the on/off setting.
 
 	  To compile this driver as a module, choose M here: the module will
-- 
2.50.0


