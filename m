Return-Path: <linux-leds+bounces-8310-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGPnKGBhFGr2MwcAu9opvQ
	(envelope-from <linux-leds+bounces-8310-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 16:49:04 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C735CBEA6
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 16:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3E1A3004F72
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 14:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3538B385D64;
	Mon, 25 May 2026 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWzhKUDT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7D6384CE9
	for <linux-leds@vger.kernel.org>; Mon, 25 May 2026 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720437; cv=none; b=tSQmb8tR/hSoX8AMgmC9R68pTNG7wWh5k+kUwzcBIukuh3zZ0ZLHGATBv1O6x7uoW7zI5D0qJkWVzzHjdlUWTzK/OD/TrCcfJ0gigF8NUK91pMIrgeJowNTKdmlRr+stAqJobePWg587knktwTG9F4NsQSfS0WiyzIqcElhOY/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720437; c=relaxed/simple;
	bh=yr/1+spXVlyoOEnPXkKwQNNmxgFyrMF8Vg6TrpaWpNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=trqS5RXmLKkoGLHf45DtY+dgsryEZfyh6I5TneTrpE3/xFLqa8Pb8bUE+4kK8ePl2kr8qsOLB4V6U0uLbrQsGBW0mbrY/tgZHWFr8RjLgBMRr7gv/zzeCOEkweXkFZR3RcXd2dWHuMqqKnCh9f7rG3uF8xWkGz55vqe3oGCTptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWzhKUDT; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-366139223e4so5828668a91.0
        for <linux-leds@vger.kernel.org>; Mon, 25 May 2026 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720435; x=1780325235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJLkAaWkaR/u6MnpMROmXCnK0KgC4u6HMrcHQXc6x1s=;
        b=cWzhKUDT4MDKwMF3U/26YHbGor/ejRGmaXsUZh49ZKgizDoqfXXuUDtpsAj7u23PTk
         xcj27oRzefUwu2oRnVRwrBINeuWIWQonbIX4zGWpwvl5s+NdJs71SvOLQoMFbCzPFjo4
         m4FH4jKS9IlGGV1PxjflOKpjGlbUeaFGGArcA9qMlhiwX2TcwRDbq3EAzxn76JAxlLSh
         UOTvC+dmUmr2DkYvh9oO1RTZ67d1QfQUUB0yStOEXBTUtnQcSEYowQ2cC0WtepneA7kM
         SkiBJ+JXuxLkBLH+NEw2HCkZz3seTL5hDT232LUV3AfSflcUJ4iXGVTmG89S/hHozHvj
         BcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720435; x=1780325235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJLkAaWkaR/u6MnpMROmXCnK0KgC4u6HMrcHQXc6x1s=;
        b=hm/FQPgDoebpTph8uypPh/hCMrKJ97QQl2SnnL7DGXy0FpzMYc4TPQfUdhNDPwMq/E
         mQe5VKbA344QuEjbeJ8tQh0PaSyug+CFSHvVSyFDWlDuVEBHoT0kslkw3eVpC/pLPlG0
         W92ReWUiYuQcHTaMH67ikaRoQLwtvG8Kdaaj4pC4vXVyzgzVpjvj/cfEx73/Yrlg080Y
         j9KcNeT1I47XbDHPZA7BVoXxqle2/jPzh7GTLVcloj2VYN8hQq8L7Ys10B8sJRxCOo/h
         z3J7LkrXi8VofIWmuc10fgRJOtdmte+x/WYPadGDePPD5mZbgjeRKq7iN48/3oKfo3cb
         IiwA==
X-Forwarded-Encrypted: i=1; AFNElJ+v9cEYU9DBc1tIid5+fDedBoQkxFXyOdqhL/rVwg65Yqa3QYre4TjzAQOeWzppRYIqPb57R4d1CTHF@vger.kernel.org
X-Gm-Message-State: AOJu0YwscsJMr6/w+uyvIDCGL2+fZ4HV+YsaXf/RbG+JCjrgHXqs887z
	YEnsfZFLImMDJc2YBGfIf/P9U4DOgeVhtJLIg+lu8M0WDw9MQWg35fSo
X-Gm-Gg: Acq92OEeveHVleV9yLDoe7kpfWbaL1n/c18NSc4OX8gjt5KxBULC6YMDyhVBJc5lkfi
	iqzE0PzMIWjmADDYnj5NjuHFDb0LRerF9vUuhEW+iPeneGLumj4GG4uas//wE0cDXq74WagILcn
	12uZauB+/RMMys2pG0ILMn+pXBf7/Nwg2sHmCktRZf4xeK2WDP71lAH7g/dUjhpsFyIVlAaoohs
	0SBOfDgE1VL5GfMlyo+Bag9TXM9Ez8ZkESLSREttQmabbJBOiZQ9T+RFE5WxKjFB3QREfwDZoPZ
	rpXt6cfStpVNoV9uUUHoJemR0txB4Loa8ClU9AGC3FvSqV0jo77WHGhiUXk4UrSvRQFlmBfzN2i
	T5oEVgpDx2mnVNu+pQ0pqox+J2sLBeohHkbpZLb7LQBmW/cG5cKFVsEiGSe+g2zOUG4JSLIxlhR
	FCR/qoyjShcH7PAFJE1qIQFSAicsyiNJ9+p8l/zDs=
X-Received: by 2002:a17:90b:1909:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36abe37ef9cmr4093720a91.19.1779720435013;
        Mon, 25 May 2026 07:47:15 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:14 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/6] leds: is31fl319x: Fix shutdown GPIO and update DT bindings
Date: Mon, 25 May 2026 22:46:06 +0800
Message-ID: <20260525144629.498630-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,glider.be,socionext.com,foss.st.com,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-8310-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,amd.com,linaro.org,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 09C735CBEA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes incorrect shutdown GPIO polarity and improves
shutdown-gpios description in DT bindings.

Patch 1 adds detailed shutdown-gpios description and fixes example
in DT bindings.

Patch 2 fixes shutdown GPIO initial state and removes redundant
startup toggling.

Patch 3 adds fixup to force consumer active low for legacy device 
trees in gpiolib.

Patches 4-6 correct shutdown GPIO polarity in board DTS files.

Changes in v2:
- Add comments explaining the reason for this GPIO line level.
- Add fixup to force consumer active low for legacy device trees in gpiolib.
- Link to v1: https://lore.kernel.org/all/20260508152435.21389-1-jerrysteve1101@gmail.com

Jun Yan (6):
  dt-bindings: leds: issi,is31fl319x: Update description for the
    shutdown-gpios property
  leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant
    startup pulse
  gpiolib: of: add quirk for IS31FL319X shutdown line
  arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO
    polarity
  ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO
    polarity
  arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown
    GPIO polarity

 .../devicetree/bindings/leds/issi,is31fl319x.yaml     |  9 +++++++--
 .../boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts   |  2 +-
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts  |  2 +-
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts  |  2 +-
 drivers/gpio/gpiolib-of.c                             | 10 ++++++++++
 drivers/leds/leds-is31fl319x.c                        | 11 ++++-------
 6 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.54.0


