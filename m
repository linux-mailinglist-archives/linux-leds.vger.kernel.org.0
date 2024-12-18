Return-Path: <linux-leds+bounces-3663-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B499F6D63
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 19:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90821163FD0
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 18:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C3C1FAC4B;
	Wed, 18 Dec 2024 18:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="dj5TZuUT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE421F0E21
	for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 18:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546849; cv=none; b=V/iYema/KJP2mlExgA4Gy+S+zL437r/TYOJajpQG8WMxEHL3EPafRw3vPn+ToANYDc0Y88miKFMl6c/SkPDi/XzeUXWYS4UMxcx2NA2/a61FQluogiCtKkhJM8BNk+DEsy/dY1lQ72uSZ935FIWVUTnRN0MxrCxAkn/AY1ABmko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546849; c=relaxed/simple;
	bh=ZwPHIRSgcHchgzPbOnE6MDpfrdFaHBQfvVCSdA9Wztg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=AWwP8YOe81xTk/Wh0zIpZ02m/2OaSKD4OK/86u25l7uiFM0MEBxGGjoFI4sfLudhdgEWFMQ6kajSnXEWvjrstTpIjNgz/TDZTQIuWvGuukUIEvgCIGsuRGmQiIsdlN4f358LM6qaOY5e6l73jVJaajhQQna3G4nsV5eRz0qk000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=dj5TZuUT; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6997f33e4so1045078266b.3
        for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546845; x=1735151645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKJ9++QatzOVaiEHtQl8i8T+s1fyCP259nh7H9lhb4Y=;
        b=dj5TZuUT1bWeMPqIFttPWQMGgy8uKt4f4/85akmRGokTJ6nd4xrKU9Srwg7g02MW9r
         5oiXV+fvj4YXuS0vXdDi0vklrD1wTWDOP8ff6zijVF0rYpPK6VClmG0HElJogh8TflMg
         bJAWzQf7eKR6YlU8hsz4xGgatdzsZ0ogOQih1rsp02I8L1VdjgJw2rWnfYY0XfSDy9mi
         4XJUiDGdDHDb8LfJZPn0x0W90Vyx3TC1sbTJX1KvEPNipt9fFxMv7u+mF0PuWVzkf9Pr
         FzSVirsfnySRHOKEPr0sxo1fAO/IWyhUzsSjG16bJaihRkGwD7i7jbIlRbbhG+talJnH
         RkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546845; x=1735151645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKJ9++QatzOVaiEHtQl8i8T+s1fyCP259nh7H9lhb4Y=;
        b=f5GkIZK7MvZoHHt4KQzjQ10louF3sXt5ZvcZIrNBnyTsoQ7ab/xMcEgW0YbG6iIg5t
         LigK3CDlhbBvRXfQ0lJr386he5JIWSJyQxzk3nv3JnKzv7lPd0EA5p5qljQ46Po/1mYv
         U14cHh3Pt7WM3RtBL7Slsfs8ZOSW3ViaEHpohAhDkRZZ+qbpVoShZCb7Dg98GzMAyTMI
         wkgPH16YIbc89clL8vR6qVKD0Q1M6kGldccQA3OCgpCt9FTaw/OwS8ervXJP/mh6J2Gx
         iEaKc9xfHHQPvo2QLRezWBuyqpQaUUppj2a8Cse+hllj5c0Jyj9/d3/IUwxl3IzYpxGm
         vW+A==
X-Forwarded-Encrypted: i=1; AJvYcCXSp5jvuDtx2pC1kmG/ZBipf2+jAopliBD4A+AMvlWN6BO9kVlA+vqfuvThb3x+ECYFqF96fVuOGH+o@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJlnyxY4bkaHAPsCzvgZnXAN2HfEcJTNqClf7kIWe8zJM8h/Q
	gCdIak7nzZYh1BIk4rL+4XNK8A8Tm7Rf83vvOzaSKG0ktSfxFCN1S6SEEnQQP5tYvORo2dqFgYl
	WaxjZS6+5mVGxmEEA2XGseCoOgG+zpjUfXcsWNed0wGfoPP6yddcmPgp4MPm6TrPKynkU1pKAie
	sqC+ITNY1wFifBChG8v7imGYWiYq51HlYOVxhmsg==
X-Gm-Gg: ASbGnctXBp0x8f6cQ4D7YrWcpiSMiun4Rjj1PlDNEJ7kAbPMwWK0Qny6uDGGNNtWzoI
	Jj2cT+tL6PPCfB34tz4FcBqviGqtfsq67lanVF1HawH1Bdda2pw6KjCAjYhCIM1Idheo6ZRKbFS
	TbgDJhvqkjbJNlRlczczj5GBLfkY7f02a8XQft3bDpoWrJ0kf4/eeg++FsQSnYagMxu3MvE9iN9
	U48e7fJLVfJHQkoMlq2IAJDWddLR2hm1mlY7+BtR7xDIW/tVqBQGLiaIvEYIUeWMJeyHaIgUhdo
	X/PyEt5AIsf+RQvWk9jOH7+WQ355OhOUdVnopOU/z6m49160rm//FblfnsivzY70O/7uRS5CMI7
	z
X-Google-Smtp-Source: AGHT+IFgz4oTm0bhEwShmLzCO68c9ozstI4NZkAOdhWqnPdWVYPEqC37W2hJWwY67bQN+jIYR8b3Gg==
X-Received: by 2002:a17:907:7813:b0:aa6:81dc:6638 with SMTP id a640c23a62f3a-aabf47573c0mr369610266b.16.1734546845193;
        Wed, 18 Dec 2024 10:34:05 -0800 (PST)
Received: from localhost.localdomain (ipb21b247d.dynamic.kabel-deutschland.de. [178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec53sm583873366b.156.2024.12.18.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:34:04 -0800 (PST)
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
Subject: [PATCH v11 0/3] Add LED1202 LED Controller
Date: Wed, 18 Dec 2024 18:33:56 +0000
Message-Id: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
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

---
   - Changes in v11: Add version history

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


