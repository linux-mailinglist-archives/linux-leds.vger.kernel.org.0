Return-Path: <linux-leds+bounces-2950-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D898FE45
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 09:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB5241F236C4
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 07:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C3413A86A;
	Fri,  4 Oct 2024 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iGM4uBQX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17981AB4
	for <linux-leds@vger.kernel.org>; Fri,  4 Oct 2024 07:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028767; cv=none; b=bJMoAAJe8zYpFTbQddb88tS/0DENxCMdTauFB8SfFHVjH88MXuAfbePLaHOX1sRRV+PfWIWAEKyEDouvMALpu8aqToKwM3pEUAwmEevkXr/GtTUhRUuG9Gj/uOd2ogKo14JGra6O9j3uqEGtD9j5BPUO0DNOgZS1UlFB6/10SMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028767; c=relaxed/simple;
	bh=wWE7/0UXOpErdggI0e3WCup+fp0WFR4iS0PwL7i/ezE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M1MibsogpcFlHWw6IskUwt89RWl8suX8Zj2Mzgc3mVS6fgWO4Wu0U6un5VM6643EhIRq/Xs9PVrs9iIzgS4dGHHE2V/Nk0WvraNU5Ce0PCwiz2bOAkBga8WkOvmruQPaxKZdoC8S48AR1j5AZUO7kRUkVUw0lZAZnIcwG2BzVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iGM4uBQX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so272711666b.3
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2024 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728028764; x=1728633564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a9xkSiSTN7Mdiq/lC2t0YKzYi55t18sJaHKpibV+2us=;
        b=iGM4uBQXDwdMoHQhY4gTEhrEair8eN8SoaOuX4djFM0IJSRMzx0t9x35qIKECeyzRr
         UXpSqMWPbIr1lEfwMFfAHTT+HckYe7psBlg9OQREM/fe9EQ9eXdfv0r4djhNvihH+3k8
         /CH7aRoQuAwkS9+N5Gyeq+cwwRRVm+2tXP9csti7wqf+GHy4TIrdHOuz3lwScnIMSCTt
         14AuUpry0x/6GiSDRfV5/dWpiXPB2dAZfscnh28FoolHt5xvRJsJhkfJvtgDE1C+6EmM
         OFDiAl7OBJ66c5/UcdpCxy+h2Hlc0NYBSZ+IapSeYYH2wZ3pHzBGR6yZQP57Is0LVj9R
         HnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028764; x=1728633564;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9xkSiSTN7Mdiq/lC2t0YKzYi55t18sJaHKpibV+2us=;
        b=I5KJcBymCWwNCA9sArkgJMoV6RqWOycQZGf7PcN86bniF64ivPwMIna2RucaUbpFEb
         mIeE1KnUL3UYnjdEQhsXLBI+pQGcc6ytoAH2iMhwLe/sojc/s0sHr2qJ3zxmyQMjAkyV
         8BRTAjP5x7p6OqtWwwTwHef3GA8xpp01N4ksoAMeVYB87RC4zP0iyqY9GZ76mNhNw1vT
         yPZ1josUzTy5FjTB+WVaWMeEdN9fh3Pd7MsHfFtUIug3OJ/iT98ExUlr63uek1i+dG+y
         RmRz+RsgF9kQx4NVxASPNL0CiGlmf3Ju9J4XlsUA9fvbOiRG1ZunzwogLRaEJ/mwco0R
         tspQ==
X-Gm-Message-State: AOJu0Yw8mu0HpMpZ49tlNvdpxiOSZr1Agi6BuEZ9EKCiF6AEO01p510z
	HucfmkpcAvRqwehuKeTD2YKt7LsXjj40Qr4+xnpbXd2VLpb4YDlWcxErorjFVIM=
X-Google-Smtp-Source: AGHT+IGi65LrEn++tGUxELuE3l6bAxj+Xky6ZrhA7BzvQXLBYHw66QIj/n/EV3yK3W5lT2tyP5WlPA==
X-Received: by 2002:a17:907:7290:b0:a8d:439d:5c3e with SMTP id a640c23a62f3a-a991bd684abmr147966066b.30.1728028764376;
        Fri, 04 Oct 2024 00:59:24 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910286fd8sm187266366b.27.2024.10.04.00.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 00:59:23 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/4] leds: bcm63138: Add some new bindings and code
Date: Fri, 04 Oct 2024 09:59:21 +0200
Message-Id: <20241004-bcm63138-leds-v3-0-ba99a8e464b9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFmg/2YC/3XMSw7CIBSF4a0YxmK4F/rQkfswDihcWpJaDBiia
 bp3aUdq4vCc5Ptnlih6Suy0m1mk7JMPUxlyv2Nm0FNP3NuyGQpU4oiCd+ZWS5AtH8kmDp2pnAK
 jGmNZMfdIzj+33uVa9uDTI8TXls+wvv9KGbjgBirRNiBRaXEe/aRjOITYszWV8ZO3vxwLd7XWy
 ipbk8MvvizLG1ormOPqAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

This brings over the few know-how items and little things
I found about the BCMBCA LEDs in my previous duplicate driver.

This was tested on the BCM6846-based Genexis XG6846B.

The main addition is the ability to define the number shifting
bits in the serial shift register which is necessary if the
previous boot stages have not set up the hardware properly
before.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Mention in the DT binding that hardware defaults will be used if the
  property is missing.
- Link to v2: https://lore.kernel.org/r/20240928-bcm63138-leds-v2-0-f6aa4d4d6ef2@linaro.org

Changes in v2:
- Drop the u32 $ref in the schema, -bits is a standard suffix.
- Fix algorithm for shift register configuration.
- Fix spelling errors and numbering errors.
- Link to v1: https://lore.kernel.org/r/20240920-bcm63138-leds-v1-0-c150871324a0@linaro.org

---
Linus Walleij (4):
      dt-bindings: leds: bcm63138: Add shift register bits
      leds: bcm63138: Use scopes and guards
      leds: bcm63138: Handle shift register config
      leds: bcm63138: Add some register defines

 .../devicetree/bindings/leds/leds-bcm63138.yaml    | 11 +++++++++
 drivers/leds/blink/leds-bcm63138.c                 | 28 ++++++++++++----------
 2 files changed, 27 insertions(+), 12 deletions(-)
---
base-commit: 5724faee6be4109d7a3168625357e4127f42b5d2
change-id: 20240920-bcm63138-leds-1bc5f41c47cd

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


