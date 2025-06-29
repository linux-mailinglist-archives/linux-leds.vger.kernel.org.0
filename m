Return-Path: <linux-leds+bounces-4921-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B348DAECCB4
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 15:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BB57174D60
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 13:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344092253FB;
	Sun, 29 Jun 2025 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUUmySfv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958D2223DFB;
	Sun, 29 Jun 2025 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202014; cv=none; b=FS+mDhrpKgXb5V5SOiR1AL54X+Wo3HuSj/H/+wLn3OQgFW+bEq7PmZ456QC7ZbfThQhgLtEdfSANCeZRTSQr4ixZ33ORP+oNLZIcvtdSR8K9kSv0f9joSAaS4+IswhHKUelZ0Ncrh+neh7gEX9o7ZKJT7GNBjFLkSEVWRMYWNZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202014; c=relaxed/simple;
	bh=v2XAzjfgoGzkdFNzMifDiw3LW48guo2c5O2/eNjtFo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0kMdfWwJxJW+Quz93H8WoyX1u9C8HZTBzhGYLwfp94BZvjhGYNcsxkctJT+65h4bH8TTrTexPbqFnyPWv4IW8MpAmW8GGsY1CEYY4rlgARV0B5XnSXWKl+m5Rfx+DHly0TeHO02j72L95VNEKxckRnB8aZU/Wr4iDDnQXsuKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUUmySfv; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fabb948e5aso16380066d6.1;
        Sun, 29 Jun 2025 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202010; x=1751806810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwEXumjeSgSKL538gxbS9ghqm2KZDoPQ2P9+gjK1hDc=;
        b=iUUmySfvg9iODYhoswlYNGotxYoC7JxQO43bONQlSL67qk6l1TRyLs40s+ykBHOYTf
         /1IWehgeGUdJJe8hriXj0S+jcX4ilK3i0r25guGm2+hL4KQ9ioG7qHHCxq1bWaYfUB5s
         NTX09UcsnQUjlMY+9X85FYI+PBloTcX9qh10fqsHmnCIrYrBzAR5/7mCsskiODDV/qkN
         M/Lr6BbxZhM6Yj27yZqK16Ww2zLzL3Kj4ydDWC211RL1oEhAH97C6ocMjSSitei9bnJ7
         O6HPYS08uEiv1KgXBTnmWTo7HSwqsq+UgzSCqxz8D/3FCcflct8ZL5Nk9pCHRTS6YT4r
         tA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202010; x=1751806810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwEXumjeSgSKL538gxbS9ghqm2KZDoPQ2P9+gjK1hDc=;
        b=toFI8anx84LhMqWm4kWv7a1Qy1vOxemWuF0FovRc88nexbB+3PZoP0Bq/N0f5WcgYX
         w5DvGmGwpMauZr9ffTxy+ZCmX8QNN1lpP3KtIjNSq7Rao6TMqgwZ9Ai7VMIymxW9EwoB
         dmI7kRfFQWF2xC0wfnoNQHpOaTroX8Qd2Zb7pFZCXtswRdo0qQEVUK0qFtu4x5Nu8hiq
         z13hXJP7jC5oNumCj3w0xi/L0YGZBTZV70ZXi2WCpzXrdeQ1a9fsbfNVXc66FuhRUJGO
         yGf+74eUyRT2W37znmwBWh9TcL9F+eQ4LF/tDJ51pmNWwXCBn3upvpq53Q+7775YC8ki
         9ASw==
X-Forwarded-Encrypted: i=1; AJvYcCXE8IrgPNd/LJ/7CxUt+Cs//pNc1GB4mHDQvZjlvz9am/u/bmLBcMqSIZL3OVl5EX3mOBpp3MLIryMdz0tT@vger.kernel.org, AJvYcCXGLskp94aN1XmtsKL3qUD7PpMo1q7iMYLFDcEh0swBQY2biXD2N7DLaEpzyDvhzq8SWqC0C0/2T8netw==@vger.kernel.org, AJvYcCXZlEauV64vAn55vRHUoCxsbwPDKRuboUQKt7cCjt6KR5U1r1Ka4+0ZotVy0kc5gXG7OC51vX4zY5b0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl7CPxw/BiYrREMo6MCsSkjDyVze3iYQwdtxfs5q6cyIuxW0KM
	Tv59oENUM7IopOdQKApM0lGzoEz83PqIrSY2ZwpRJdG4h5/JVKIykiWr
X-Gm-Gg: ASbGncuKtu9hz9CctPtULgXa1qYBLWZ06zRvqocLwUAc+NCSoq8NVM8gOLd4wD+z2Mc
	i5wzwZuOIcxiYzkiS8ET5rrYXK4Joki4Bcd7kDJPQTyqYGRb/uyKHKMlwJY/hphhRgwmNtQw62A
	D2mQImbbZaTB+OqLz2i0nKC2C6XNZchRKDM+a1lXMrEitZjltKhZyX3mz4Mz3wNCMRwtuf2P7DS
	mI/HvSnpTL6gYKouiJBeUDgjyap8zioj9udvzM5KdOBjq7jRihm4uVs8lVItKTNQRtdBI4zbnuE
	/7Zx26M+Uh7uUZJHhMIUs7mz9LkgiNUFmO1togxypAMLKr83ysnYDPfACLjcTILxKwwK8nZL4BF
	aZxGL54H7G8XIlIimau7sMgYRguBaYPKm
X-Google-Smtp-Source: AGHT+IFjqSGcyWn6dUYeWy/vMHme32wBpUtVRfJxNvO1b0o4yAx282ALGzUc7eggW8k2CgOt4WxUvg==
X-Received: by 2002:a05:6214:262b:b0:6fa:c46c:6fa1 with SMTP id 6a1803df08f44-7000262377amr169329956d6.3.1751202010228;
        Sun, 29 Jun 2025 06:00:10 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ff81088cbcsm43946886d6.7.2025.06.29.06.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:00:09 -0700 (PDT)
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
	zypeng@titanmec.com
Subject: [PATCH v2 2/8] dt-bindings: vendor-prefixes: Add Titan Micro Electronics
Date: Sun, 29 Jun 2025 08:59:52 -0400
Message-ID: <20250629130002.49842-4-jefflessard3@gmail.com>
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

From: Andreas Färber <afaerber@suse.de>

Assign vendor prefix "titanmec", matching their domain name.

Cc: zypeng@titanmec.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e4d251e71..d02615496b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1550,6 +1550,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^titanmec,.*":
+    description: Shenzhen Titan Micro Electronics Co., Ltd.
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.43.0


