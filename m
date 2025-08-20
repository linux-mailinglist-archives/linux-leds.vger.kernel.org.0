Return-Path: <linux-leds+bounces-5260-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56717B2E255
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 18:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 439457B83EE
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 16:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CD832BF4D;
	Wed, 20 Aug 2025 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAft0SvA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D726C2E282E;
	Wed, 20 Aug 2025 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707486; cv=none; b=SDyXni0LDzOP9X+7YyNvYTpPkAoZdFd22w8WnIoxgMDCR15WY1tzELaC1NUIKhrMIfzQ5X2lb7DHFN73PiLWLkCpmHqyvAwbGJb2mqvtB5QWMWiAv5PDVXo6pEBS7lDPjolsWH2K4xMQ4bWvQrW/kmsrF/3bko8E5G1O7gaZyvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707486; c=relaxed/simple;
	bh=UJfS8XsbtLkYyNyl2nPoja3lTDj9uwhXQ7vLXYdofCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QdBhGKACI6qFFM0Gx1zSet+0P3lZ8yhPYWXzzC1GV513v6mX3OP2CO2e57v14+NMC74hV4QxmWu7FnCuTIualZ7crPZ3Ptyd6xFhnVeu6L5Y53/i+GCTA+0oIF58DZdSqaW70Y9a3H9uNgSIXKh/coKW/AaPObPTrAUk29q1RUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAft0SvA; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b109c59dc9so1008551cf.3;
        Wed, 20 Aug 2025 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755707484; x=1756312284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXM30wff4XIHChJ3j9G53oUhXmUQwKFOpC/ECdliRHA=;
        b=ZAft0SvAVfP7C9JzXbdIs4Cgpzgnx3O8HhJb8qTAY4pwLnG8f+NCfoWeIEa95kkXw8
         3kQlaKx44L8f/IctIF/D9yL3pC6g3dhIOEt3c87JnrE60aruEkv1ERyJGpSpUQRB1+YD
         wyf+OfET03WcJy/v7JZrp4QbBYg0NEQqezsgMF9tERjTtuOZwtpKdmbvnklWrZ1iCdbA
         c/2zCFZGEDmXCnBi5YAwQNpH9Qli+p8h1WphqvL5ttXcnd4END1dCmxgvvHfX6B1YEFp
         d9/a9J2oG+CbMvtiLuooJ1/02WKvKsQFAgxWedK0wtSjOu4Lfp4OtJhOvhndwpdKNEeo
         xlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755707484; x=1756312284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXM30wff4XIHChJ3j9G53oUhXmUQwKFOpC/ECdliRHA=;
        b=f5EV4hpTAfSudg5AZvw1NfNlLx1B5fBpg1+pJy02ICumxNMkTFPbcTSysGm8N+ImBk
         E9dohf0orQ+xePV8Cqy6XsZQ4AuReih86IdLn+AML08CbnL1z6A3Arn0vT0dSshCyllQ
         MpsJUgqUdXicqrEwV+5lslqbD1cQQXqhSRQRS+DE7eaUEeE7xuIQ96ccKkglMygDeTZ0
         mDV8/eq/zx8txFSDIaEjoUzp2ClnKslIzH0dVbMVOkeAbXkL/IaYEDAE0CVSvh2IomNd
         bJhimzJIUR8gk1Il8S/Yr3T4Ik1pAo5E3db6rzpCgjaUYBshI3qO4OQqpbx41M9ktSe+
         eELQ==
X-Forwarded-Encrypted: i=1; AJvYcCURJ/p5N0TjefA3td6fSRv34sVZBZg103dQqKHPkWhotqy3vgtHnLA4WcpDz3g4J/nqD86EbLuO/t6Ceghr@vger.kernel.org, AJvYcCVI5jwqkr1Pz6Ohsnhr/srxAxlPF3UQVgLZEs2nefWq/dNsuGRkcGscCbJETlMg5il19UUdmeoL6mC8@vger.kernel.org, AJvYcCXmMO/A5fvhjKeZBaEbH5S6iiUehmDK9pPeuJOtg3ftP+A/IfwrE+SFlcyeJQialK+26utfcExRfoClKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRTU285AYLDaqN6cCQPaR2iqoUaLjYfzmm3a+XKUigC2FKeMIo
	LCZFWWGhq4AVOCgYAF9SFciomJwoa824cbIuocvSPSa/S9WkclteZR2mTJMKueI6
X-Gm-Gg: ASbGncuRbZuG0yh7syb8Vv+IjImlGjXxuD6L9C5wFTxKlJbbjQ9wvPpIDt5+7nkFbXP
	RdagqZVKIc8zXr7LR3ke76HNZV4EKUK9H1PVH5U7WUjjaCFngippk213x8rLBVj8BM7VlSZKSkO
	PWPUrjdFaED97oetpO6QP5OXy/F0DI1k7v0cMxqeg0O5V0fl8mHH5X/LkzKaJEe7jRj1N7vIWUU
	AD1rjiMRjTTXdh55IwM6ClTR9z368y+XnFFe+vs/wXANARXEwuVX4G4RCL6O8o+DHc7dLUdhrOf
	nLIbtv7e44aEXj2Yikz8uu1+pH0JmDgyHTGhSHHp3i4xeGtHIkzhpGxos1pTZtqTFHBb8l48vDu
	9mmmm45g3sH+GmxfGlC3+YtwVmNmRL2ZEc4URTCn0L2pAHbZi3GQlgjzcEc6qS4UKKg7T
X-Google-Smtp-Source: AGHT+IG9C1PRQ7PdZF1ZiMg73cQhIVvN5bdIL/FxGPGt/C9F/8Mpp1lbimjL6Pcpk83tkcRya/4o8g==
X-Received: by 2002:ac8:5812:0:b0:4b2:8ac4:f089 with SMTP id d75a77b69052e-4b291bfeca7mr39194401cf.71.1755707483496;
        Wed, 20 Aug 2025 09:31:23 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e195e49sm982452485a.43.2025.08.20.09.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:31:22 -0700 (PDT)
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
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add fdhisi, titanmec, princeton, winrise, wxicore
Date: Wed, 20 Aug 2025 12:31:14 -0400
Message-ID: <20250820163120.24997-2-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820163120.24997-1-jefflessard3@gmail.com>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add vendor prefixes:
- fdhisi: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
- titanmec: Shenzhen Titan Micro Electronics Co., Ltd.
- princeton: Princeton Technology Corp.
- winrise: Shenzhen Winrise Technology Co., Ltd.
- wxicore: Wuxi i-Core Electronics Co., Ltd.

The titanmec prefix is based on the company's domain name titanmec.com.
The remaining prefixes are based on company names, as these manufacturers either
lack active .com domains or their .com domains are occupied by unrelated
businesses.

The fdhisi and titanmec prefixes were originally identified by Andreas Färber.

CC: Andreas Färber <afaerber@suse.de>
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47..9fdba2911 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -540,6 +540,8 @@ patternProperties:
     description: Fastrax Oy
   "^fcs,.*":
     description: Fairchild Semiconductor
+  "^fdhisi,.*":
+    description: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
   "^feixin,.*":
     description: Shenzhen Feixin Photoelectic Co., Ltd
   "^feiyang,.*":
@@ -1233,6 +1235,8 @@ patternProperties:
     description: Prime View International (PVI)
   "^primux,.*":
     description: Primux Trading, S.L.
+  "^princeton,.*":
+    description: Princeton Technology Corp.
   "^probox2,.*":
     description: PROBOX2 (by W2COMP Co., Ltd.)
   "^pri,.*":
@@ -1567,6 +1571,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^titanmec,.*":
+    description: Shenzhen Titan Micro Electronics Co., Ltd.
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
@@ -1724,6 +1730,8 @@ patternProperties:
     description: Wingtech Technology Co., Ltd.
   "^winlink,.*":
     description: WinLink Co., Ltd
+  "^winrise,.*":
+    description: Shenzhen Winrise Technology Co., Ltd.
   "^winsen,.*":
     description: Winsen Corp.
   "^winstar,.*":
@@ -1740,6 +1748,8 @@ patternProperties:
     description: Wobo
   "^wolfvision,.*":
     description: WolfVision GmbH
+  "^wxicore,.*":
+    description: Wuxi i-Core Electronics Co., Ltd.
   "^x-powers,.*":
     description: X-Powers
   "^xen,.*":
-- 
2.43.0


