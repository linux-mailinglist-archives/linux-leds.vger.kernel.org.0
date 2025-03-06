Return-Path: <linux-leds+bounces-4176-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4CBA552E4
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 18:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80C53AECE0
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 17:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A3526AA93;
	Thu,  6 Mar 2025 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ztniyrok"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272526A1BA;
	Thu,  6 Mar 2025 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281707; cv=none; b=BQddS3OBX5C//oHqd9OK8t842XcecGPxNivzB0QO3V/ZAbygWI7Q9G27wu3kWdkT4iKrewpngsYFSKctoARUl3P1he1uW9wkLD0Cy3X9ouhIQs0i7S3nbRtfCsWskSeVGvbmhQK1hntABynM+YrTSiwdO/RI/+RC19BaXKDcSjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281707; c=relaxed/simple;
	bh=o6oiJeJWe9zx49SJxc/973/W2CSaxwAlliyc8dDQBs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZfUIEhaSUwi/sy8YzgAon+89yt+v44Gokv1eqpT4l1PCYva2P8hdKaKaW3dC1+QSTWJcnVnNi70RO6H/uWKi1osHECEusLAmxWTQo2XZsq/Z7oyZkTISTaA3Bi/JCCK+48Ph34hpYUfV3tohlLz6fNt9TwEOjPLtFaNJgee76Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ztniyrok; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2235189adaeso16259735ad.0;
        Thu, 06 Mar 2025 09:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741281706; x=1741886506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4qWBQHBCdkZLviZtP5+nPDW+73XlVs7aY/i3T9gvT8=;
        b=ZtniyrokjtArshyus1/cbT8QC/2o52x1UAHVu6BkdRSOWlFm9WBg23Sy+VD1KpMPo3
         lqYsk5TdwUVkaxVERmP6dl53wy9n13Cd/AdEZsyGm43SRCCCVKwC9vs9LzKye9Q2MtZO
         JlmZJjF5BSKIDflX/RWgtSMzrA+JQ6JAGOvO1djmcnWDkedKL3aGIFRGjhJrubSjtnC2
         tjLIZuQ8pyFDrL5i8j2e1JpSXsxO0Yn7jTSrFYzlHck7eMj+1H4J/Zo1b0oQpwhW4CUq
         Wy0YrPd48PG1uDd8iGDpHrYkelPYfkCgqJcgc76oYUeKVfoeg//uvH/UiiTpqT/rF9qj
         GvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281706; x=1741886506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4qWBQHBCdkZLviZtP5+nPDW+73XlVs7aY/i3T9gvT8=;
        b=rlhJ7E2Z+4T6JPMzYjiF53g9cV0JVKJDNDGyfRt8TBifqsg7PG5jrINqMXPsTPWryO
         kqY9KiV3S9zDpJ8P/zfaNrlB5PO7i7ZlWfO1wuA63B9UrKaJ5VXLGy00NR+jT/pYGhD6
         WLw7hanke7v0Idcy7jRAWnu33OBL5X5UZ2ZkUzsBiU8X2uyodREJxvEO3y9pWiZDgw3K
         1fWXD79xaigNnxYKIjmroYXVQDpjR2lmFGFqTUHJuNsav/8JYANNolC6bE7Z5Mv6vsBA
         wiC7B6aLUCo6s8c66aQDTWbZKlP8qlB/05f3L+1y4q412/duo4Ir7qGg1/8WLtdtWeOH
         H4JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+j5gVVOhuI7F85YWlkyeppbrbSPcrQCLVC8cWwts+0JD0SDkpltVnu32V/p8BNolGy+r1656SivuFlwY=@vger.kernel.org, AJvYcCUK+tb4EW4F7utdVbKzvwxNOJyRn98MgOoKSZouo5fEwMPemZFU0Pl6Gwy2TN/xQ8XFIOlTyleUpW4hQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkSbxAC1Rxc4v43cuQDvorcnxmIMP+ibby0a+jjYQfa/ZKevXj
	5SrarO2C92wKM2ZJdTosYMtl47NRN310AYljnB/hVsZyR3J5I5jgCgZJvfyh
X-Gm-Gg: ASbGnctbBKPb5AY4NwBdE+IEshQraZvEktVYpNoFRinCIQub6PGxg2NjO6WL6VW6ZSe
	WEhwwvDE0v3FwkAIleX6T/OL0YGfQMgtDquvlW6KqNahTVtkH0gO9K05asJUJXAUqzpiy1nPDS6
	/9vrv0XksFyLvrLy2ydAgKN2B5ODEhjhscjyTf9G81BnRt72JlOS/YMBzFFQJxpgEHI1DnOzYRh
	nOScKXyrz0vErg8As72QH2LeLkLkYy3N1Mjho68r7BQ5O68tp/a466N+STiXQ2a7/Xv8q/fC16o
	R8I/NayW1yb8tSanlqlxywdnkwt97lxccg9IFO/w6TiPafC2SyktQHm4S5m/XdQXxw==
X-Google-Smtp-Source: AGHT+IGXfg256as5SYVKyDpcEvZWxrabnKSd4Owc5nX+aq1JZNwIeo8/EUnQ9KJg/jks0gbnyuVFeQ==
X-Received: by 2002:a17:903:19e8:b0:224:7a4:b31 with SMTP id d9443c01a7336-22426fd7caamr4384165ad.6.1741281705699;
        Thu, 06 Mar 2025 09:21:45 -0800 (PST)
Received: from DESKTOP-P76LG1N.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd627sm15103375ad.50.2025.03.06.09.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:21:45 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v3 2/3] arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B
Date: Fri,  7 Mar 2025 00:21:25 +0700
Message-Id: <20250306172126.24667-3-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306172126.24667-1-trannamatk@gmail.com>
References: <20250306172126.24667-1-trannamatk@gmail.com>
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
index 353bb50ce542..85441746d94b 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -270,3 +270,13 @@ &vec {
 &wifi_pwrseq {
 	reset-gpios = <&expgpio 1 GPIO_ACTIVE_LOW>;
 };
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led-controller@1b {
+		compatible = "ti,lp5812";
+		reg = <0x1b>;
+	};
+};
-- 
2.25.1


