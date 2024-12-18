Return-Path: <linux-leds+bounces-3658-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE29F6D0F
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 19:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05BAA7A032D
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 18:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652911FA8FE;
	Wed, 18 Dec 2024 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="vkhqPFhR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D291FA8D9
	for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546009; cv=none; b=qfDj0OCs693rnfoBMsPlJ1Z+mlVca6ioyrzPZqkYXmYI2+iqSylhihaPtLB3gCjYdARQG8sa8QA6tGHWKE6FQLsNLrRPVVrb+yW5ctHutJTL+QIA5g6nC/88LU9W/xMIgnDnUPjo9D/qZb6M8CDJlwvmThz+ecR+V68c541ihbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546009; c=relaxed/simple;
	bh=SKp1CKZ98gVj4Qino0z5TkrMc+vypYi8YZCNpacKhDk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=J9OSSB/hWSv+iCYwpuvof+WP8CkM/U/H5PlKuXNW1V1Wx8TO8FS7i4lV337oM1NGxEpSCpGqYw62zhY/HUfI0YOSGbYfgL745mTydy3BWtH1B91Qg3KeruFm47v1l84y69QsYv6iao1q7LD6p51YuCkrARm/DN6+TxnMlEjNIHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=vkhqPFhR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aabfb33aff8so401366b.0
        for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 10:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546006; x=1735150806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqzSrENGtWAR2a8C7yFu2HrvrWChqZbyXIZeob+iejs=;
        b=vkhqPFhR3CidX7AHvF6rimxu1Hrvs0EUaWW5En7t2YOSHkhIkvGcvuyPGZIvWMnzsE
         fn3+4qfDhIMDEF2ZWcBUeisOWeLI5fr2nw+6PDk8fS6BZAv5dW9oQitzD3DP1NndTc6a
         k597FMWss0YVud5eNfmXSo/a+mdURs9csaCTXinywdX/FKgzU7JiOKxI7r47Fii6VOVx
         lbfdzdPYKmg/m4cLfyy3qi7zRtkTXySFF88imBYgcw8FeR+Z+ahXd8LFhECDe/unqc7g
         rVGV1Uwi57ICg+HjvaGpYWANcLvN5yyHrcUa3qQid4s0f+emS+AwhsyzVt/4WYMTlyOB
         NHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546006; x=1735150806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KqzSrENGtWAR2a8C7yFu2HrvrWChqZbyXIZeob+iejs=;
        b=vBTVQ5fW6TyUw3Hr8xCjbBfSuna8MPF2ufdfHUOCZP8sbrK8X4bzyZTtMF6BZkGppA
         CU8ANTIYYe99xb+HyR/z+oW8TbOj8hV8OkvR+4H6GoUnIQ5ikXk54zIlM0HF5nLXfDqn
         iVJj04QulYJchzgyqPpwAcpJO2WSsOGWKSDqy7ZODVD8Qsk278XBCdcsNWVRbZ6PaFwg
         Q7oRLQE54Yr1J1+nD/vhOC5PedCsAEdYxvFAMrrdZJJyP+8G+5SJFtLPMqKhEOyhhXnH
         mOQm/M1n2mkNPAGQuaTaX0ATGPGTw3lzd8gSusk0zBa0oKvem9Em9dMI/eBE69M1X8Zy
         OJkw==
X-Forwarded-Encrypted: i=1; AJvYcCWyILd7hh4mrF0H17X9p9GWSR5Ji1baYUx2qFFDROtp2Qw77oosfl0KzGOKAgmXuUL94qnEJiQz+Hj/@vger.kernel.org
X-Gm-Message-State: AOJu0YwDt5sEl3VSMFyDJjcVw8FiVFdVRvFrFqcUkZLUEkibrd0tu8ID
	CbhVvSDsJ6iAO1MZdIcefI2PutXrK3pBCxSeU9veP3hJYW8p1h8SsthmUkDRf3AOY7kfxu9D261
	ANx2ASbylQJgJhf6mQYNX/xwVelkp7AI5OXJOeVQJx3D51vQdsaT83hid5ubfUYZM5UYHQhBTiI
	e9fnaE+3GYt6sAHD6FeLmJNYYx
X-Gm-Gg: ASbGncsVukAcTc7Lf+KbBUhvB4iGXHbNFsXTFGrIiS5Ws1OMwNC+veo45Eq5WXRNXSl
	pD1hTbmjYWKtCqKfTXXvrVFZmeEn0sg8aCyeujIApJXD/xlsgFC+RgGu7nlFQUfzJLoKxuACGiX
	ykXofBUYHB1/GHzUBL2Uo/wSuU9quoJo3HKiGXk+k/OkUETfo0HmN3A1SCOD0kWQajjhF4ymhBg
	UfAnwWz2m/zJzgHNwPJ8lXe9m08xNlDGwk5vRJ9d3WlP1EwzVM0C9Qog00UDjNM/aSlc02UGvpT
	wcwUExKZ26QfL7L5T59b+MHFe8wVq3er
X-Google-Smtp-Source: AGHT+IGH27YVpJ1+J4fUBlkUj1WKWmKOKWswJoi0bT1rgk6g/F0vJQWolR2+mDloUleXio5zmRansQ==
X-Received: by 2002:a17:907:608c:b0:aa6:6885:e2f8 with SMTP id a640c23a62f3a-aac081bdeb5mr26504266b.28.1734546005232;
        Wed, 18 Dec 2024 10:20:05 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359fdfsm584825066b.93.2024.12.18.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:20:04 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v10 0/3] Add LED1202 LED Controller
Date: Wed, 18 Dec 2024 18:19:52 +0000
Message-Id: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED1202 is a 12-channel low quiescent current LED driver with:
  * Supply range from 2.6 V to 5 V
  * 20 mA current capability per channel
  * 1.8 V compatible I2C control interface
  * 8-bit analog dimming individual control
  * 12-bit local PWM resolution
  * 8 programmable patterns

Internal volatile memory allows the user to store up to 8 different patterns,
each pattern is a particular output configuration in terms of PWM
duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
common to all patterns. Each device tree LED node will have a corresponding
entry in /sys/class/leds with the label name. The brightness property
corresponds to the per channel analog dimming, while the patterns[1-8] to the
PWM dimming control.

Vicentiu Galanopulo (3):
  Documentation:leds: Add leds-st1202.rst
  dt-bindings: leds: Add LED1202 LED Controller
  leds: Add LED1202 I2C driver

 .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-st1202.rst            |  34 ++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-st1202.c                    | 416 ++++++++++++++++++
 6 files changed, 594 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml
 create mode 100644 Documentation/leds/leds-st1202.rst
 create mode 100644 drivers/leds/leds-st1202.c

-- 
2.39.3 (Apple Git-145)


