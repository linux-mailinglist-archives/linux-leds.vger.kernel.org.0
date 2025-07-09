Return-Path: <linux-leds+bounces-5024-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF6AFE828
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 13:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2715C5A113A
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 11:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D6E2D7816;
	Wed,  9 Jul 2025 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p8rJVdMv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978F42DA75A
	for <linux-leds@vger.kernel.org>; Wed,  9 Jul 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061614; cv=none; b=qYBHhSXMTAkt6eqOf97bck7wt2uo58YVDpWivHwvkt+gjqrzZU9BAVbWfEMqjiGWLPqZOFfuRm/+TpC9Z1ujLgYps3jVa3MLwExdHdTA5qr4uHMDzOwP7DG/8UCt7Y4m7HnmBXphWWIxQT8UkR95mqID1hKKJanCNUnbCZhb5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061614; c=relaxed/simple;
	bh=q0f4Kt7CB4b+gGrecsM4LRgCLVf+5IH0ECZJniU0Rsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juqN7Y7oXX1f4KGK+Is5XryukKf7JZmsrvPORFQji/LL/sULm/jkQz/GCZoLNIzpxMYaS5klcMXx8NMGLnaWV/QKK3gZkDB/j8L2x7zvnz0+0+YyQN2qkSslVDUU5HDMK6PTHu5pdHlXbnZeQND8mT+inLdCWfm+in0YxbP/JT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p8rJVdMv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so1146205666b.1
        for <linux-leds@vger.kernel.org>; Wed, 09 Jul 2025 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061609; x=1752666409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mqaqbmx0aerFIcDameI20v5fF8h6z9wFPaN8VWktnrY=;
        b=p8rJVdMvQqD67raf2TgUtXlA7ZLdTBcyLrQ4CCF4cOj8UIq6S/Y0SYJPVaZnf2kdkB
         /8Ov6vbmgDl6dn1F85LaR0mA9V2QeaqYdtOffSN8Y5H03HaoOKblgHpsw5VzveRzi1Uc
         tRzeM+X1Fzi7My+hGQzGOCg1LwuaHXJI0JACfIwj77TIeyc55T33+UiXzEkwC/0S+uYF
         32G+/XlO9iXwBliesJUur6YRBI/PRw9OcV6SeOvdXqPJr7MCbjd8EeLBjnHLMh2oTEei
         EEom6mLKUji5guo11YFku3GFZ2hM/Bcwjm3PU9seRzIwDbUFX4C567Oir0a7pqf7uRr+
         89Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061609; x=1752666409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mqaqbmx0aerFIcDameI20v5fF8h6z9wFPaN8VWktnrY=;
        b=Pb64bkwvE7iKcdxpCfRKfMJbVoNMiZ+KrKzYCZVc+mJ0qqvPx92bi9D7bIrWudyPQt
         zfC/Worq5lK6Q12OvZlkQcSmCZwjvRPThCV/uQ6bnL6Gpydutz3I95izFhQxR2YTUWJp
         w2L39foZbPS/FolOQI6Tih4LOG3GURF0PJDYZLDUbnBsSLMPGZDCX+EZ76Wdb9vpK9ek
         /38NDcp9eL1hqRoX+u96l2YGO0ndAxapk/T1zdCI3BNdy72Fe89MrCJBI1S/N8HoJLlL
         BWL4lJggviF56GhuHIgEJuroEshrx6CEq3O+pIw3GRqk5SxDxfPI7biGcc0Vk9nQMO3A
         F/HA==
X-Forwarded-Encrypted: i=1; AJvYcCXQyhmwDKEkYB7dpAwoo+XiKlblcBQb7hcQ1LrXX365DBqg2EJDrfE8MfZkLDUHREWYytyIquTQijN0@vger.kernel.org
X-Gm-Message-State: AOJu0YzZvYTa65UGdOLsXz6U4jnKCXfWkb4TIaxAjIAZ7XO2dpyWDUq9
	FWsTOUqyUDR2QTgLiIMg7vyzg9Z74mr3ubh0b1Pa143tbankZhJk8l2PAGTxgTGx3PG1nCxxbo2
	lmeYH
X-Gm-Gg: ASbGnctep3RQDTutZomN3C9mdDtGvm/X0wXsVLYiSqbN6bZWSTrUIuNMbSm9BjyJ1Nn
	v15QDgirBNyCvE8JWbTT48WPW3q6T+AmjlmERn2gWtPSHs98abdLqkdXsEUbPfIejMDMxi2W7XZ
	LAxrWTZgAmvq/4LiccGYmxwyCzhpMTEtpVUJrys3QAQd0RyJ7ILFQZSv2loQcQQdYRyOr3Wi0Fl
	9YhEQSiCwZ5NsPcrazg0EonGHNIJQ89bqZZt+7V0VSWwb/X8hmcB26potMNEzAVS1VvRojfinp5
	PeXf8Ja1OpMBUaXDzMfR16w7sSwJGkkOL1L5uJ2RFE1TIM3PrQsbYiRMaY0+AZj3tqdC4QbNLuE
	DEJn+gth4cxzVAN9EHURqfAWvAae13M0u
X-Google-Smtp-Source: AGHT+IGe8ifQK3zKlm/INbNEzwNqGtIX1dU/rXl+zkSfPoXCoNmj/1eNhP01t/aTJ30bcZIwFGeScw==
X-Received: by 2002:a17:907:a42:b0:ae0:d78a:2366 with SMTP id a640c23a62f3a-ae6cf64081dmr276746366b.4.1752061608819;
        Wed, 09 Jul 2025 04:46:48 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:35 +0200
Subject: [PATCH v2 4/5] pinctrl: qcom: spmi: Add PM7550
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmxr2230-v2-4-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=1016;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=q0f4Kt7CB4b+gGrecsM4LRgCLVf+5IH0ECZJniU0Rsc=;
 b=WK2/spcTGkOFsA+I8ICoknzdQfJloKrmYS1KluZTLN+wJZEx6G2GjwtphGdFhyMYagAJEI+dy
 z9OsIl9SHyIA8x8M1W+KJQK0AAL0iP5G0eSLD+npYZDzmIPE5SPQ1MJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

PM7550 is a PMIC, featuring 12 GPIOs. Describe it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index bc082bfb52ef480941e1804f1142496e1db6413a..da62eadbe1e97bde0bb56db8c07182ad5c6a4162 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1206,6 +1206,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm6450-gpio", .data = (void *) 9 },
 	{ .compatible = "qcom,pm7250b-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pm7550-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm7550ba-gpio", .data = (void *) 8},
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8019-gpio", .data = (void *) 6 },

-- 
2.50.0


