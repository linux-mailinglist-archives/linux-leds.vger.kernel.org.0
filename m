Return-Path: <linux-leds+bounces-3414-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467969D141C
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 16:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E75731F224E0
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 15:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441A61AED3F;
	Mon, 18 Nov 2024 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="YfUeZ2P5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833551ACE12
	for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731942773; cv=none; b=SQXAaO7X95ot5VE6JKKpKvWfzEeCm6pq47Az+091mYTgTTv4ikplsJUgnOGuxY+LhMqIqgj1Eiwz3dMg26PD4ikgWwS3WNs0eXVrDpEE+Ns52nVeSKOupJi19v65DD4r/0SekX5e4JWhe2pG8vnXdMiG8XqH7RYsOP9ymqB75Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731942773; c=relaxed/simple;
	bh=abhX0e8c7pOXK+VqgphQUVBQ5sBLa4mph2cyW0j392o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=OqubEX1028I9ovxAB0PfcwxA3Pn0J/msgcO8BTRwd5UAVP9E2HwWOnrOXh68HCfjZVDP2UIOH7H6v2bmqopgU1Ya1FSAc220/Y4aMgdJuS6BID2t1DQnZi1iChKHpfaNqn37baWLbV6Bbbr6KGwjWDk0GMVxkm/jhphzt+xMQ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=YfUeZ2P5; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9ec267b879so536926766b.2
        for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 07:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1731942770; x=1732547570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv4wgISV7HkP4RZ5WKLIykwWASiXxKHjaIhIuwDJQRM=;
        b=YfUeZ2P5ucb1jQGZw2n1Js5S95flnPM3kKiwvB+5+1yaSafH2k3P9zB1LGroO/lHeR
         Cbd/12Ldkyp2k4+uExiHmxTkEtUqcA5iNRbBMPpe9BiMfUXw12Mce82EoviFao2/Gggj
         TS02UTglSBOiZnbIJwELiy4UGdcLIhNyFCVeb98Q41Q4hz4No0n+k6OU3/VHlEJICF2G
         GAA+wRX2f75e0YwOjKpN6ILTNYtSuCV9RxudEfVNZhuqQJGNoAzMm1vM0KfXVYfH/Ts5
         VN0TiKz9xdvCBct85PdWwbnKlWAg4lCj3QJtXSzjprpYYo/Xe1CyteZi0EtCrk0CdAP5
         xf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731942770; x=1732547570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv4wgISV7HkP4RZ5WKLIykwWASiXxKHjaIhIuwDJQRM=;
        b=jd2aIQcz4uZ5to8ihgOsQplFIT9kD8h2ogJTMgxQoJ9ZJfSSTBfLYthzWXo6OTOq9K
         cV82lxYCainA7hRLHaYs4QIaEPxE5svcuWByY4J5R/5o3wCJOztbSbXaFInT/Cz4C+er
         0t8ZSvh6OxYzBdN/jNnePAiEU0w2K9qsViCic+o0t7gimvSIlVF+E1Tfxwnm7T0zOgsq
         tw4LUj1uzZhOadQSz1baIOi/+VfTj3YuMbSQdBceWJt1VBTjnAQrNaYERcaWoGBJq1pt
         +2Iqzqhuc/bdz8BmsDfSiLM1r8SchwGF7mmQn1+zwkcZ3D4jCnJtTIZSvXwKBq2Tx0Bi
         l25Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWagegFzjN+4oj4m7FaBDS4Y7Jqb8df/YZDDdr23wHJif7WAasHm3jJzA3Rr3Olk2iqjeeZZkkwzUr@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0tSkY8dgYUxWvm1O31Zn8K3k0Cacpm4Y8ZiWmeqVJD+yAq2g
	qyCnNlybEUKFOZ7vIp5Szlv5z5HCWqYG4u1I7ZyhsBvQdf9Rn9VwP6p4+67Ejj9yVpp8Q+xS5GB
	XU8d5L+oQwjSADmcTwpvCCGxUyKBz6vPUAUjiMYaK3ay7sWfwIcZUgfQbOZ2sBnV5dEzRMRZHL/
	24NcufdFUa1r0Ys+KdB0hBTEcI
X-Google-Smtp-Source: AGHT+IF6Rm8MuxsPIjT0zsN40PTQnBeCMXAycI3c/kSxHlnk0GoDUdvZkXlmrMv+2NqSQA5xVb14Pw==
X-Received: by 2002:a17:907:3f04:b0:a9e:e1a9:8ddf with SMTP id a640c23a62f3a-aa483476164mr1190902366b.29.1731942769788;
        Mon, 18 Nov 2024 07:12:49 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd7e7sm548980366b.119.2024.11.18.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 07:12:48 -0800 (PST)
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
Subject: [PATCH v8 0/3] Add LED1202 LED Controller
Date: Mon, 18 Nov 2024 15:12:40 +0000
Message-Id: <20241118151246.7471-1-vicentiu.galanopulo@remote-tech.co.uk>
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

 .../devicetree/bindings/leds/st,led1202.yaml  | 132 +++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-st1202.rst            |  36 ++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-st1202.c                    | 510 ++++++++++++++++++
 6 files changed, 691 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml
 create mode 100644 Documentation/leds/leds-st1202.rst
 create mode 100644 drivers/leds/leds-st1202.c

--
Changes in v8:
  - Add change version history for patches

2.39.3 (Apple Git-145)


