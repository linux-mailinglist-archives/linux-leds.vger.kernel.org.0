Return-Path: <linux-leds+bounces-4521-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0E6A9751D
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 21:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124F31796A2
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 19:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7D1298990;
	Tue, 22 Apr 2025 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfkXcjdF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77329898E;
	Tue, 22 Apr 2025 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348576; cv=none; b=ZabQWD/lNMEQ6mfBorGKbq1LZYrWPWyJ/s72m9ifo8INJes1Xp/Tj9qhqotVjZrJajsIo3H6x8fzgTrT0GEXTDT7Qk0bceRoG0owX4NWQPFpZYAhZTaj1qq+kFDDjgPX8IIqP68lWI/uJd9T/ACdkCkk9GZJ8Mp7FLvRE0bAdP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348576; c=relaxed/simple;
	bh=n/s2ADo+b0i7nG5dHcMjYTx2QEqnguzqYqE4wCSoiL8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B10GYe3ftnqro24gbj5SIu0eppegQ29AhFY4kPGBh6Lalrtswbu0TwCk0AiayHak5/nW5hte4797tliYwziW0m0hc+fchUFXT3gAbLAsYRbbHH5RVvmwM6uy7zzYsf2miDIq3UWNQy9egoRTqaHI+y9gpSbpzeNUtVq+hay6Gbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfkXcjdF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736b0c68092so4762088b3a.0;
        Tue, 22 Apr 2025 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745348572; x=1745953372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tfx8AHr/yIS8tp/7G1Y7pM5wDQkLVkrc9vIVDSWIJkA=;
        b=cfkXcjdFT3IN8zs1pGZaYc0aGBck5ioxSr9phkg/M7a2ufT2Wd5GWGtoJ0QwHrAgak
         OE1R3t2p1Dz0lAOEH2QSb5wD+HGb9ko6DyUs90x3wepkCzQ3kR3Tf1jNtB2KF8sxQ/6v
         39FEG5MbW2z2F85YmqD5Sfb+hB2LmvIwTRr5eRsl18n4H15aTIf+cRaqLTDXXyKYhCVQ
         2zYZU3O8Xm4gnbwCVqH+tOpbaKY+Ihj7zf90dkPtGHlZNqQkMIXK94GzPWQ5+1QeAO8q
         +vaeLTmh+yQeNI+dEQU2c8AiQkhJ43hnDlTwhZ6tYTo1Crvs30pdS6v0Al2gp5pmQUWP
         RiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348572; x=1745953372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tfx8AHr/yIS8tp/7G1Y7pM5wDQkLVkrc9vIVDSWIJkA=;
        b=ciEwjmNbdVKQ+3HghdSClpg+11GdHos3UJ1D+cs157TH3rrIFqWWpXFBLYLOsZyR++
         VUd9HjF36dJmnO2t9d0z2QGAFgE1aazbz1ozaEuE8D0KnhMRTYQyvxK/Swh0kWpaVESC
         EQ3PaBDVK3H6/GpClhVJMM37jcr+fY4Gp12n6yLe17YG+PjYfe1JCA7yyKcsmk54cEnj
         2mgZfknRXbEQ/x8iKrMMrLY3m+j9E5MekQdXEpDQrCGq/NT/ixSxu6qzwSXZ5QluhUeT
         m8T9RJv7xy8lFB7o8sxQLXpGDfpf6s7u++oHI/3WKATiwmI4MXaLON5tA3dBGCtdMDkM
         3YyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrvgLYHH/VIxUX7zgKkQoNV4BmTgSPJqJjfo222ZgsV80RZoTvqEG8QIIEOq2Ss5hiH1Ss2p3f0zx2Dy0=@vger.kernel.org, AJvYcCWzEkQNgL2pI6XobwlCZlqc3/JO9vyNKlt1ENkQe5LubKomKmm6sc755p3mxJa+NjP/HtMxLITt8iv0uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1RkSluuToV9RdJTON4nqgFHuzWya3Lm4YNFWn9+nqBhihhIvC
	0+o3r4LMKVGFYOwGy8rSbqRoLaNXhJMpUwAXxYQSLXm3n7iS0wXlCCKYgw==
X-Gm-Gg: ASbGncuTplevdlXU0bxoAdsBvRR8gQjsTRPMbsB5A7FLmRWFRaJl5kyXTo2pYZ5Db2M
	xkb6RJOtt+Sqb8PP4H9xZQKZ9Bqk1bn615p3Fccylt9t0hKLeKrlOqPNf/wtXRyndWdKSkU17pz
	aJ6IYACkQX3XcqRwKcT7m2ANN3qsz4aLLZ5GFkEQFX1/B1WiQ2vsv1CKMKz3SanE/eOJ/gjZNOr
	GnkB2Sav+xvthCPQlvwN0SbM/6fTZzJ7GltpHbcj6whoyMrfUoHr0uCrkYYrcR8BWjCwfL5eBNq
	nQR7VDWOFn9hs9TeOmZ/G+qEyFjR25wKtM1E3FEjB1NzqLiVR4MVZw==
X-Google-Smtp-Source: AGHT+IHN1Bo0thOfHM2JpWu2Mf+hd7oomg6z+ZUAFUVmLBhPYkTeNejDOnTEt/hRXU8GquVDzedsRQ==
X-Received: by 2002:a05:6a00:414d:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-73dc14a32b9mr22718502b3a.6.1745348572384;
        Tue, 22 Apr 2025 12:02:52 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa574fasm9287684b3a.99.2025.04.22.12.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:02:52 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v7 5/5] arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B
Date: Wed, 23 Apr 2025 02:01:21 +0700
Message-Id: <20250422190121.46839-6-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422190121.46839-1-trannamatk@gmail.com>
References: <20250422190121.46839-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the LP5812 LED driver node to the Device Tree for Raspberry Pi 4 B.
This enables the LED connected to the LP5812 to be controlled via I2C.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..2f058cf5d76e 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -152,6 +152,16 @@ &hdmi1 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led-controller@1b {
+		compatible = "ti,lp5812";
+		reg = <0x1b>;
+	};
+};
+
 &led_act {
 	gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
 };
-- 
2.25.1


