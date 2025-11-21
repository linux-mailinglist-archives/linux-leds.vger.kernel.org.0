Return-Path: <linux-leds+bounces-6274-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5CC7A6DA
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 16:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 249E4385C11
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 14:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974F833711E;
	Fri, 21 Nov 2025 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzSVmZXC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A02BE7AC
	for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737162; cv=none; b=CUd16yu9OAf79r9CYqxsSaA+wSh6nPALCJmY/vA0dLanHA7vutAaGcyZIzyiwKP0pYUImOMX+JMjgbCDjblYzQxp4YosJ3Hj9+q3FhbrgaDGJm7MVmGjZ/q0Jb3S1+8HNB0kHqJ88dVK85ngsk3l9Edjpgp+UzmO28m0klVpsjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737162; c=relaxed/simple;
	bh=9YhlRXNK/AS0U6vPrcc+iqniROeSUye2gI5ifHJfW/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E/sHDommsPWenAjrlOPrTI7DfjB+PSc8UIKY701OW0RBP/QoX8pQw7rZ5LZzncWumT23ETGSCRoD22KNk6oBcjW4fCZcgpj/CNuiRigFW1BNU4YL20dti9FhB2mJJpY/Kq2i8ZoLNogGECAOh5qKUuLrJ9chZLlBgwVusUr4lF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzSVmZXC; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b1b8264c86so202581985a.1
        for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 06:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763737157; x=1764341957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8ea4pMOQnhPykgGqMiIn66ht6L9UZRItA8Bf1WZ4Jg=;
        b=MzSVmZXCXIRXWWYdnrOA/NJqPY3tg5EYOUbQKZ3uk6DuyY2iglU4dm3vLYvmh7K9OA
         0MRDG1cQbAKK7egRpdDKZglmJP10HtMlUBXDNLnRK0ejMwU09cNvQmUBDkzFmXZdcMp7
         /z3dkbVejM40F67Ewru1WW/ZohP8kwkVQG+lWn88Yp2YDKBGGhexwTXXuIuqjqn8wX6p
         r//9Mca2IcVqoaPvYwN8PsSbJJD6RhCVnFtmuF+fuXI2cdZwxWHRq9CHaY1CTUgYCaMc
         dVJMiQrsaVyupAZal6fH+yusq/QAe8b5Aju1mSchD5z8jj+LL1KSgpfTk6sWP+VAOQ1Y
         m3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737157; x=1764341957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8ea4pMOQnhPykgGqMiIn66ht6L9UZRItA8Bf1WZ4Jg=;
        b=IZLfqyvyPujNsehdFziqnVUoiu1b1RARImHLtsF5TnPk6BREwyCdZQwNuT/75Ut6IQ
         5w0i98FJLzMRfwh7+NlvIHvP21UBfgY3nIM7O3S98bpDPFVDVou+XXv/hCkae59MStwr
         GbpNCa9bG/IkpFmD12VPll0dklDnPe3GxErmzBQuz7AMNN9BiMy1vBJAwrvxKOdWJuO+
         /H8b4u0JyNh69GAIjluNCrO6ICfglfHWm3rpKM5VxU0D2lPbmyi2Mf4eEb0qfedsSvFk
         PyFHYWo5ylROJZcFwNto7NJwu9fEXhdT7CuG2uI23O3ptHB2CjqUx1MPYRIDsfMpJt47
         fiVg==
X-Forwarded-Encrypted: i=1; AJvYcCWqE3/1rId6OHlh+90VTfAS8/f8YeBfF4KBTfCBk3kvocONEPw3ELgOiNSO2n8KJ0DS1moYfQMr06GB@vger.kernel.org
X-Gm-Message-State: AOJu0YzbN+PLsazgRqcZaF3stWHq+KBOMFe7rcLYlp8XM3E0AoV1bllb
	26QmaRUtbtxl6jA1/cQmzP452rEVI0W66MqDA2YD81qjIv3zrtIWWho1
X-Gm-Gg: ASbGncv4fY/8V2FNvfFDgU3TpJqmDmGM04uOhfTrl8OHBSNXOJRw2eq8bs+haGl91QL
	RvyHym6F4YKG+lueYFC0KmjGqL3dGBG0kCbFDk3Y5JWZ5TwZcmmuRxB/PgHtvO/jePGUsCP3Gre
	w08ALDG3++A1AkiVPG3Zd0WfOeSB+PM6U/i8YsLe/iqeXhSMsWKxTAIVwD1fzbeWAMsZaYYo377
	oxMCT7vI+Le+RO6w5MF+xQyfz6WFliq4lgH0PN5qpekG8hH9OXN37Tk6N48tBL5IyeQ3zX9zIz4
	vo9aUwb2fAmWAzIBJMD6Oe8QWjbTSQuSt59FLCkUfvp25wWdXGilAyCTUVTDhlGy5Kms36z/j3F
	7qx8Vjf/migPGT8fUz3sURGLMnsMDWZQ+ldbggvGbIfKNoqWeqMuHKmTc/Bpe8WCuy4VxOx+xnl
	CFMOAPFT5CXiOam/T+ogQdlyEYrKj4SsTrpftXv2xyxB4i1EBqdLNtetIN
X-Google-Smtp-Source: AGHT+IGCuldQWb2AEu8tnF23ocVRpmUPhz8HWemssH2EO8+OXTAE32Y7Ibmho+V21o8Bh6+9GtDicw==
X-Received: by 2002:a05:620a:4593:b0:8b2:74e5:b13 with SMTP id af79cd13be357-8b33d1d1118mr302903085a.32.1763737157429;
        Fri, 21 Nov 2025 06:59:17 -0800 (PST)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295c3306sm383882685a.31.2025.11.21.06.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:59:17 -0800 (PST)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: leds: add default-brightness property to common.yaml
Date: Fri, 21 Nov 2025 09:59:02 -0500
Message-ID: <20251121145911.176033-3-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121145911.176033-1-jefflessard3@gmail.com>
References: <20251121145911.176033-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add default-brightness property to leds/common.yaml to establish a single
canonical definition for LED brightness initialization.

The property is currently defined locally in leds/leds-pwm.yaml and is
needed by auxdisplay/titanmec,tm16xx.yaml. Properties should be defined
in only one location to avoid type inconsistencies across bindings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 274f83288a92..f4e44b33f56d 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -173,6 +173,12 @@ properties:
       led-max-microamp.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  default-brightness:
+    description:
+      Brightness to be set if LED's default state is on. Used only during
+      initialization. If the option is not set then max brightness is used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   panic-indicator:
     description:
       This property specifies that the LED should be used, if at all possible,
-- 
2.43.0


