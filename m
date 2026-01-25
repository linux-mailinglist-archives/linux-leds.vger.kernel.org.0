Return-Path: <linux-leds+bounces-6727-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I1kKvYddmn2LwEAu9opvQ
	(envelope-from <linux-leds+bounces-6727-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 14:43:18 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 147CC80BF2
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 14:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04F4430038FA
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 13:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53DE1F131A;
	Sun, 25 Jan 2026 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTjBm/Yn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22731A7E2
	for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348594; cv=none; b=hON3BU5OmN63b4E3XLYVsTY8Ca4PoWgpgHn2N5oZXVz+x9iMOrrTiatevHSKK04j+HWPx901xecxgEKDZ9Z8dZgyUL2qkAfkh1zQsTDg/csUsDjVV99yMo1Q0bWWf5qFdyWDY3x0/NliTKGxcgwz11UGhdY+mOKH74jXFbT8E1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348594; c=relaxed/simple;
	bh=JJjtH9otRLzOZRR9aD+dplHYB+LHXNglPxedcB5O3Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=neQlQZU0/CIuujl5HHvnClMmEidtVo/g2IZbmUxaY8xfT7SsoxBR372qqiO0jZZG4MGxXiigd0DFo6jIKEjKat5OxlgsqVyCDC+HPlwYaoHGkO9JmRU+8M9Ce6yNHfmQiELfOjxTsCO1+452KIByku9CLxPWALbwjQhUK8oxR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTjBm/Yn; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43590777e22so2147765f8f.3
        for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 05:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769348591; x=1769953391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NUf/i0X9PwsOhEP5BF7TGftifUEandWRzmLdR3A48k=;
        b=MTjBm/Ynp16NWWrM8ZY/wXQXjKbs4ihg+0O25nBNys6RA66yKbbXtSoXMG84R5NvKn
         St/U8M8lhig+j+WOEsDASNef8CFFAl1+fQLDWlH334PgF987zQvyrPw/7qaEkZ1LQM19
         Dz67Lp7engVYWNksAoM7P3eQiYpzS0xrMn5TLppZQXdDUZ4Iai1Y9jgAWC1b30feZxdR
         qkhRD5GlkLSgUhH8L14n4g1vwCtr/BTDebW+9EvYyBotkpb2zNQSWv72msaFqsO+HFUN
         DvYOr9tsMhUw8SKJSluK5ZFozXPppPcjKtXjPrDkzs8sY7CHttUxWd3+tH/S7qA8C/6E
         3o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769348591; x=1769953391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NUf/i0X9PwsOhEP5BF7TGftifUEandWRzmLdR3A48k=;
        b=aa0eJAvJqp5IwjbfjxSSm28RiQp1jLbCATbtBUlM8mOfL4ij67mK4v5spvnV6t+thv
         Cp8ypW4P4BvSqHm6K1g/UIQMIb4W7Xy/qOZrPVeqaSeMHIXz02thTkjzV1lvnNM6tIwD
         CSjEbOtQtgDJFN7FgH8d64iG0nR9VxyEKDTW8pKOspOEr+udSsSBA1RTthJyZXmCR0vd
         LmsnnVdWiwz4NXYE3luk8Lzduk3BfpESQBfuiTXzswNvmQ/uXN59Q8O1n5J4gPREbBMu
         HZhWvUlqEk/aivkSpSlobraBJqTGgktPPuO7L7RCbkgqfBs6HLwFr6Lkjx2CKTpOfEUx
         r3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWwfyz0WeBYG34o39pnjuGJ6Nvmzo2pO+IHOKOn2C2L+o44jufaibp/DFo98OfRFum4ygUbWLNvy4Pa@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf5z7Sa9a5hNewPK29lIgBcGuB8bAd+yAnNnLJDX1hpAqvZ8IH
	LSM9qBb+h5efubyKRF5ZWoaDFLhZZnzcXX5Db3hU9MM03P2einfy57R3
X-Gm-Gg: AZuq6aLdu5NXDiSnA0IGILaO9gDmwcY7Fg/zxjl8EvLQ7j6I+hj8nljPJpyZdfu002n
	bnfA2Ej3R1T89DctMl8ErXR9bJm+qXyWkAwtzgj1wE518xd9o0b2n8vE7+Z2gHG5j3mXOu4iS7a
	ZtqFuW3iRTOv7hBG01A4mykTKRWQ7u3s+s8kRAKXBlhFQoabtzB3tICQKL1jwrf2PIzuScLEmpU
	GqQQHSv/RU2OwOHkRT29zCJan2xbiyuZ10UoME7sAu6ESh360xSxLbrYswbQJAm9FC1+gspqu8h
	SfIkjMnaK+tRjcbaHFI0EV8nwPyvTf3J3kMw102V4K1qRZAxAxoT9WwXaMq2jnDQvLmgt7/W3FI
	Q8LHYWnqsLbBVVkhOdaN09WBajpkxQ+c2/4jy9DAK5eqRA/6X83ZUNpgS5D1Tz8arLPH4nGPko1
	Sr
X-Received: by 2002:a5d:64c4:0:b0:430:f40f:61b9 with SMTP id ffacd0b85a97d-435ca0d3e4emr2467557f8f.4.1769348591411;
        Sun, 25 Jan 2026 05:43:11 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 00/10] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Sun, 25 Jan 2026 15:42:52 +0200
Message-ID: <20260125134302.45958-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6727-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 147CC80BF2
X-Rspamd-Action: no action

The initial goal was only to add support for the CPCAP used in the Mot
Tegra20 board; however, since the documentation was already partially
converted, I decided to complete the conversion to schema too.

The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
from TXT to YAML while preserving the original structure. Mot board
compatibility was added to the regulator and core schema. Since these
were one-line patches, they were not separated into dedicated commits;
however, the commit message notes this for both cases.

Finally, the CPCAP MFD was slightly refactored to improve support for
multiple subcell compositions.

Svyatoslav Ryhel (10):
  dt-bindings: regulator: cpcap-regulator: convert to schema
  regulator: cpcap-regulator: add support for Mot regulators
  dt-bindings: iio: adc: cpcap-adc: document Mot ADC
  iio: adc: cpcap-adc: add support for Mot ADC
  dt-bindings: leds: leds-cpcap: convert to schema
  dt-bindings: rtc: cpcap-rtc: convert to schema
  dt-bindings: input: cpcap-pwrbutton: convert to schema
  dt-bindings: mfg: motorola-cpcap: convert to schema
  mfd: motorola-cpcap: diverge configuration per-board
  mfd: motorola-cpcap: add support for Mot CPCAP composition

 .../bindings/iio/adc/motorola,cpcap-adc.yaml  |   1 +
 .../bindings/input/cpcap-pwrbutton.txt        |  20 -
 .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
 .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
 .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
 .../bindings/mfd/motorola,cpcap.yaml          | 389 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 .../bindings/regulator/cpcap-regulator.txt    |  35 --
 .../regulator/motorola,cpcap-regulator.yaml   |  51 +++
 .../devicetree/bindings/rtc/cpcap-rtc.txt     |  18 -
 .../bindings/rtc/motorola,cpcap-rtc.yaml      |  32 ++
 drivers/iio/adc/cpcap-adc.c                   |  17 +-
 drivers/mfd/motorola-cpcap.c                  | 134 +++++-
 drivers/regulator/cpcap-regulator.c           | 105 +++++
 14 files changed, 791 insertions(+), 192 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml

-- 
2.51.0


