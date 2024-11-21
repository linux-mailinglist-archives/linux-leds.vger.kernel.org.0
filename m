Return-Path: <linux-leds+bounces-3423-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8B9D5118
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 17:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BDC2B21DFA
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 16:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2AA1C3F0E;
	Thu, 21 Nov 2024 16:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="OpVqZa79"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463BE1AB6C0
	for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 16:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208323; cv=none; b=EmQSJWUYHTReeXO12cLadh2SAbFWH4ut1hALpODYGMXk7ez6nRoa1SnAp/mkZ5ete//QJF6fHcH6wqy1KhbjnqX/f7YuDmxQ7UtxSy7b6ZtgnqNNCUDJ+8D/CdeAUvPpK+3rGRJcIUrlyUPMsAmlz3nAcycmzzJcy5FSvzTJZQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208323; c=relaxed/simple;
	bh=EbUd2+Uk9VF6AmI7jko2szQABwjudyxSbk/plvWGwiU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Aou2VK9Zze4k4yWBwGQYNYRdElwxmkfEE2ZUyTjNjgx1nGZzsuQTk00x3vI5vo/mYSbTCWuTXWx0lMMUNrxOc0t/VCoBzMDdTwHFjzM+oxoJPRhwzWVe3KNNLRysCnN2K+BQgo90OoxNJHHC/mSTG9ttDUfi6OFrS2j8F6k0D24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=OpVqZa79; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cfddc94c83so1464836a12.3
        for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 08:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1732208318; x=1732813118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tI7Buy3amAiI+3eJ7b453h1BbqT5wHqViKWf67eK67g=;
        b=OpVqZa79nPRz3p+Tpj7eLXTQgS2EnbJ7qlkmnvvcOA+P5JstKBD/XhSVZGTPdylYDN
         xpgjK/EH5s1V5ZMtcRDYtyYHua3844lJWUUDNecD3wZGSgj3AKVwJaNtho5hzOwLDl04
         Uj4PIujOmkJm4um9qHcRmy0cc2/11hJMO7g27Fnpa8pcsUFwaw2p/0VxaWso9ihOvd55
         +bngMLKEy1xzsW4FzpH4IKQ93kuTxjQS4dDklEHGW9pRYGDnpZ/CpA3+MfuOHPlGtX3w
         yvFZxoGJgkENjsoYl/EgBTfUbz7At7e/KN6uOugwJa3UhVMslr3ZX2c/C1AYp8qMn8Jt
         80YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732208318; x=1732813118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tI7Buy3amAiI+3eJ7b453h1BbqT5wHqViKWf67eK67g=;
        b=cS3kOY+BEJvuOOMZBs48P6J0ZRFU1o6/j6+5S3ky6qCyIWLxUEr0n+oDfwuzTlOLcp
         KCA6TdccuWIKtIAfSojk+MhWiqKlTPudvW7qfB2LfdHrND3en0nqwvtBONc3hVf3TqWA
         QdvQ9Lhe3ZRcBudokh1ap23WOKYedUM6YAxeSZqR/LW4ZyazHX/7I5XdOmVasihjZl1C
         tyBioz9PU6w+8AnGgfAwPUx8wMxQ9Ag7Q23wplBOglhgV2miYPfoAIhhRWlicwiemsDM
         gvphv38eXYIkMLHp1199NcLzT7AbwN7X8mSfdbmo1MEr8E41sQf+/SgtfBy44VBYJUkp
         DRYw==
X-Forwarded-Encrypted: i=1; AJvYcCVGQ4OPsH1OLYFl4vX+aAhtW4e5mlaL5r+HQFAyg5Uw417n80Luhg5QHl3ROBkjHw4Hluj0ap0NwT+7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3g5GksARBhw/WIbgO8BujXvpHQB1j7TJXagBqs/LukixmDCFZ
	RJiI07h02dqS7516C/vx6osuwIJi64/BzZxDyFA5robuRrCrr35wtVWuzII2PoE/tqkpCI0xG0t
	UXHD09bY/ehoNhRB0wpU1v9MDBYfSHqtB6Jycm8doR04U7U2o8Q7q9IkFn9kli4uHP4K4ymUxDr
	ra6zch07n9w8g5M3Tu1UmVd43+
X-Gm-Gg: ASbGncuNoZaD/pfR08CEAN113lis2XPmdBICDGUgF50+IM9ny2LWvKqL0WrLqM+jCnr
	+DIUs1QJNCiK4oy/P9Wm6pUcM7c/IZ4WF0tGxxa3wl4TIh02fTtlPDmonLgDjfx6py33v+2o2uI
	88cTTQr9f9W2chLxAz2G+yTRKwZ28vFbZvXWAjJTSoiY0sGdH2q/nuWbMJdf6FnIwGD1mxaCXb8
	/snj1VMDm28YCYBmfAVOncR0yMRnPlnj/q9dH9brxdGiTMiRXK9/MTRZZepHeNtnAs/tTsbJJ5U
	DMeE3E6AJ7q+X60G5vtf
X-Google-Smtp-Source: AGHT+IEgtjBf99g6pyQ9eadqC025Lpa2cZwpMMTCVFBJS9y6rTNO+LP9Ip760P4TTb3QoAaLTe7pyA==
X-Received: by 2002:a05:6402:1e92:b0:5cf:eaf7:276c with SMTP id 4fb4d7f45d1cf-5cff4c55ef3mr4221462a12.12.1732208318582;
        Thu, 21 Nov 2024 08:58:38 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f41536d3sm101502766b.24.2024.11.21.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:38 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v9 1/3] Documentation:leds: Add leds-st1202.rst
Date: Thu, 21 Nov 2024 16:58:23 +0000
Message-Id: <20241121165829.8210-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add usage for sysfs hw_pattern entry for leds-st1202

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
 - Changes in v3: Add leds-st1202 to index.rst
 - Changes in v2: Implement review comments

 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/leds/leds-st1202.rst

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 3ade16c18328..0ab0a2128a11 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -28,4 +28,5 @@ LEDs
    leds-mlxcpld
    leds-mt6370-rgb
    leds-sc27xx
+   leds-st1202.rst
    leds-qcom-lpg
diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
new file mode 100644
index 000000000000..e647966e496c
--- /dev/null
+++ b/Documentation/leds/leds-st1202.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Kernel driver for STMicroelectronics LED1202
+============================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the ST1202 LED. The LED
+controller implements 12 low-side current generators
+with independent dimming control. Internal volatile memory
+allows the user to store up to 8 different patterns.
+Each pattern is a particular output configuration in terms
+of PWM duty-cycle and duration (ms).
+
+To be compatible with the hardware pattern
+format, maximum 8 tuples of brightness (PWM) and duration must
+be written to hw_pattern.
+
+- Min pattern duration: 22 ms
+- Max pattern duration: 5660 ms
+
+The format of the hardware pattern values should be:
+"brightness duration brightness duration ..."
+
+/sys/class/leds/<led>/repeat
+----------------------------
+
+Specify a pattern repeat number, which is common for all channels.
+Default is 1; negative numbers and 0 are invalid.
+
+This file will always return the originally written repeat number.
+
+When the 255 value is written to it, all patterns will repeat
+indefinitely.
-- 
2.39.3 (Apple Git-145)


