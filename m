Return-Path: <linux-leds+bounces-4858-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6B8AE089F
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 16:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A39163ADB68
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 14:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFE11E7C1C;
	Thu, 19 Jun 2025 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="SA0yEFB3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C751A21883E
	for <linux-leds@vger.kernel.org>; Thu, 19 Jun 2025 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342978; cv=none; b=YGa54sEsFy60USxLMkrHjuvYVnIRDjV6ANjxO/SqagANzUhScTHPvG5cDC0WfctW42v6QexZVGBjdYAk+09MxLWzPJIt8KU9yuOLiWiwMklQ0BixNbVn+gsmeZmGbbGP50/63aEXBqCIHjt8woG3OJM4YeU3MFWBZI0O+HwONWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342978; c=relaxed/simple;
	bh=1NqFeX76uOafMoxDzVMr2uIEplDNjowI/9HMi+Nta8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dK+ppVyv6IsIOn7M4yCC9Ay+/dthB1hajVrN/5RDMAQXpBsrRjou4JPSbT5f7tkG0HfjBu8+MJ5Kbd2xHX84YLt/dnStq51c9l7xOBBaLbIV+k0FP4dw1PRcivLHEXeUSvOUSHxvDLdqOHmKgdRWGGRjPYMtmBOgdx6BUKxU+bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=SA0yEFB3; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234bfe37cccso11898125ad.0
        for <linux-leds@vger.kernel.org>; Thu, 19 Jun 2025 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1750342976; x=1750947776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfkel3uux/niXoASJYOvQixxt3NyKBslvOufdc8FUZg=;
        b=SA0yEFB3nxQZcmge9Mb7tOQUBTfnjDUhMmfZ1pAAvLgFcqe6LsIelmDHTa8RWwkMIi
         g/74HjcV9+y/Ww4JY0RZTE5EjI0wsoeBkxpNX/Fa7LzPkEVCTuT0BRQH9U/ivDtmlWrg
         qRIFuv3bO1clAo29MGFbw8OBjeXQy5nVIDUZhku0RX13hGuuaqJ/Fvf4VmcHTbdObhws
         l+qg9bIsEVOpX1uUAzImrEDjqQqpmDC53t8lSlu4dH6hYFQQLAAJIC0qBIOrga+HiRcJ
         XBRWLa3d3eaUxA/Dm5NTi4pc3xA0YO8yIk4+X/y8CJUNqeE5HRO8HlcAoCdy8CDRLPyq
         ARLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342976; x=1750947776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfkel3uux/niXoASJYOvQixxt3NyKBslvOufdc8FUZg=;
        b=uw+IQsWncdE4DmWrDPO3irZpfFkWbtT51c+JXKqFhz5m0wiZc++uknK7qZmE64QfSW
         uOdWJZrsXJDhqGgaENmcLH1uFf6vpto41JZ36MC7PEQ8bbVwm7/cpKTYedFUZTKBb58b
         GO8hP677BIO6WgqDas7fWrW8xknD4LnM0r1Mp+VPEU8Jmd7kjUZRh45iIprYGJlQQSMt
         /f8Awkosb5w4FDDkwBq97ZtEK9IAQiXGzshgdvKiroB6gZkUVaGt+9o8xReIcSHsW8QT
         7QikmKjtv7CrSq2IxeSkHjsktd4mzakaeOiWxwTTio8DjLrViw9iDUsoRIqpTOcc47SC
         YvVg==
X-Gm-Message-State: AOJu0YzKscTiQVu1E+Vf51f492RNXqvm+loDUZyR2mMPxuat/huqXSVJ
	KQgUw8ySNFcZApgyV/qQvIh4kG4TX3VdEkDr3HzP3pxAiGDwozjWI01cKMEH9L+yvSggmiW/tBM
	IdLsG3A0=
X-Gm-Gg: ASbGncv98u1RnSwNIH4Y8H2d0P3+HDv05AbOEEdtzi+FRzWW3sERrq1HY2e9K9GuNIV
	lBy+xEZt6ht7Vvb0ou0PfO1tiw4Zx2OTSpAf8IzPtoQ8TH9O18oJ6W0Ao8/UJNO32rE8zYau9PG
	j3zmjJqxecCXvGRFFMxXsY80Bg/osqRNGhvO6C7CQ/DssdkXJFPt0Mcv118MontrVslh2gAOnHY
	1UhALTTG9XlCICkBG3mh3pmR7pfamQtgxNfUeurIpGqpMb0O4Jms2R7JPazwBqX0svvswJx1iRS
	FWe3+Knni52g8hALz5R4PN40MJMd8z/jPA/PkrUN8tZGQLvNcKhq4jpwmoCQJdirzue6aDEaIdU
	QoRgM2WzY8E/PtRKc
X-Google-Smtp-Source: AGHT+IFdNHLXgwj2gO8B7fGrThZg8BFdc9hB6KLv6mpJ+H+BIakpHH5RRkToYraPvgLraVbG38vS2g==
X-Received: by 2002:a17:902:da2d:b0:235:2375:7ead with SMTP id d9443c01a7336-2366b14d317mr356942265ad.28.1750342975882;
        Thu, 19 Jun 2025 07:22:55 -0700 (PDT)
Received: from pawel-TGP.seescan.com ([2a00:23c7:1d1a:9c01:6a9b:79fb:fd3e:b03b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bfe4sm120259945ad.18.2025.06.19.07.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:22:55 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
To: linux-leds@vger.kernel.org
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 2/2] dt-bindigs: leds: is31fl32xx: add optional properties section
Date: Thu, 19 Jun 2025 14:19:00 +0100
Message-ID: <20250619142233.653273-2-pzalewski@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250619142233.653273-1-pzalewski@thegoodpenguin.co.uk>
References: <20250619142233.653273-1-pzalewski@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add optional support for is31fl3236a PWM frequency switch.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
index 926c2117942c..aa38a0638bad 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
@@ -7,6 +7,7 @@ Each LED is represented as a sub-node of the device.
 Required properties:
 - compatible: one of
 	issi,is31fl3236
+	issi,is31fl3236a
 	issi,is31fl3235
 	issi,is31fl3218
 	issi,is31fl3216
@@ -16,6 +17,11 @@ Required properties:
 - address-cells : must be 1
 - size-cells : must be 0
 
+Optional properties:
+- is31fl32xx,22kHz-pwm : When present, the chip's PWM will operate at
+	~22kHz as opposed to ~3kHz to move the operating frequency out of the
+	audible range.
+
 LED sub-node properties:
 - reg : LED channel number (1..N)
 - label :  (optional)
-- 
2.48.1


