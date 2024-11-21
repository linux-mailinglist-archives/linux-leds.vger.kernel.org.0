Return-Path: <linux-leds+bounces-3422-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B649D5115
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 17:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4320DB29E63
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 16:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F8B1BD031;
	Thu, 21 Nov 2024 16:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="LNZ+IUTU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A43219E960
	for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208319; cv=none; b=e6ln6UV48XeRQm9QAHXjJlYqQWpc/a8lXgY8GuiUl2Z56nEcHnh5UfCouZFmMuEMEYH+8COT4qQ1kDPLastx83QkYxhyUQa0NzKnkN0NM77R0DqJjRqYy23oVt9PJ1woAx8uU4XW9Umj+vrGjYC4wCSH11SVzDPumPNqN7Ne2tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208319; c=relaxed/simple;
	bh=abhX0e8c7pOXK+VqgphQUVBQ5sBLa4mph2cyW0j392o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=PGbmzswi2qG1E63rfrm+6FAnx+fH2lQQMAutPj6QuKTuOFfHnRQRqJ+in/CZHlSMYAV+5YmSQg1F2tUIRBOCEGZmMnvh0p3AytQr5JxMnactz6JzjqBC8PLet+NnljRqETTNTMTllC5jefFrQSV9C2vt3Zf/+XNQ4sgnME9Xp68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=LNZ+IUTU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa1e51ce601so229368366b.3
        for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 08:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1732208314; x=1732813114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv4wgISV7HkP4RZ5WKLIykwWASiXxKHjaIhIuwDJQRM=;
        b=LNZ+IUTUmCoCGKr065Iy/UutFnhkel56puHGON44iSiDL6obq9SkM30Hq8Tww20FHW
         QWcMELGfb2gi0QWuxbF98nChXWWgHG7zzNgtOXcWe9OxSdLJ02QiQeNX/50bRK4Y8UND
         al4kJP8YZgwVhqVGp237WW4ZqA5KOW/wbfX5reixyeYa2q5LkkRhqlw19L6Yrbkoj9Ij
         HWOQkqi3XAN0AEjmij4xid14kXpTw0ILDwXl72Zk9eBBLkt17iqbgfDe5mW4svpZj7DU
         Ax+7eDIhC1HP4dc+Mcj8aavXFdU/pfxZHM6OsoaUsJYRTFs7zymUuILlCl/dxtksMwx2
         PuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732208314; x=1732813114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv4wgISV7HkP4RZ5WKLIykwWASiXxKHjaIhIuwDJQRM=;
        b=g3lha15hD6TWE64fDXYOrFB5x2p3emXT9yAnbWwUBaX7LyJdsRETtx+fZKgXjLbW2q
         M7oSumH4wZbbBkS5TsHNkZEqA+AyklGHWzoynaxY3dOjpn2fh03JklcoUGpPv+s5fO6N
         8VjAUkiYwWweE5dul8KNBg88h/tpJvULCVrI0MGjuAJRh/JXJ5aL7BDUK1xE6ZqTMYr+
         hvoQpZRtKzQL+O3KC/908GA+0Bc7m18UbZmZOMG10i+AnrZDpALOcujlU+amssQyj82o
         MQfaGZnn1k3miGKC7hhR1aOBYnUW4SM1cRKQgcsgMAaDfY19ys+6u/lSog/ozb4G5jsO
         JmIg==
X-Forwarded-Encrypted: i=1; AJvYcCUoO3a6oFy7Ma02UAMAGGpwS28Xrlmk11Cn1az/RGnItQLAmxek+unSy3cJcD6IIWQ6Bz8uzrPP3eh8@vger.kernel.org
X-Gm-Message-State: AOJu0YzB6GYVQmImuGX2fELbjAyyldaSY+kXRNdpVTXgqUdtBtypvX9/
	k6w5Gc/xVv2qDshf7GVS8jO3U088qIiklU0dN0CVjsC2Q37Kfhew0QV7tgNjijPQe/AipmQLBbz
	qfhVHlIybJ4JZTpNbS2+lUclXrj+P+ctUQWlSzEWXTFbtO19jTf4xCRSh+Fql9g+a3O33yqcJwD
	0K67rKQ5CbJ65wfiRJhNa3TilimCV89Os/DvW/KA==
X-Gm-Gg: ASbGncvbYNEo9rLDgPPwPbH3oEVTuCN/pXdG3DrzV8DcOLq3w2Ev/8+BprKsjNGHwKt
	xDdephSd4Oaem44GW7NpzIWe3GNxbkssah8ZuGGZTMoUYEJsmJTgDda6YhanZlxqeKXJCE8DQDR
	Daw/+IBXJ++veEZdUuP0d/o45Lie9bR6lp3710ms3soDJbGQIQBIG+0zYmiV1idjeqjfo5+0pg/
	VlgpQmyxFFpjg2Cs9hNvBknY6vgjDCZ1KCLE3jhr8Zhq3x/SkxrmQTQbRtZkwfIrQrJ0TX4+GtD
	T+J0Ckdi34uKbsbvKLhX
X-Google-Smtp-Source: AGHT+IG8qI4Ldy/CPpK41Muah+dnkVTCgnCKbuDjqWU0JiNZ4vuj5vyaOAZBfib8+IrwqlaHQZFVtA==
X-Received: by 2002:a17:906:6a08:b0:aa4:9ab1:1982 with SMTP id a640c23a62f3a-aa4dd548167mr672887466b.4.1732208314370;
        Thu, 21 Nov 2024 08:58:34 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f41536d3sm101502766b.24.2024.11.21.08.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:33 -0800 (PST)
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
Subject: [PATCH v9 0/3] Add LED1202 LED Controller
Date: Thu, 21 Nov 2024 16:58:22 +0000
Message-Id: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
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


