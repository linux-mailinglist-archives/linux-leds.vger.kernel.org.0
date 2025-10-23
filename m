Return-Path: <linux-leds+bounces-5861-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D47C00C33
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 13:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95A004EDB91
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 11:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C14130DECD;
	Thu, 23 Oct 2025 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="k7h6MOsa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093CE1C4A24
	for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219159; cv=none; b=pjPMyFeRdAG+OzgIQ9kvpOdGVas71mVENdSkuvouvNP9kCjiZ/nNbUSXPXNgDRD+tCawScCuZlV6UTkAv9Dwpoa2J4sOHOy1h8vSARhdfYDD8MRc0PuXs76pfGkcjFkRninAI1yzhrRdIZF9HwpzGbatR4NsSixUSVZmzf0Uwb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219159; c=relaxed/simple;
	bh=g+3CeFyje36vUYiPPwLlKha+0xvRznsvxy3KI+MrI2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFgrHZvq2gF7sF+60g47tmskDKnCFWblri3lucbTHyDrbCnqGC9fXsC4PJSrau5s6FT9fMUCAwojAVVPOXQ6CA03gBhcE/8bnIFv4Oiq2IFZtpaZ909DJ3kK2wd0YISMCGPfZ7fWCVV+C4vMxkSNeGcJ3HAjB+CPaxjzCPOUQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=k7h6MOsa; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d345d7ff7so57197466b.1
        for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219155; x=1761823955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDmWPTg7/WzUkcF+6ZlKfYsF25od0Ln4c+tVV2LpT0A=;
        b=k7h6MOsaOMD202hiBcaDQ0SqMtcXCNh/RCsUmN6q486K68eJwO7MJYW2g3+kBVktMj
         +mntqtWE8o7/tdXODOJW/OT317Z8ZJer1lqkZ74ke3FOWEmGUaGFo3403vFQDccmplCK
         /ZF2Z0z+LoJkFD9HxtVenwX37MShXoqH0UvxsAktcoejIkmQqsOyBNHsLgHWX2DWEiZz
         OFl3ogWByE1XBjVFtdzDU/XzoYCiXCGCS+RBKG7nYrK+TaqxdEEyEFGPHyUlnTMbam+i
         bgqk+DWQol8yjcTor+JQ16wUQnKH4lahhg/w4uT6aHNZoAecipohogGMKW7uu4r7UPOX
         nAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219155; x=1761823955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDmWPTg7/WzUkcF+6ZlKfYsF25od0Ln4c+tVV2LpT0A=;
        b=tRXCeIYEo++8GWlL6RRJmM5KHE3gPq7QHeWiK7RKn7BDUgLyU5BaEqVnhEWxah8182
         +zYEbO5vkc16rqw/C5jxBgzilzc+SQoP51ul0xbHpp1FBp4RPrb6VTafdAjuHnzE+fRx
         JEJjr2IoVIDx56fE6DKerh6f42Jd62Tn7Ee/FNrcSGC6Z6ogGFspkwXaUd8tHZ1uZyCB
         7Wzc1rXXaYOrCJYP70cwhwWDQA5JXuoV/WASVb8Y2GLzAa1m0BDfKpvmdvNNret1rM7I
         uncLLbdVpK0ZIuTow35LobVadxKyjF+E15F05hg2yl23ALjgMxnpyUGZanFTgFo8pr2g
         oudQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzTZdkkGCxObyvz9Lrb0NTtjOhGyNPO3d4YPAf6q18ifXVsB8cKFQzaA8Mec+mfyh+n6cYslJ2oQuL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+uPzsHWVsldK76W14z0JqO3fD8Cz24xlbSFYbZbGVPQDALCxO
	I55WZw8nYLN2gXtIsCKpdkqDJZd6+Kr5oTdEJEF4vXXab71LsjEz81nVC16pwqqX30g=
X-Gm-Gg: ASbGncsH6AXJMOY6a5ya80FJOWe1MpV7FQeWBTnqvMCd99W8Ig+LtcJOO7Kc0kWK7GK
	+SswaDozCVQmhGil0I2sTrxeMxifwwtrUg95d4eck47YXWt4Wuy9J37jbYoNQR3rwup1gBjf03j
	xEaesH63s1fo7jLJbcoAxdqI8rewx/a8q/iiKomja7h50SFgRNezi6u4pzAd+Itj85xPMCu1le8
	K9zU4d+AmnXasnL/OItwzpXEVhhHb4QIY5VfIk2Sq+NcPNx7P/niZ44XI8Q4/Q7hFKF90D3/9k6
	kNE+LZgqLekZs62Bz3/C9NSqkBdZDrVy970/JELNcHlyZQkIXx+3X3RJUtw/CHbg46SEkAjGEew
	Jxi/LtuphsZfa3s0kGHHSWfH57ovDG8MwB/QKjrRZT5RrBU4eCrnivmEj5z+NaqtIggn2GlPWka
	SxmGxMoWMEOsjK2sOpVmHZVrHoLW9exYEXdvMzXD4b8cXk9oYLWaVnPe+s
X-Google-Smtp-Source: AGHT+IGyvy+vosOGhAVyW26FRy5VuLmJAby6oQyCi95CiOh6ji/6s6+Drjmz7GBaGHKaPJ1tX6zb6A==
X-Received: by 2002:a17:906:fe09:b0:b46:57fd:8443 with SMTP id a640c23a62f3a-b6d2c780045mr842584766b.24.1761219155404;
        Thu, 23 Oct 2025 04:32:35 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm183087866b.72.2025.10.23.04.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:32:25 +0200
Subject: [PATCH v3 1/3] dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm7635-pmxr2230-v3-1-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
In-Reply-To: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219151; l=888;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=g+3CeFyje36vUYiPPwLlKha+0xvRznsvxy3KI+MrI2Y=;
 b=j89EwbY2JAhGXJpHxxGsH6u2oxbgZtWs6paN5vbiIuiZHuJEhqK/8I5HYQqEYX6szI52SCm3Y
 Da0QHu8QSSpD5Ppa/++qNNAHGINmzpw9AJwY/tzlF50tZIr7ncN9jqB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document compatible for PM7550 Torch and Flash LED controller.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index bcf0ad4ea57e..05250aefd385 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - qcom,pm6150l-flash-led
           - qcom,pm660l-flash-led
+          - qcom,pm7550-flash-led
           - qcom,pm8150c-flash-led
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led

-- 
2.51.1


