Return-Path: <linux-leds+bounces-4922-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB8AECCB5
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 15:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6317C174D5D
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001A12236F2;
	Sun, 29 Jun 2025 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqRKJ0mE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ECD224AFE;
	Sun, 29 Jun 2025 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202014; cv=none; b=ApQ5XXnBVD2IJ1GH2AyHyvUD9hxq2uwuhI1k0suGwWnZDwS7NPb8246nnGHmx8Yn4BOEPFq0SEPW8nMFQGHG3dubRZYsQxTGluw8Dnw14XyaCibvb7xk1fRWkBbTx5AiE5aeqewTNjOcCDuaf6Qvp3dWoHIr6v9glVxSWHs1iy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202014; c=relaxed/simple;
	bh=VPXwInonU9FGvXJ0LXgLGZ+V0gSc7vckQtgi8zBOXZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SoE2KWb7ByU5Inv4pIMbPJmE7Yk1ELEeNVWJU1W+yqwzjdpGiTkCxKynvmv2J7Ku3oB3SZx3tClsJDS7+VQytw0m+S/giurKSYcEGoVU8nI2/fvEJ3n7bRHzPwKqsn2Tk066QPDjVOPsEu9qKA2KMBzhTVjgV04hNHinAt+MnTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqRKJ0mE; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6faf66905baso16111636d6.2;
        Sun, 29 Jun 2025 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202009; x=1751806809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IouU7a5uPzIAqGhqgxh18KDCBsLsQhNOKT3uXf6rrdY=;
        b=bqRKJ0mEZNOT/UAP0XhlYtmpxWGtcDYOhrvGuWzEzYhs3NowSlU8tHgVFJYkPW37ov
         Nq1qd5JuW7hG2K7fJJrqCiVk6d8jzVUq2/PccWVvHSbpWfBGOllJTKStPaFnaDnPo9pW
         SGG4ifE8vru7+OWMHaXImbkc5tEYfO+G9Tx5w/pKHxldpYSOxg+okCvkTtyoQ5UZWJDN
         sPeVa7RpCOLpn29EOcIddRa2leMQpwx9t9mvks+OaduDPFXhLmHperdj7GjD2LtkLW22
         J/Rss4p/VLNPGa5oDwsls1CbJXrjPnWMWMqCNNWfB2uveBzdxLzKBYPtKH/Dq4uvXIou
         S29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202009; x=1751806809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IouU7a5uPzIAqGhqgxh18KDCBsLsQhNOKT3uXf6rrdY=;
        b=sVm8Ah26FWNsWDIocWcSB5R5oB/vTeQsfogU4YBlTTwBBGXOlXLppiNSFwLaFSuvLW
         8sMdqluSR+z/V9+YUN6m+uswn3xlqDzTK+OGOlFsfvfBsoNevoaj1X6N4T68oo93K0mx
         dnDIa/8E/ea4pdvEtbeIjYD5GKA09Ir57Yl0PEwpid08PJly0tbtaTdaEXy7b80bMVAE
         kP0Fd68MXs5Ef/D/ylLDoGY36FhSEvoovHsWVSGrXnDFEaJg55dItgKrVsKyUwqmAirt
         LZDEQfP9ONCxFQtLWj21qxiiBI3EeS6UMRk/3ytcWEdxiegrEWP2xR2TbC9hViBXDawB
         W2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeplP3VQm7bdylCrfaBC5w+SRR8jRk7l7ntrCuBxQ8gKm13NFugw3CZqE5RVxmyRG+mpKwinQBSzKHxQ==@vger.kernel.org, AJvYcCX/iu2cy/L6RRNbw8cm3KLjkhmeRigLnetX5OVb6ToQ//a32Ic2R3huRIruPHbte/X0V6lnGtgPX/Qt@vger.kernel.org, AJvYcCXGOB/vRGwHWA+6K3qWIBypk/R40o9OOH61D9/JrH4aYRCB4Vg2K3QvRMYua9NymX34uTuiwo9odFN4wflS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4c6OtLHSg8qxv2IvJrF4qKDoLZ0qLgne/ncP2b5GciLk1LccE
	2UmH3C4OFH1bHLF9eqAfqrYo9kEYUbtClQ4E29LI8OUDV6iqax1BNNnB
X-Gm-Gg: ASbGncvHC2wm0XI5lYr5cRCL2fTojHvN7+xR5Ju0mZ87L8FDCUFs5K/BOWI6qRoN/8l
	ZRGqsL0Ewa1tJz44Cp33pbwFZ3fYWCHXLCJL4+ynh8gW3KTsRf0L/s4H/qKmwh/CyfouMv9lUyX
	1k+lB3rqT7eCdiy0DsFPEmpDNvfjIJshVpokZyqXK3ZvLHFH+2ne4JkSAYlBWm2M9IULviJlrlT
	KgtH9i6uqwTcx0fbzvGx0SaBysRUIJc0V0aRySQuRsfkaYxNIIEzNEO4dX7D4igaMJoIAiuhpYQ
	D+LkDhMNRcCPWRMbk2pHd7FXHY1AgRSO8sRZDA+l1ftS8HLdZR8FFlKUq7+mQybr7YIFi/G3blS
	Rnu30S1Z3t9TZQ5axNhmnSGmHecvx9Jw1
X-Google-Smtp-Source: AGHT+IEUBwDEUQzHFjFXBnrjMkyje4gXDohI4wRYXdcnYEyAAYqGM8UanERI78bbJxoogKIEErt8yA==
X-Received: by 2002:ad4:5c88:0:b0:6fd:ace:4cf0 with SMTP id 6a1803df08f44-7001378c7c6mr120998726d6.24.1751202008458;
        Sun, 29 Jun 2025 06:00:08 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771b883csm50895216d6.39.2025.06.29.06.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:00:07 -0700 (PDT)
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
	sales@fdhisi.com
Subject: [PATCH v2 1/8] dt-bindings: vendor-prefixes: Add Fuda Hisi Microelectronics
Date: Sun, 29 Jun 2025 08:59:51 -0400
Message-ID: <20250629130002.49842-3-jefflessard3@gmail.com>
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

Assign vendor prefix "fdhisi", based on their domain name.

Cc: sales@fdhisi.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3a..9e4d251e71 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -531,6 +531,8 @@ patternProperties:
     description: Fastrax Oy
   "^fcs,.*":
     description: Fairchild Semiconductor
+  "^fdhisi,.*":
+    description: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
   "^feixin,.*":
     description: Shenzhen Feixin Photoelectic Co., Ltd
   "^feiyang,.*":
-- 
2.43.0


